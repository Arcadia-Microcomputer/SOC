`timescale 1ns / 1ps

module PCAdd(
    input i_ASrc,
    input[31:0] i_A0,
    input[31:0] i_A1,

    input i_BSrc,
    input[31:0] i_B0,
    input[31:0] i_B1,

    output [31:0] o_Sum
    );

    //Input A Mux
    wire [31:0]mux_A[1:0] = {i_A1, i_A0};
    //Input B Mux
    wire [31:0]mux_B[1:0] = {i_B1, i_B0};

    assign o_Sum = mux_A[i_ASrc] + mux_B[i_BSrc];

endmodule
