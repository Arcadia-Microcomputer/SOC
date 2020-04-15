`timescale 1ns / 1ps

module Mux_2_1 (
    input i_Sel,
    input [31:0]i_Src0,
    input [31:0]i_Src1,
    
    output [31:0]o_Data
    );

    wire [31:0]mux_Src[2:0] = {i_Src1, i_Src0};

    assign o_Data = mux_Src[i_Sel];
endmodule
