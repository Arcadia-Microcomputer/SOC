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
Ram[2] = 32'h00000317;
Ram[3] = 32'h09030313;
Ram[4] = 32'h00032403;
Ram[5] = 32'h00432483;
Ram[6] = 32'h000022b7;
Ram[7] = 32'h71028293;
Ram[8] = 32'h0054a223;
Ram[9] = 32'h00100293;
Ram[10] = 32'h0054a023;
Ram[11] = 32'h00a00293;
Ram[12] = 32'h00541023;
Ram[13] = 32'h00040513;
Ram[14] = 32'h00000597;
Ram[15] = 32'h06858593;
Ram[16] = 32'h00d00613;
Ram[17] = 32'h010000ef;
Ram[18] = 32'h00048513;
Ram[19] = 32'h030000ef;
Ram[20] = 32'hfe5ff06f;
Ram[21] = 32'h00000293;
Ram[22] = 32'h00251303;
Ram[23] = 32'h00837313;
Ram[24] = 32'hfe031ce3;
Ram[25] = 32'h00058303;
Ram[26] = 32'h00158593;
Ram[27] = 32'h00650223;
Ram[28] = 32'h00128293;
Ram[29] = 32'hfec292e3;
Ram[30] = 32'h00008067;
Ram[31] = 32'h00052283;
Ram[32] = 32'h0022f293;
Ram[33] = 32'hfe028ce3;
Ram[34] = 32'h00052283;
Ram[35] = 32'h0022e293;
Ram[36] = 32'h00552023;
Ram[37] = 32'h00008067;
Ram[38] = 32'h1900c000;
Ram[39] = 32'h19020000;
Ram[40] = 32'h6c6c6548;
Ram[41] = 32'h6f57206f;
Ram[42] = 32'h0d646c72;
Ram[43] = 32'h0000000a;
numRamUsed = 44;

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
