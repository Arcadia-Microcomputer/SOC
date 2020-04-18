`timescale 1ns / 1ps

module BarrelShifter(
    input [1:0] i_OpCode,
    input [31:0] i_A,
    input [4:0] i_B,

    output reg [31:0] o_Result
    );

    //The various Barrel Shiffter opcodes
    parameter BSHIFT_SLL = 2'b00;
    parameter BSHIFT_SRL = 2'b01;
    parameter BSHIFT_SRA = 2'b10;

    always @(*) begin
        case (i_OpCode)
            BSHIFT_SLL:begin
                o_Result <= i_A << i_B;
            end  
            BSHIFT_SRL:begin
                o_Result <= i_A >> i_B;
            end  
            BSHIFT_SRA:begin
                o_Result <= i_A >>> i_B;
            end 
            default:begin
                o_Result <= 32'b0;
            end  
        endcase
    end

endmodule
