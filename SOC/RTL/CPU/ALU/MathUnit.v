`timescale 1ns / 1ps

module MathUnit(
    input [2:0] i_OpCode,
    input [31:0] i_A,
    input [31:0] i_B,

    output reg [31:0] o_Result
    );

    //The various Math Unit opcodes
    parameter MATHU_ADD   = 3'b000;
    parameter MATHU_SUB   = 3'b001;
    parameter MATHU_AND   = 3'b010;
    parameter MATHU_OR    = 3'b011;
    parameter MATHU_XOR   = 3'b100;

    always @(*) begin
        case (i_OpCode)
            MATHU_ADD:begin
                o_Result <= i_A + i_B;
            end
            MATHU_SUB:begin
                o_Result <= i_A - i_B;
            end  
            MATHU_AND:begin
                o_Result <= i_A & i_B;
            end  
            MATHU_OR:begin
                o_Result <= i_A | i_B;
            end
            MATHU_XOR:begin
                o_Result <= i_A ^ i_B;
            end
            default:begin
                o_Result <= 32'b0;
            end  
        endcase
    end

endmodule
