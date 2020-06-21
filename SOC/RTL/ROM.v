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
Ram[0] = 32'h11000137;
Ram[1] = 32'h7fc10113;
Ram[2] = 32'h00000317;
Ram[3] = 32'h0d830313;
Ram[4] = 32'h00032403;
Ram[5] = 32'h00432483;
Ram[6] = 32'h00832903;
Ram[7] = 32'h00200293;
Ram[8] = 32'h00541023;
Ram[9] = 32'h00c32283;
Ram[10] = 32'h0054a223;
Ram[11] = 32'h00100293;
Ram[12] = 32'h0054a023;
Ram[13] = 32'h00a00513;
Ram[14] = 32'hfcfd05b7;
Ram[15] = 32'hcfc58593;
Ram[16] = 32'h00090613;
Ram[17] = 32'h1f460613;
Ram[18] = 32'h008000ef;
Ram[19] = 32'h0000006f;
Ram[20] = 32'hff810113;
Ram[21] = 32'h00512023;
Ram[22] = 32'h00612223;
Ram[23] = 32'h00000313;
Ram[24] = 32'h00000293;
Ram[25] = 32'h00b62023;
Ram[26] = 32'h00128293;
Ram[27] = 32'h00460613;
Ram[28] = 32'hfe551ae3;
Ram[29] = 32'h0c860613;
Ram[30] = 32'h00130313;
Ram[31] = 32'hfe6512e3;
Ram[32] = 32'h00012283;
Ram[33] = 32'h00412303;
Ram[34] = 32'h00810113;
Ram[35] = 32'h00008067;
Ram[36] = 32'h00512023;
Ram[37] = 32'hffc10113;
Ram[38] = 32'h0004a283;
Ram[39] = 32'h0022f293;
Ram[40] = 32'hfe0288e3;
Ram[41] = 32'h0004a283;
Ram[42] = 32'h0022e293;
Ram[43] = 32'h0054a023;
Ram[44] = 32'h00410113;
Ram[45] = 32'h00012283;
Ram[46] = 32'h00008067;
Ram[47] = 32'h00512023;
Ram[48] = 32'hffc10113;
Ram[49] = 32'h00042283;
Ram[50] = 32'h0102d293;
Ram[51] = 32'h0012f293;
Ram[52] = 32'hfe0286e3;
Ram[53] = 32'h00410113;
Ram[54] = 32'h00012283;
Ram[55] = 32'h00008067;
Ram[56] = 32'h20000000;
Ram[57] = 32'h20000800;
Ram[58] = 32'h30000000;
Ram[59] = 32'h007270e0;
numRamUsed = 60;

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
