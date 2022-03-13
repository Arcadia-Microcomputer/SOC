`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:46:22 12/11/2021
// Design Name:   wsg
// Module Name:   /home/paul/wsgv4/wsgv4testbench.v
// Project Name:  wsgv4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wsg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wsgv4testbench;

	// Inputs
	reg i_SlaveSel;
	reg i_AV_Write;
	reg i_AV_Read;
	reg [29:0] i_Address;
	reg [3:0] i_AV_ByteEn;
	reg [31:0] i_AV_WriteData;
	reg i_Clk;
	reg i_Audio_Clk;
	reg [7:0] r_Cycle_Counter = 8'h00;

	// Outputs
	wire [31:0] o_AV_ReadData;
	wire [15:0] o_Aud_Left;
	wire [15:0] o_Aud_Right;

	// Instantiate the Unit Under Test (UUT)
	wsg uut (
		.i_SlaveSel(i_SlaveSel), 
		.i_AV_Write(i_AV_Write), 
		.i_AV_Read(i_AV_Read), 
		.i_Address(i_Address), 
		.i_AV_ByteEn(i_AV_ByteEn), 
		.i_AV_WriteData(i_AV_WriteData), 
		.i_Clk(i_Clk), 
		.i_Audio_Clk(i_Audio_Clk), 
		.o_AV_ReadData(o_AV_ReadData), 
		.o_Aud_Left(o_Aud_Left), 
		.o_Aud_Right(o_Aud_Right)
	);

	initial begin
		// Initialize Inputs
		i_SlaveSel = 0;
		i_AV_Write = 0;
		i_AV_Read = 0;
		i_Address = 0;
		i_AV_ByteEn = 0;
		i_AV_WriteData = 0;
		i_Clk = 0;
		i_Audio_Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always @(posedge i_Clk) begin
		if(r_Cycle_Counter==8'hff) begin
			r_Cycle_Counter <= 8'h00;
		end else begin
			r_Cycle_Counter <= r_Cycle_Counter + 8'h01;
		end
		
		case (r_Cycle_Counter)
			8'h00 : begin
				i_Address <= 30'b111111000000001000000011100000;
				i_AV_Write <= 1'b1;
				i_AV_WriteData <=32'hFFFFFFFF;
				i_AV_ByteEn <= 4'hF;
				i_SlaveSel <= 1'b1;
			end
			8'h02 : begin
				i_Address <= 30'b111111000000001000000011100000;
				i_AV_Read <= 1'b1;
				i_AV_ByteEn <= 4'hF;
				i_SlaveSel <= 1'b1;
			end
			default: begin
				i_Address <= 30'b111111000000001000000000000000;
				i_AV_WriteData <=32'h00000000;
				i_AV_Read <= 1'b0;
				i_AV_Write <= 1'b0;
				i_AV_ByteEn <= 4'hF;
				i_SlaveSel <= 1'b1;
			end
		endcase
	end
      
endmodule

