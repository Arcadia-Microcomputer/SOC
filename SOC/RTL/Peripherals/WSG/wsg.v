`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:41:51 10/26/2021 
// Design Name: 
// Module Name:    wsg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - file created
// Revision 0.02 - mix logic altered
// Revision 0.03 - substantial rewrite. frequency logic, mix logic, bus logic altered. frequency register now works differently.
// Revision 0.04 - another substantial rewrite. no more logic usage bug. bus interaction altered. noise channel replaced with wave7.
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module wsg(
	input i_SlaveSel,
   input i_AV_Write,
   input i_AV_Read,
   input [29:0] i_Address, //meant for o_DBus_Address from DBusTranslator.v
   input [3:0] i_AV_ByteEn, //meant for o_DBus_ByteEn from DBusTranslator.v
   input [31:0] i_AV_WriteData,
   input i_Clk, //Avalon clock
   input i_Audio_Clk, //Audio clock, assumed 12.288Mhz. If it's not this or some multiple of this then ¯\_(ツ)_/¯
   output [31:0] o_AV_ReadData,
   output signed [15:0] o_Aud_Left, 
   output signed [15:0] o_Aud_Right
	);

//base address for WSG.
parameter p_Decode_Address_Base = 23'b11111100000000100000000;

//volume control registers
reg [3:0] r_Volume_Control_L0 [7:0]; //left volume nybble 0
reg [3:0] r_Volume_Control_L1 [7:0]; //left volume nybble 1
reg [3:0] r_Volume_Control_R0 [7:0]; //right volume nybble 0
reg [3:0] r_Volume_Control_R1 [7:0]; //right volume nybble 1

//cycle counter. counts up each tick of audio clock. used to control things that happen on particular cycles, or a certain number of times per sample, like the 48KHz sample rate clock.
reg [6:0] r_Cycle_Counter = 7'b0000000;

//voice control and voice-internal registers
//frequency control. overall voice frequency = (24KHz) * (x/65536), sample rate = 1536Khz * (x+1/65536)4
reg [7:0] r_Freq_H [7:0]; //frequency high byte
reg [7:0] r_Freq_L [7:0]; //frequency low byte

//counts to 65536 or higher, then loses 65536 and increments the wavecounter.
reg [16:0] r_Freq_Counters [7:0]; //channel 7: noise

//current sample tracker
reg [5:0] r_Wave_Counters [7:0];

//waveform registers. 8x16x4 bytes
reg [7:0] r_Waveforms_0 [127:0]; //byte 0. bytes 0, 4, 8, 12, etc
reg [7:0] r_Waveforms_1 [127:0]; //byte 1. bytes 1, 5, 9, 13, etc
reg [7:0] r_Waveforms_2 [127:0]; //byte 2. bytes 2, 6, 10, 14, etc
reg [7:0] r_Waveforms_3 [127:0]; //byte 3. bytes 3, 7, 11, 15, etc

//sample output holding registers
reg signed [15:0] r_Aud_Left_BDomain = 16'h0000; //bdomain: bus domain
reg signed [15:0] r_Aud_Right_BDomain = 16'h0000;
reg signed [15:0] r_Aud_Left = 16'h0000; //inside audio domain
reg signed [15:0] r_Aud_Right = 16'h0000;

//mid-mix temporary holding registers
reg signed [7:0] r_Sample_Holding = 8'h00;
reg signed [23:0] r_Aud_Midmix = 24'h000000; //register is reused. one channel is updated, then the other a couple dozen clock cycles later. should be fine?

//audio output assignments
assign o_Aud_Left = r_Aud_Left;
assign o_Aud_Right = r_Aud_Right;

//chip enable.
assign w_Chip_Enable = i_SlaveSel && (i_Address[29:7]==p_Decode_Address_Base);

//data output assignment. zeroed unless WSG is being accessed.
reg [31:0] r_AV_ReadData = 32'h00000000;
assign o_AV_ReadData = w_Chip_Enable ? 32'h00000000 : (i_AV_Read ? 32'h00000000 : r_AV_ReadData);

//clock domain crossing registers and wires
wire [15:0] w_Left_Sample_BDomain;
wire [15:0] w_Right_Sample_BDomain;
reg [7:0] r_Aud_Clk_Counter = 8'h00;
assign w_Sample_Wanted_A = r_Sample_Wanted_ADomain;
assign w_Sample_Wanted_B = r_Sync_Sample_Wanted_AB[1];
assign w_Left_Sample_BDomain = r_Aud_Left_BDomain;
assign w_Right_Sample_BDomain = r_Aud_Right_BDomain;
reg r_Sample_Wanted_ADomain;
reg [1:0] r_Sync_Sample_Wanted_AB; //synchronizes sample-wanted signal from audio domain to bus domain
reg [15:0] r_Aud_Left_ADomain_Buffer;
reg [15:0] r_Aud_Right_ADomain_Buffer;

//used to keep synth from deactivating when sample wanted is deactivated
reg r_Synth_Active = 1'b0;

always @(posedge i_Audio_Clk) begin
	if(r_Aud_Clk_Counter==8'hff) begin //if cycle counter hits maximum (all 1-bits), reset it to zero and do the stuff that only happens once every 256 cycles
		r_Aud_Clk_Counter <= 8'h00;
		r_Sample_Wanted_ADomain <= 1'b1;
		r_Aud_Left <= r_Aud_Left_ADomain_Buffer;
		r_Aud_Right <= r_Aud_Right_ADomain_Buffer;
	end else begin
		r_Aud_Clk_Counter <= r_Aud_Clk_Counter + 8'h01;
	end
	if(r_Aud_Clk_Counter[3:0] == 4'hF) begin 
		if(r_Aud_Clk_Counter[7:4] == 4'h0) begin //after 16 cycles, aka 100ish cycles of the bus clock domain, disable the Sample Wanted signal so when the bus domain finishes its 1024 cycle workload it won't repeat
			r_Sample_Wanted_ADomain <= 1'b0;
		end
		if(r_Aud_Clk_Counter[7:4] == 4'hB) begin //after 192 cycles , aka 780ish cycles of the bus clock domain, everything there should have been settled down for enough time to pull out the sample
			r_Aud_Left_ADomain_Buffer <= w_Left_Sample_BDomain;
			r_Aud_Right_ADomain_Buffer <= w_Right_Sample_BDomain;
		end
	end
	
end



always @(posedge i_Clk) begin
	r_Sync_Sample_Wanted_AB[0] <= w_Sample_Wanted_A; //cdc logic, bus domain side, step 1
	r_Sync_Sample_Wanted_AB[1] <= r_Sync_Sample_Wanted_AB[0]; //cdc logic, bus domain side, step 2

	if(w_Sample_Wanted_B || r_Synth_Active) begin //start running once w_Sample_Wanted is active, then iterate through all 1024 cycles and stop until w_Sample_Wanted is high again
		if(r_Cycle_Counter[6]&&r_Cycle_Counter[5]&&r_Cycle_Counter[4]&&r_Cycle_Counter[3]&&r_Cycle_Counter[2]&&r_Cycle_Counter[1]&&r_Cycle_Counter[0]) begin //if cycle counter hits maximum (all 1-bits), reset it to zero
			r_Cycle_Counter <= 7'b0000000;
			r_Synth_Active <= 1'b0;
		end else begin
			r_Synth_Active <= 1'b1;
			r_Cycle_Counter <= r_Cycle_Counter + 7'b0000001;
		end
	
		//cycle usage overview:
		//odd cycles 0-15: adding frequency register values to frequency counters
		//16-31: increment wavecounter based on how many times the frequency counter overflowed
		//32-47: mix left channel, volume control nybble 0
		//48-63: mix left channel, volume control nybble 1 
		//64: output left sample, reset r_Aud_Midmix
		//65-79: nothing
		//80-95: mix right channel, volume control nybble 0
		//96-111: mix right channel, volume control nybble 1
		//112: output right sample, reset r_Aud_Midmix
		
		//the below is basically just a case statement
		//but i can't use a case statement, since I want to combine the cases for 32-47, 48-63, 80-95, 96-111 to maximize logic sharing
		if(r_Cycle_Counter[6:4]==3'b000) begin //frequency counter cycles
		
		end
		if(r_Cycle_Counter[6:4]==3'b001) begin //wavecounter increment cycles
		
		end
		if((r_Cycle_Counter[6:5]==2'b01)||((r_Cycle_Counter[6]==1'b1)&&((r_Cycle_Counter[5:4]==2'b01)||(r_Cycle_Counter[5:4]==2'b10)))) begin // mixer cycles. evaluates to true for 010, 011, 101, 110
		
		end
		if(r_Cycle_Counter[6:0]==7'b1000000) begin //move left sample from holding register to final output
		
		end
		if(r_Cycle_Counter[6:0]==7'b1110000) begin //move right sample from holding register to final output
		
		end
	end
end	


always @(posedge i_Clk) begin
	if(w_Chip_Enable) begin
		if(!i_Address[7]) begin //top address bit: accessing waveram or control registers. bit 6 = 0? we're in the waveram
			if(i_AV_Write) begin
				if(i_AV_ByteEn[3]) begin
					r_Waveforms_0[i_Address[6:0]] <= i_AV_WriteData[31:24];
				end
				if(i_AV_ByteEn[2]) begin
					r_Waveforms_1[i_Address[6:0]] <= i_AV_WriteData[23:16];
				end
				if(i_AV_ByteEn[1]) begin
					r_Waveforms_2[i_Address[6:0]] <= i_AV_WriteData[15:8];
				end
				if(i_AV_ByteEn[0]) begin
					r_Waveforms_3[i_Address[6:0]] <= i_AV_WriteData[7:0];
				end
			end
			if(i_AV_Read) begin
				r_AV_ReadData <= {r_Waveforms_0[i_Address[6:0]], r_Waveforms_1[i_Address[6:0]], r_Waveforms_2[i_Address[6:0]], r_Waveforms_3[i_Address[6:0]]};
			end
		end else begin //top address bit 1? we're in the control registers
			case(i_Address[6:3])
				4'b1101: begin //voice control registers
					if(i_AV_Write) begin
						if(i_AV_ByteEn[3]) begin
							r_Freq_L[i_Address[2:0]] <= i_AV_WriteData[31:24];
						end
						if(i_AV_ByteEn[2]) begin
							r_Freq_H[i_Address[2:0]]  <= i_AV_WriteData[23:16];
						end
						if(i_AV_ByteEn[1]) begin
							r_Volume_Control_L0[i_Address[2:0]] <= i_AV_WriteData[15:12];
							r_Volume_Control_L1[i_Address[2:0]] <= i_AV_WriteData[11:8];
						end
						if(i_AV_ByteEn[0]) begin
							r_Volume_Control_R0[i_Address[2:0]] <= i_AV_WriteData[7:4];
							r_Volume_Control_R1[i_Address[2:0]] <= i_AV_WriteData[3:0];
						end
					end
					if(i_AV_Read) begin
						r_AV_ReadData <= {r_Freq_L[i_Address[2:0]], r_Freq_H[i_Address[2:0]], r_Volume_Control_L0[i_Address[2:0]], r_Volume_Control_L1[i_Address[2:0]], r_Volume_Control_R0[i_Address[2:0]], r_Volume_Control_R1[i_Address[2:0]]};
					end
				end
				4'b1111: begin //wavepointer read access. not writable. only readable one byte at a time to avoid the portedness logic usage thing.
					if(i_AV_Read) begin //wavecounters are at bytes 0,4,8,12,16,20,24,28.
						r_AV_ReadData <= {2'b00, r_Wave_Counters[i_Address[2:0]], 24'h000000};
					end
				end
				default: r_AV_ReadData <= 32'h00000000; //if it's not a defined register, zero the read.
			endcase
		end
	end
end

//initialize memories. used for simulation. might also impact initial values on the FPGA?
integer i;
integer j;
integer k;
integer l;
initial begin
	for (i=0;i<=6;i=i+1)
		r_Volume_Control_L0[i] <= 4'h0; //fortunately the voices start muted
		r_Volume_Control_L1[i] <= 4'h0; 
		r_Volume_Control_R0[i] <= 4'h0; 
		r_Volume_Control_R1[i] <= 4'h0; 
		r_Freq_H[i] <= 8'h00; //start with voices at frequency zero
		r_Freq_L[i] <= 8'h00;
	for (k=0;k<=7;k=k+1)
		r_Freq_Counters[k] <= 17'b00000000000000000;
	for (l=0;l<=6;l=l+1)
		r_Wave_Counters[l] <= 6'b000000;
	$readmemh("waveforms0.mem", r_Waveforms_0); //the files are set up to initialize the waveforms to all square waves, but could be anything
	$readmemh("waveforms1.mem", r_Waveforms_1); //square, triangle, saw, sine, etc
	$readmemh("waveforms2.mem", r_Waveforms_2); //waveforms0 is bytes 0,4,8 of the waveforms register, waveforms is 1,5,9, etc. 
	$readmemh("waveforms3.mem", r_Waveforms_3); //each voice only gets 16 bytes per file (16x4 -> 64)
end
endmodule
