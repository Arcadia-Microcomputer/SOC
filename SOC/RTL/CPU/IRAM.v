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
Ram[0] = 32'h00100093;
Ram[1] = 32'h40101023;
Ram[2] = 32'h00002083;
Ram[3] = 32'h00400113;
Ram[4] = 32'h00000193;
Ram[5] = 32'h00100213;
Ram[6] = 32'h00010303;
Ram[7] = 32'h40002283;
Ram[8] = 32'h0102d293;
Ram[9] = 32'hfe429ce3;
Ram[10] = 32'h40600223;
Ram[11] = 32'h00118193;
Ram[12] = 32'h00110113;
Ram[13] = 32'hfe1192e3;
Ram[14] = 32'h00108063;
numRamUsed = 15;

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
