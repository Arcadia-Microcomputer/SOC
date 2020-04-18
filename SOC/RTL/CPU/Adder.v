`timescale 1ns / 1ps

module Adder(
    input[31:0] i_A,
    input[31:0] i_B,

    output [31:0] o_Sum
    );

    assign o_Sum = i_A + i_B;

endmodule
