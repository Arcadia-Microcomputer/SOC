`timescale 1ns / 1ps

module IRAM #(
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Word Addressable
    input [$clog2(DEPTH) - 1:0] i_Addr,
    output reg [31:0]o_RD
    );

    //The Ram block
    reg [31:0] Ram[DEPTH - 1:0];

    //Initalize the ram blobk
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h00002083;
Ram[1] = 32'h00108093;
Ram[2] = 32'h00108093;
Ram[3] = 32'h00108093;
Ram[4] = 32'h00108063;
numRamUsed = 5;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end

        o_RD = 0;
    end

    always @(posedge i_Clk) begin
        o_RD <= Ram[i_Addr];
    end

endmodule
