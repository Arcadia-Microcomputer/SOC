`timescale 1ns / 1ps

module PC(
    input i_Clk,

    //Control Signals    
    input i_PcEn,

    //Branch Signals
    input i_IsJump_M,
    input i_IsBranch_M,
    input [2:0]i_BranchType_M,

    input i_AluASign_M,
    input i_AluBSign_M,
    input i_AluCarry_M,
    input i_AluResZero_M,
    input i_AluResNeg_M,
    
    input i_BranchAdderBSel_M,

    input [31:0]w_Imm_M,
    input [31:0]w_PC_M,
    input [31:0]w_RS1_M,

    output o_TakeBranch,
    output reg [31:0]o_Pc
    );

    //BranchUnit Signals//
    wire w_TakeBranch;
    assign o_TakeBranch = w_TakeBranch;
    
    wire [31:0] w_BranchAdderB = i_BranchAdderBSel_M? w_RS1_M: w_PC_M;

    wire [31:0] w_PC_NextSeq = o_Pc + 4;
    wire [31:0] w_PC_Branch = w_Imm_M + w_BranchAdderB;

    initial begin
        o_Pc = 0;
    end

    always @(posedge i_Clk) begin
        if(i_PcEn)begin
            o_Pc <= w_TakeBranch? w_PC_Branch: w_PC_NextSeq;
        end
    end

    BranchUnit BranchUnit0(
        .i_IsJump_M(i_IsJump_M),
        .i_IsBranch_M(i_IsBranch_M),
        .i_BranchType_M(i_BranchType_M),

        .i_AluASign_M(i_AluASign_M),
        .i_AluBSign_M(i_AluBSign_M),
        .i_AluCarry_M(i_AluCarry_M),
        .i_AluResZero_M(i_AluResZero_M),
        .i_AluResNeg_M(i_AluResNeg_M),

        .o_TakeBranch(w_TakeBranch)
    );
endmodule
