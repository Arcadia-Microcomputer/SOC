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
Ram[3] = 32'h16c30313;
Ram[4] = 32'h00032403;
Ram[5] = 32'h00432483;
Ram[6] = 32'h00c32903;
Ram[7] = 32'h01032983;
Ram[8] = 32'h01432a03;
Ram[9] = 32'h01832a83;
Ram[10] = 32'h00100293;
Ram[11] = 32'h005a07a3;
Ram[12] = 32'h047872b7;
Ram[13] = 32'h8c028293;
Ram[14] = 32'h0059a223;
Ram[15] = 32'h00048513;
Ram[16] = 32'h00000593;
Ram[17] = 32'h114000ef;
Ram[18] = 32'h00300593;
Ram[19] = 32'h10c000ef;
Ram[20] = 32'h0d0000ef;
Ram[21] = 32'h00000593;
Ram[22] = 32'h00000617;
Ram[23] = 32'h13860613;
Ram[24] = 32'h01000693;
Ram[25] = 32'h084000ef;
Ram[26] = 32'h0b8000ef;
Ram[27] = 32'h00100293;
Ram[28] = 32'h0059a023;
Ram[29] = 32'h00098513;
Ram[30] = 32'h01000313;
Ram[31] = 32'h00000393;
Ram[32] = 32'h00040e13;
Ram[33] = 32'h000e2e83;
Ram[34] = 32'h004e0e13;
Ram[35] = 32'h00000f13;
Ram[36] = 32'h00400f93;
Ram[37] = 32'h01da0723;
Ram[38] = 32'h004ede93;
Ram[39] = 32'h01da06a3;
Ram[40] = 32'h004ede93;
Ram[41] = 32'h007a0623;
Ram[42] = 32'h00138393;
Ram[43] = 32'h001f0f13;
Ram[44] = 32'h01c000ef;
Ram[45] = 32'hffff10e3;
Ram[46] = 32'hfc6396e3;
Ram[47] = 32'h00000393;
Ram[48] = 32'h00040e13;
Ram[49] = 32'hfc1ff06f;
Ram[50] = 32'h0000006f;
Ram[51] = 32'h00052283;
Ram[52] = 32'h0022f293;
Ram[53] = 32'hfe028ce3;
Ram[54] = 32'h00052283;
Ram[55] = 32'h0022e293;
Ram[56] = 32'h00552023;
Ram[57] = 32'h00008067;
Ram[58] = 32'h00150283;
Ram[59] = 32'h0022f293;
Ram[60] = 32'hfe029ce3;
Ram[61] = 32'h10000293;
Ram[62] = 32'h00552023;
Ram[63] = 32'h00b52223;
Ram[64] = 32'h00060283;
Ram[65] = 32'h00550423;
Ram[66] = 32'h00160613;
Ram[67] = 32'hfff68693;
Ram[68] = 32'hfe0698e3;
Ram[69] = 32'h10400293;
Ram[70] = 32'h00552023;
Ram[71] = 32'h00008067;
Ram[72] = 32'h00150283;
Ram[73] = 32'h0022f293;
Ram[74] = 32'hfe029ce3;
Ram[75] = 32'h00100293;
Ram[76] = 32'h00552223;
Ram[77] = 32'h10600293;
Ram[78] = 32'h00552023;
Ram[79] = 32'h00150283;
Ram[80] = 32'h0022f293;
Ram[81] = 32'hfe029ce3;
Ram[82] = 32'h00850283;
Ram[83] = 32'h0012f293;
Ram[84] = 32'hfe0292e3;
Ram[85] = 32'h00008067;
Ram[86] = 32'h00150283;
Ram[87] = 32'h0022f293;
Ram[88] = 32'hfe029ce3;
Ram[89] = 32'h00b50023;
Ram[90] = 32'h00100293;
Ram[91] = 32'h005500a3;
Ram[92] = 32'h00008067;
Ram[93] = 32'h18000000;
Ram[94] = 32'h19000000;
Ram[95] = 32'h19008000;
Ram[96] = 32'h1900c000;
Ram[97] = 32'h19020000;
Ram[98] = 32'h19024000;
Ram[99] = 32'h06800000;
Ram[100] = 32'h04030201;
Ram[101] = 32'h08070605;
Ram[102] = 32'h12111009;
Ram[103] = 32'h16151413;
numRamUsed = 104;

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
