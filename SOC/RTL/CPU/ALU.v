`timescale 1ns / 1ps

module ALU(
    input [3:0] i_OpCode,

    input [31:0] i_A,

    input i_BSel,
    input [31:0] i_B0,
    input [31:0] i_B1,

    output reg o_Carry,
    output reg signed[31:0] o_Result
    );

    wire [31:0]w_B = i_BSel? i_B1: i_B0;

    //The various ALU operations
    parameter ALU_ADD   = 4'b0000;
    parameter ALU_SUB   = 4'b1000;
    parameter ALU_SLT   = 4'b0010;
    parameter ALU_SLTU  = 4'b0011;
    parameter ALU_AND   = 4'b0111;
    parameter ALU_OR    = 4'b0110;
    parameter ALU_XOR   = 4'b0100;
    parameter ALU_SLL   = 4'b0001;
    parameter ALU_SRL   = 4'b0101;
    parameter ALU_SRA   = 4'b1101;

    always @(*) begin
        o_Carry <= 1'b0;
        
        case (i_OpCode)
            ALU_ADD:begin
                o_Result <= i_A + w_B;
            end
            ALU_SUB:begin
                {o_Carry, o_Result} <= i_A - w_B;
            end
            ALU_SLT:begin
                {o_Carry, o_Result} <= i_A - w_B;
            end
            ALU_SLTU:begin
                {o_Carry, o_Result} <= i_A - w_B;
            end
            ALU_AND:begin
                o_Result <= i_A &  w_B;
            end  
            ALU_OR:begin
                o_Result <= i_A |  w_B;
            end
            ALU_XOR:begin
                o_Result <= i_A ^  w_B;
            end 
            ALU_SLL:begin
                o_Result <= i_A << w_B[4:0];
            end  
            ALU_SRL:begin
                o_Result <= i_A >> w_B[4:0];
            end  
            ALU_SRA:begin
                o_Result <= i_A >>> w_B[4:0];
            end 
            default:begin
                o_Result <= 32'b0;
            end  
        endcase
    end

endmodule