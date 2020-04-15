`timescale 1ns / 1ps

module StageReg #(
    parameter WIDTH = 32
    )(
    input i_Clk,
    
    input i_En,
    input i_Clear,
    input [WIDTH-1:0]i_In,
    output reg [WIDTH-1:0]o_Out
    );

    initial begin
        o_Out = 0;
    end
    
    always @(posedge i_Clk) begin
        if(i_Clear)begin
            o_Out <= 0;
        end else if(i_En)begin
            o_Out <= i_In;
        end
    end
endmodule
