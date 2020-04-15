`timescale 1ns / 1ps

module BranchUnit(
    input i_IsBranch_M,
    input [2:0] i_BranchType_M,
    input AluZero_M,

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

    always @(*)begin
        o_TakeBranch <= 1'b0;

        if(i_IsBranch_M)begin
            case (i_BranchType_M)
                BEQ:begin
                    o_TakeBranch <= AluZero_M;
                end
                BNE:begin
                    o_TakeBranch <= !AluZero_M; 
                end
                BLT:begin
                    
                end
                BLTU:begin
                    
                end
                BGE:begin
                    
                end
                BGEU:begin
                    
                end
            endcase
        end
    end

endmodule
