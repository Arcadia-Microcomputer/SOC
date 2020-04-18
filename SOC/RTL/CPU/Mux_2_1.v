`timescale 1ns / 1ps

module Mux_2_1 (
    input i_Sel,
    input [31:0]i_Src0,
    input [31:0]i_Src1,
    
    output [31:0]o_Data
    );

    assign o_Data = i_Sel? i_Src1: i_Src0;
endmodule
