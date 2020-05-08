`timescale 1ns / 1ps

module BranchUnit(
    input i_IsJump_M,
    input i_IsBranch_M,
    input [2:0] i_BranchType_M,

    input i_AluASign_M,
    input i_AluBSign_M,
    input i_AluCarry_M,
    input i_AluResZero_M,
    input i_AluResNeg_M,

    output reg o_TakeBranch
    );
    
    initial begin
        o_TakeBranch <= 1'b0;
    end

    parameter BEQ  = 3'b000;
    parameter BNE  = 3'b001;
    parameter BLT  = 3'b100;
    parameter BLTU = 3'b110;
    parameter BGE  = 3'b101;
    parameter BGEU = 3'b111;

    wire w_Overflow = (i_AluASign_M != i_AluBSign_M) &&(i_AluBSign_M == i_AluResNeg_M);

    always @(*)begin
        o_TakeBranch <= 1'b0;

        if(i_IsBranch_M)begin
            case (i_BranchType_M)
                BEQ:begin
                    o_TakeBranch <= i_AluResZero_M;
                end
                BNE:begin
                    o_TakeBranch <= !i_AluResZero_M; 
                end
                BLT:begin
                    o_TakeBranch <= i_AluResNeg_M ^ w_Overflow;
                end
                BLTU:begin
                    o_TakeBranch <= i_AluCarry_M;
                end
                BGE:begin
                    o_TakeBranch <= !(i_AluResNeg_M ^ w_Overflow) || i_AluResZero_M;
                end
                BGEU:begin
                    o_TakeBranch <= (!i_AluCarry_M) || i_AluResZero_M;
                end
            endcase
        end else if(i_IsJump_M)begin
            o_TakeBranch <= 1'b1;
        end
    end

endmodule
