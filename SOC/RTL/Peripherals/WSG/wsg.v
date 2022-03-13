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
parameter p_Decode_Address_Base = 22'b1111110000000010000000;

//volume control registers
reg [3:0] r_Volume_Control_L0 [7:0]; //left volume nybble 0
reg [3:0] r_Volume_Control_L1 [7:0]; //left volume nybble 1
reg [3:0] r_Volume_Control_R0 [7:0]; //right volume nybble 0
reg [3:0] r_Volume_Control_R1 [7:0]; //right volume nybble 1

//cycle counter. counts up each tick of audio clock. used to control things that happen on particular cycles, or a certain number of times per sample, like the 48KHz sample rate clock.
reg [7:0] r_Cycle_Counter = 8'b00000000;

//voice control and voice-internal registers
//frequency control. overall voice frequency = (24KHz) * (x/65536), sample rate = 1536Khz * (x+1/65536)4
reg [7:0] r_Freq_H [7:0]; //frequency high byte
reg [7:0] r_Freq_L [7:0]; //frequency low byte

//increments by 32*r_Freq, then the top 6 bits are used to advance the appropriate wavecounter by the appropriate amount.
reg [21:0] r_Freq_Counters [7:0]; //22 bits long. 16 bit value gets added to a 21 bit value, resulting in a maximum of a 22 bit value. 
reg [21:0] r_Freq_Holding; //need to be able to do bit selects on the frequency counters, so they get moved here and then the bitselects are done the next cycle

//current sample tracker
reg [5:0] r_Wave_Counters [7:0];

//waveform registers. 8x16x4 bytes
reg signed [7:0] r_Waveforms_0 [127:0]; //byte 0. bytes 0, 4, 8, 12, etc
reg signed [7:0] r_Waveforms_1 [127:0]; //byte 1. bytes 1, 5, 9, 13, etc
reg signed [7:0] r_Waveforms_2 [127:0]; //byte 2. bytes 2, 6, 10, 14, etc
reg signed [7:0] r_Waveforms_3 [127:0]; //byte 3. bytes 3, 7, 11, 15, etc

//sample output holding registers
reg signed [15:0] r_Aud_Left_BDomain = 16'h0000; //bdomain: bus domain
reg signed [15:0] r_Aud_Right_BDomain = 16'h0000;
reg signed [15:0] r_Aud_Left = 16'h0000; //inside audio domain
reg signed [15:0] r_Aud_Right = 16'h0000;

//mid-mix temporary holding registers
reg signed [7:0] r_Sample_Holding = 8'h00000000; //holds the sample from the waveform registers so we can do bit selects with it in the mix stage
reg [5:0] r_Wave_Counter_Holding; //value here here so I can do a bit select to figure out which of the 4 waveform registers to read from
reg [3:0] r_Volume_Control_Holding; //holds one nybble at a time for the sake of logic sharing in the mix cycle
reg r_Mix_Voice; //passes passes a bit from the mix setup stage to the mix stage, so that if volume control n0==n1==4'b0000 the voice will mute like it should.
reg signed [23:0] r_Aud_Midmix = 24'h000000; //register is reused. one channel is updated, then the other a couple dozen clock cycles later. should be fine?

//audio output assignments
assign o_Aud_Left = r_Aud_Left;
assign o_Aud_Right = r_Aud_Right;

//data output assignment. zeroed by the bus access logic unless WSG is being accessed.
reg [31:0] r_AV_ReadData = 32'h00000000;
assign o_AV_ReadData = r_AV_ReadData;

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
		if(r_Aud_Clk_Counter[7:4] == 4'h0) begin //after 16 cycles, aka 100ish cycles of the bus clock domain, disable the Sample Wanted signal so when the bus domain finishes its 256 cycle workload it won't repeat
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
		if(r_Cycle_Counter[7]&&r_Cycle_Counter[6]&&r_Cycle_Counter[5]&&r_Cycle_Counter[4]&&r_Cycle_Counter[3]&&r_Cycle_Counter[2]&&r_Cycle_Counter[1]&&r_Cycle_Counter[0]) begin //if cycle counter hits maximum (all 1-bits), reset it to zero
			r_Cycle_Counter <= 8'b00000000;
			r_Synth_Active <= 1'b0;
		end else begin
			r_Synth_Active <= 1'b1;
			r_Cycle_Counter <= r_Cycle_Counter + 8'b00000001;
		end
	
		//cycle usage overview:
		//odd cycles 0-15: adding frequency register values to frequency counters
		//16-31: increment wavecounter based on how many times the frequency counter overflowed
		//48-79: mix left channel, volume control nybble 0
		//80-111: mix left channel, volume control nybble 1 
		//112: output left sample, reset r_Aud_Midmix
		//112-175: nothing
		//176-207: mix right channel, volume control nybble 0
		//208-239: mix right channel, volume control nybble 1
		//240: output right sample, reset r_Aud_Midmix
		
		//for cycles 0-31, bits 3:1 contain the bits corresponding to the voice number that's currently being worked on
		//the rest of the cycles (aka, all the mix cycles) use bits 4:2
		
		//the below is basically just a case statement
		//but i can't use a case statement, since I want to combine the cases for 32-47, 48-63, 80-95, 96-111 to maximize logic sharing
		if(r_Cycle_Counter[7:4]==3'b0000) begin //frequency counter cycles
			if(r_Cycle_Counter[0]) begin //on every odd cycle begin
				r_Freq_Counters[r_Cycle_Counter[3:1]] <= r_Freq_Counters[r_Cycle_Counter[3:1]] + {1'b0, r_Freq_H[r_Cycle_Counter[3:1]], r_Freq_L[r_Cycle_Counter[3:1]], 5'b000000}; //16 bit value + 32*16bit value (21 bit value) = 22 bit value
			end
		end
		if(r_Cycle_Counter[7:4]==3'b0001) begin //wavecounter increment cycles
			if(r_Cycle_Counter[0]) begin //odd cycles
				r_Freq_Counters[r_Cycle_Counter[3:1]] <= {6'b000000, r_Freq_Holding[15:0]}; //zero the top 6 bits of the frequency register since they should only be used once, for this step, and then discarded.
				r_Wave_Counters[r_Cycle_Counter[3:1]] <= r_Wave_Counters[r_Cycle_Counter[3:1]] + r_Freq_Holding[21:16]; //i really like this one line of logic. this isn't a useful comment (useful info at the end) but it's definitely my proudest bit here. It does a ton of heavy lifting. this is the smallest version out of a lot of different versions of this particular thing that I've thought up. Every previous implementation was long and gross. The wavecounter automatically overflows and everything. There's no checking for frequency counter overflows, no multiple stages to increment the wavecounter, nothing! This one line replaces up to like 80 lines of logic from previous implementations. The top 6 bits in the top of the frequency register correspond to how many times the frequency register overflowed, so how many times the wavecounter should be incremented. Instead of individual overflow checks and increments, the overflows are checked by virtue of the fact that if it didn't overflow the bits would all be zero, so the counter wouldn't advance. The increments are also all done at once by simply adding what amounts to the number of increments to the register that would otherwise be incremented.
			end else begin //even cycles
				r_Freq_Holding[21:0] <= r_Freq_Counters[r_Cycle_Counter[3:1]]; //load up the frequency counter holding register so i can do bit selects in the next cycle
			end
		end
		if(((r_Cycle_Counter[6:5]==3'b01)&&r_Cycle_Counter[4])||(r_Cycle_Counter[6:5]==2'b10)||((r_Cycle_Counter[6:5]==2'b11)&&!r_Cycle_Counter[4])) begin // mixer cycles. evaluates to true for bits [6:4] equalling 011, 100, 101, 110
			if(r_Cycle_Counter[1]) begin //actual mix cycle
				if(r_Cycle_Counter[0]) begin
					if(r_Mix_Voice) begin //if r_Mix_Voice is 0 then the voice is set to mute and shouldn't be mixed into the final output
						r_Aud_Midmix[23:0] <= r_Aud_Midmix[23:0] + ({r_Sample_Holding[7], r_Sample_Holding[7:0], 15'b000000000000000} >>> r_Volume_Control_Holding[3:0]); //the sample gets padded out and sign extended to be practically shifted left 15 positions. the volume control nybble is then used to arithmetically shift back right the sample to reduce the volume. The nybble is inverted in the second mix prep step, so the bus-visible volume control has larger value = higher volume. Since the additional sign extended bit at the beginning exists, a single voice with both its nybbles set to max volume will not overflow when the samples are added to each other.
					end
				end
			end else begin //mix prep cycles
				if(r_Cycle_Counter[0]) begin //second mix prep cycle
					r_Sample_Holding[7:0] <= (r_Wave_Counter_Holding[1] ? r_Wave_Counter_Holding[0] ? r_Waveforms_3[{r_Cycle_Counter[4:2], r_Wave_Counter_Holding[5:2]}] : r_Waveforms_2[{r_Cycle_Counter[4:2], r_Wave_Counter_Holding[5:2]}] : r_Wave_Counter_Holding[0] ? r_Waveforms_1[{r_Cycle_Counter[4:2], r_Wave_Counter_Holding[5:2]}] : r_Waveforms_0[{r_Cycle_Counter[4:2], r_Wave_Counter_Holding[5:2]}]);
					r_Volume_Control_Holding[3:0] <= (r_Volume_Control_Holding[3:0] ^ 4'b1111); //invert the volume control nybble so that larger values actually do correspond to higher volumes
				end else begin //first mix prep cycle
					r_Wave_Counter_Holding[5:0] <= r_Wave_Counters[r_Cycle_Counter[4:2]];
					if(r_Cycle_Counter[7]) begin //right nybble
						r_Mix_Voice <= (|r_Volume_Control_R0[r_Cycle_Counter[4:2]] || |r_Volume_Control_R1[r_Cycle_Counter[4:2]]);
						r_Volume_Control_Holding[3:0] <= (r_Cycle_Counter[5]^r_Cycle_Counter[4]) ? r_Volume_Control_R0[r_Cycle_Counter[4:2]] : r_Volume_Control_R1[r_Cycle_Counter[4:2]]; //bit 1 = 1? nybble 0. bit 1 = 0? nybble 1.
					end else begin //left nybble
						r_Mix_Voice <= (|r_Volume_Control_L0[r_Cycle_Counter[4:2]] || |r_Volume_Control_L1[r_Cycle_Counter[4:2]]);
						r_Volume_Control_Holding[3:0] <= (r_Cycle_Counter[5]^r_Cycle_Counter[4]) ? r_Volume_Control_L0[r_Cycle_Counter[4:2]] : r_Volume_Control_L1[r_Cycle_Counter[4:2]];
					end
				end
			end
		end
		if(r_Cycle_Counter[6:0]==7'b1111111) begin //sample relocation stages
			if(r_Cycle_Counter[7]) begin //if the top bit is 1, we're relocating the right sample to final output. if it's zero, the left sample
				r_Aud_Right_BDomain[15:0] <= r_Aud_Midmix[23:8];
			end else begin
				r_Aud_Left_BDomain[15:0] <= r_Aud_Midmix[23:8];
			end
			r_Aud_Midmix <= 24'h000000;
		end
	end
end	


always @(posedge i_Clk) begin
	if(i_SlaveSel && (i_Address[29:8] == p_Decode_Address_Base)) begin
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
			end else begin
				r_AV_ReadData <= 32'h00000000; //if it's not a read access, zero the readdata register
			end
		end else begin //top address bit 1? we're in the control registers
			case(i_Address[6:3])
				4'b1100: begin //voice control registers
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
				4'b1110: begin //wavepointer read access. not writable. only readable one byte at a time to avoid the portedness logic usage thing and the logic i'd have to write to work around it.
					if(i_AV_Read) begin //wavecounters are at bytes 0,4,8,12,16,20,24,28.
						r_AV_ReadData <= {2'b00, r_Wave_Counters[i_Address[2:0]], 24'h000000};
					end
				end
				default: r_AV_ReadData <= 32'h00000000; //if it's not a defined register, zero the read.
			endcase
		end
	end else begin //if the wsg is not being accessed, zero the readdata output
		r_AV_ReadData <= 32'h00000000;
	end
end

//initialize memories. used for simulation. might also impact initial values on the FPGA?
integer i;
integer j;
integer k;
integer l;
initial begin
	for (i=0;i<=7;i=i+1) begin
		r_Volume_Control_L0[i] <= 4'h0; //fortunately the voices start muted
		r_Volume_Control_L1[i] <= 4'h0; 
		r_Volume_Control_R0[i] <= 4'h0; 
		r_Volume_Control_R1[i] <= 4'h0; 
		r_Freq_H[i] <= 8'h00; //start with voices at frequency zero
		r_Freq_L[i] <= 8'h00;
	end
	for (k=0;k<=7;k=k+1)
		r_Freq_Counters[k] <= 22'b0000000000000000000000;
	for (l=0;l<=7;l=l+1)
		r_Wave_Counters[l] <= 6'b000000;
	$readmemh("waveforms0.mem", r_Waveforms_0); //the files are set up to initialize the waveforms to all square waves, but could be anything
	$readmemh("waveforms1.mem", r_Waveforms_1); //square, triangle, saw, sine, etc
	$readmemh("waveforms2.mem", r_Waveforms_2); //waveforms0 is bytes 0,4,8 of the waveforms register, waveforms is 1,5,9, etc. 
	$readmemh("waveforms3.mem", r_Waveforms_3); //each voice only gets 16 bytes per file (16x4 -> 64)
end
endmodule
