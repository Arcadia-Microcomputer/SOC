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
Ram[3] = 32'h0a430313;
Ram[4] = 32'h00032403;
Ram[5] = 32'h00432983;
Ram[6] = 32'h00c32483;
Ram[7] = 32'h01032903;
Ram[8] = 32'h01432a03;
Ram[9] = 32'habcdf537;
Ram[10] = 32'hf1250513;
Ram[11] = 32'h00000593;
Ram[12] = 32'h00098613;
Ram[13] = 32'h01c000ef;
Ram[14] = 32'h00098513;
Ram[15] = 32'h00150283;
Ram[16] = 32'h0022f293;
Ram[17] = 32'hfe029ce3;
Ram[18] = 32'h038000ef;
Ram[19] = 32'h0000006f;
Ram[20] = 32'h10000293;
Ram[21] = 32'h00562023;
Ram[22] = 32'h00b62223;
Ram[23] = 32'h00400293;
Ram[24] = 32'h00000313;
Ram[25] = 32'h00a62423;
Ram[26] = 32'h00855513;
Ram[27] = 32'h00130313;
Ram[28] = 32'hfe629ae3;
Ram[29] = 32'h10400293;
Ram[30] = 32'h00562023;
Ram[31] = 32'h00008067;
Ram[32] = 32'h00100293;
Ram[33] = 32'h00552223;
Ram[34] = 32'h10600293;
Ram[35] = 32'h00552023;
Ram[36] = 32'h00150283;
Ram[37] = 32'h0022f293;
Ram[38] = 32'hfe029ce3;
Ram[39] = 32'h00850283;
Ram[40] = 32'h0012f293;
Ram[41] = 32'hfe0292e3;
Ram[42] = 32'h00008067;
Ram[43] = 32'h18000000;
Ram[44] = 32'h19000000;
Ram[45] = 32'h19008000;
Ram[46] = 32'h1900c000;
Ram[47] = 32'h19020000;
Ram[48] = 32'h06800000;
Ram[49] = 32'h047868c0;
Ram[50] = 32'h6c6c6548;
Ram[51] = 32'h6f57206f;
Ram[52] = 32'h0d646c72;
Ram[53] = 32'h0000000a;
numRamUsed = 54;

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
