`timescale 1ns / 1ps

module ALU(
    input [2:0] i_MathUOpCode,
    input [1:0] i_BShiftOpCode,

    input [1:0] i_ForASel,
    input [31:0] i_ForA0,
    input [31:0] i_ForA1,
    input [31:0] i_ForA2,
    
    input [1:0] i_ForBSel,
    input [31:0] i_ForB0,
    input [31:0] i_ForB1,
    input [31:0] i_ForB2,

    input i_SrcBSel,
    input [31:0] i_SrcB1,

    input i_ResSel,
    output [31:0] o_Result
    );
    
    //Forward muxes
    wire [31:0]mux_ForA[2:0] = {i_ForA2, i_ForA1, i_ForA0};
    wire [31:0]mux_ForB[2:0] = {i_ForB2, i_ForB1, i_ForB0};

    wire [31:0]w_A = mux_ForA[i_ForASel];

    wire [31:0]w_SrcB0 = mux_ForB[i_ForBSel];
    wire [31:0]w_B = i_SrcBSel?i_SrcB1:w_SrcB0;

    wire [31:0] w_MathUResult;
    wire [31:0] w_BShiftResult;

    assign o_Result = i_ResSel? w_BShiftResult: w_MathUResult;

    MathUnit MathUnit0(
        .i_OpCode(i_MathUOpCode),
        .i_A(w_A),
        .i_B(w_B),

        .o_Result(w_MathUResult)
    );

    BarrelShifter BarrelShifter0 (
        .i_OpCode(i_BShiftOpCode),
        .i_A(w_A),
        .i_B(w_B[4:0]),

        .o_Result(w_BShiftResult)
    );
endmodule
