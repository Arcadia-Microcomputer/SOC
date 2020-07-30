`timescale 1ns / 1ps

module ROM #(
    parameter ADDR_SEL_BITS = 6,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon R slave
    input i_AV0_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV0_RegAddr,
    input i_AV0_Read,
    output reg [31:0] o_AV0_ReadData,
    output o_AV0_WaitRequest,

    //Avalon R slave
    input i_AV1_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV1_RegAddr,
    input i_AV1_Read,
    output reg [31:0] o_AV1_ReadData,
    output o_AV1_WaitRequest
    );

    initial begin
        o_AV1_ReadData <= 0;
        o_AV1_ReadData <= 0;
    end
    assign o_AV0_WaitRequest = 0;
    assign o_AV1_WaitRequest = 0;

    //The ROM block
    reg [31:0]Ram[DEPTH - 1:0];

    //Initalize the ROM
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h19008137;
Ram[1] = 32'h7fc10113;
Ram[2] = 32'h00000417;
Ram[3] = 32'h03842403;
Ram[4] = 32'h000022b7;
Ram[5] = 32'he8428293;
Ram[6] = 32'h00541023;
Ram[7] = 32'h00241283;
Ram[8] = 32'h0102f293;
Ram[9] = 32'hfe028ce3;
Ram[10] = 32'h00241283;
Ram[11] = 32'h0082f293;
Ram[12] = 32'hfe029ce3;
Ram[13] = 32'h00440283;
Ram[14] = 32'h00540223;
Ram[15] = 32'hfe1ff06f;
Ram[16] = 32'h1900c000;
numRamUsed = 17;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        o_AV0_ReadData <= 0;
        o_AV1_ReadData <= 0;

        if(i_AV0_SlaveSel)begin
            if(i_AV0_Read)begin
                o_AV0_ReadData <= Ram[i_AV0_RegAddr]; 
            end
        end

        if(i_AV1_SlaveSel)begin
            if(i_AV1_Read)begin
                o_AV1_ReadData <= Ram[i_AV1_RegAddr]; 
            end
        end
    end

endmodule
