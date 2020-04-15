`timescale 1ns / 1ps

module PC(
    input i_Clk,
    
    input i_En0,
    input i_En1,

    input [31:0] i_NewPc,
    output reg [31:0] o_Pc
    );

    initial begin
        o_Pc = 0;
    end

    assign w_En = i_En0 || i_En1;

    always @(posedge i_Clk) begin
        if(w_En)begin
            o_Pc <= i_NewPc;
        end
    end

endmodule
