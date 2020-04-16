`timescale 1ns / 1ps

module IRAM #(
    parameter DEPTH = 32
    )(
    input i_Clk,

    input i_RdEn,
    input i_OZero,

    //Word Addressable
    input [$clog2(DEPTH) - 1:0] i_Addr,
    output [31:0]o_Inst
    );
    assign o_Inst = i_OZero? 32'b0: r_RD;

    reg [31:0]r_RD = 32'b0;

    reg [31:0] Ram [DEPTH - 1:0];

    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h00002083;
Ram[1] = 32'h00100113;
Ram[2] = 32'h00108093;
Ram[3] = 32'h00108093;
Ram[4] = 32'h00000063;
numRamUsed = 5;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        if(i_RdEn)begin
           r_RD <= Ram[i_Addr]; 
        end
    end

endmodule
