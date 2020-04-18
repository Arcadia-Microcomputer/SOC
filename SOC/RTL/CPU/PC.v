`timescale 1ns / 1ps

module PC(
    input i_Clk,
    
    input i_En,

    input [31:0] i_NewPc,
    output reg [31:0] o_Pc
    );

    initial begin
        o_Pc = 0;
    end

    always @(posedge i_Clk) begin
        if(i_En)begin
            o_Pc <= i_NewPc;
        end
    end

endmodule
