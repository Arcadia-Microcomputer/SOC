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
Ram[0] = 32'h00200293;
Ram[1] = 32'h40501023;
Ram[2] = 32'h00002403;
Ram[3] = 32'h00402283;
Ram[4] = 32'h00542223;
Ram[5] = 32'h00100293;
Ram[6] = 32'h00542023;
Ram[7] = 32'h00000493;
Ram[8] = 32'h00900913;
Ram[9] = 32'h03048293;
Ram[10] = 32'h40500223;
Ram[11] = 32'h00d00293;
Ram[12] = 32'h40500223;
Ram[13] = 32'h00a00293;
Ram[14] = 32'h40500223;
Ram[15] = 32'h010000ef;
Ram[16] = 32'hfd248ee3;
Ram[17] = 32'h00148493;
Ram[18] = 32'hfddff06f;
Ram[19] = 32'h00200293;
Ram[20] = 32'h00042303;
Ram[21] = 32'h0062f333;
Ram[22] = 32'hfe629ce3;
Ram[23] = 32'h00042303;
Ram[24] = 32'h00536333;
Ram[25] = 32'h00642023;
Ram[26] = 32'h00008067;
numRamUsed = 27;

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
