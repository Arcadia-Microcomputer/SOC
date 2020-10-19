`timescale 1ns / 1ps

module BOOTROM #(
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
Ram[0] = 32'hc0401117;
Ram[1] = 32'hffc10113;
Ram[2] = 32'h008000ef;
Ram[3] = 32'h0000006f;
Ram[4] = 32'hfb010113;
Ram[5] = 32'h04812423;
Ram[6] = 32'h04912223;
Ram[7] = 32'h05212023;
Ram[8] = 32'h03312e23;
Ram[9] = 32'h03412c23;
Ram[10] = 32'h03512a23;
Ram[11] = 32'h03612823;
Ram[12] = 32'hffc047b7;
Ram[13] = 32'h04112623;
Ram[14] = 32'h03712623;
Ram[15] = 32'h03812423;
Ram[16] = 32'h03912223;
Ram[17] = 32'h03a12023;
Ram[18] = 32'h01b12e23;
Ram[19] = 32'h04b00713;
Ram[20] = 32'h00e79023;
Ram[21] = 32'h0027d703;
Ram[22] = 32'hffc009b7;
Ram[23] = 32'h0e000ab7;
Ram[24] = 32'h02076713;
Ram[25] = 32'h00e79123;
Ram[26] = 32'h3ec98993;
Ram[27] = 32'hffc04437;
Ram[28] = 32'h00600913;
Ram[29] = 32'hc00004b7;
Ram[30] = 32'h00100b13;
Ram[31] = 32'h38000a37;
Ram[32] = 32'h002a8a93;
Ram[33] = 32'h00245783;
Ram[34] = 32'h0107f793;
Ram[35] = 32'hfe078ce3;
Ram[36] = 32'h00444b83;
Ram[37] = 32'h0ffbfb93;
Ram[38] = 32'hff7966e3;
Ram[39] = 32'h002b9793;
Ram[40] = 32'h00f987b3;
Ram[41] = 32'h0007a783;
Ram[42] = 32'h00078067;
Ram[43] = 32'h00400613;
Ram[44] = 32'h00810593;
Ram[45] = 32'hffc04537;
Ram[46] = 32'h00012423;
Ram[47] = 32'h2e0000ef;
Ram[48] = 32'h00a15603;
Ram[49] = 32'h00815583;
Ram[50] = 32'hfa060ee3;
Ram[51] = 32'h00000713;
Ram[52] = 32'h00000693;
Ram[53] = 32'h00245783;
Ram[54] = 32'h0107f793;
Ram[55] = 32'hfe078ce3;
Ram[56] = 32'h00444783;
Ram[57] = 32'h00b686b3;
Ram[58] = 32'h00170713;
Ram[59] = 32'h00d486b3;
Ram[60] = 32'h01071713;
Ram[61] = 32'h01075713;
Ram[62] = 32'h00f68023;
Ram[63] = 32'h00070693;
Ram[64] = 32'hfcc76ae3;
Ram[65] = 32'hf81ff06f;
Ram[66] = 32'h00400613;
Ram[67] = 32'h00810593;
Ram[68] = 32'hffc04537;
Ram[69] = 32'h00012423;
Ram[70] = 32'h284000ef;
Ram[71] = 32'h00a15783;
Ram[72] = 32'h00815703;
Ram[73] = 32'hf60780e3;
Ram[74] = 32'h00e787b3;
Ram[75] = 32'h009786b3;
Ram[76] = 32'h00e48733;
Ram[77] = 32'h00245783;
Ram[78] = 32'h0087f793;
Ram[79] = 32'hfe079ce3;
Ram[80] = 32'h00074783;
Ram[81] = 32'h00170713;
Ram[82] = 32'h00f40223;
Ram[83] = 32'hfed714e3;
Ram[84] = 32'hf35ff06f;
Ram[85] = 32'hffc01537;
Ram[86] = 32'h1f4000ef;
Ram[87] = 32'h00245783;
Ram[88] = 32'h0087f793;
Ram[89] = 32'hfe079ce3;
Ram[90] = 32'h01640223;
Ram[91] = 32'hf19ff06f;
Ram[92] = 32'hffc01537;
Ram[93] = 32'h1d8000ef;
Ram[94] = 32'h00000593;
Ram[95] = 32'hffc01537;
Ram[96] = 32'h1a8000ef;
Ram[97] = 32'h00400593;
Ram[98] = 32'hffc01537;
Ram[99] = 32'h19c000ef;
Ram[100] = 32'hef5ff06f;
Ram[101] = 32'h00400613;
Ram[102] = 32'h00810593;
Ram[103] = 32'hffc04537;
Ram[104] = 32'h00012423;
Ram[105] = 32'h1f8000ef;
Ram[106] = 32'h00b14b83;
Ram[107] = 32'h020b8e63;
Ram[108] = 32'h00000693;
Ram[109] = 32'hffc01737;
Ram[110] = 32'h00245783;
Ram[111] = 32'h0107f793;
Ram[112] = 32'hfe078ce3;
Ram[113] = 32'h00444603;
Ram[114] = 32'h0ff67613;
Ram[115] = 32'h00174783;
Ram[116] = 32'h0047f793;
Ram[117] = 32'hfe079ce3;
Ram[118] = 32'h00168693;
Ram[119] = 32'h00c70423;
Ram[120] = 32'h0ff6f693;
Ram[121] = 32'hfcdb9ae3;
Ram[122] = 32'hffc01537;
Ram[123] = 32'h160000ef;
Ram[124] = 32'h00000593;
Ram[125] = 32'hffc01537;
Ram[126] = 32'h130000ef;
Ram[127] = 32'h00a14783;
Ram[128] = 32'h00914703;
Ram[129] = 32'h00814683;
Ram[130] = 32'h01079793;
Ram[131] = 32'h00871713;
Ram[132] = 32'h00e7e7b3;
Ram[133] = 32'h00d7e7b3;
Ram[134] = 32'hffc01737;
Ram[135] = 32'h00f72223;
Ram[136] = 32'h01770123;
Ram[137] = 32'h00500593;
Ram[138] = 32'hffc01537;
Ram[139] = 32'h0fc000ef;
Ram[140] = 32'he55ff06f;
Ram[141] = 32'hffc01537;
Ram[142] = 32'h114000ef;
Ram[143] = 32'h00600613;
Ram[144] = 32'h00810593;
Ram[145] = 32'hffc04537;
Ram[146] = 32'h00012423;
Ram[147] = 32'h00011623;
Ram[148] = 32'h14c000ef;
Ram[149] = 32'h00a14683;
Ram[150] = 32'h00914783;
Ram[151] = 32'h00814703;
Ram[152] = 32'h01069693;
Ram[153] = 32'h00879793;
Ram[154] = 32'h00f6e6b3;
Ram[155] = 32'h00e6e6b3;
Ram[156] = 32'h00d14c03;
Ram[157] = 32'h00c14603;
Ram[158] = 32'h00269793;
Ram[159] = 32'h00fa0733;
Ram[160] = 32'h00b14583;
Ram[161] = 32'h00072703;
Ram[162] = 32'h00861613;
Ram[163] = 32'h010c1c13;
Ram[164] = 32'h00cc6c33;
Ram[165] = 32'h00bc6c33;
Ram[166] = 32'h00e12223;
Ram[167] = 32'h00400613;
Ram[168] = 32'h09865063;
Ram[169] = 32'hffbc0d13;
Ram[170] = 32'h002d5d13;
Ram[171] = 32'h01568db3;
Ram[172] = 32'h00478793;
Ram[173] = 32'h01ad8db3;
Ram[174] = 32'h00fa0cb3;
Ram[175] = 32'h002d9d93;
Ram[176] = 32'h00400613;
Ram[177] = 32'h00410593;
Ram[178] = 32'hffc04537;
Ram[179] = 32'h0f8000ef;
Ram[180] = 32'h000ca703;
Ram[181] = 32'h004c8c93;
Ram[182] = 32'h00e12223;
Ram[183] = 32'hffbc92e3;
Ram[184] = 32'hffcc0c13;
Ram[185] = 32'h002d1d13;
Ram[186] = 32'h41ac0c33;
Ram[187] = 32'h00245783;
Ram[188] = 32'h0087f793;
Ram[189] = 32'hfe079ce3;
Ram[190] = 32'h003b9793;
Ram[191] = 32'h00f757b3;
Ram[192] = 32'h0ff7f793;
Ram[193] = 32'h001b8b93;
Ram[194] = 32'h00f40223;
Ram[195] = 32'h0ffbfb93;
Ram[196] = 32'hfd8beee3;
Ram[197] = 32'hd71ff06f;
Ram[198] = 32'h000480e7;
Ram[199] = 32'hd69ff06f;
Ram[200] = 32'hd60c02e3;
Ram[201] = 32'hfc9ff06f;
Ram[202] = 32'h00154783;
Ram[203] = 32'h0027f793;
Ram[204] = 32'hfe079ce3;
Ram[205] = 32'h0ff5f593;
Ram[206] = 32'h00b50023;
Ram[207] = 32'h00154783;
Ram[208] = 32'h0017e793;
Ram[209] = 32'h00f500a3;
Ram[210] = 32'h00008067;
Ram[211] = 32'h00154783;
Ram[212] = 32'h0027f793;
Ram[213] = 32'hfe079ce3;
Ram[214] = 32'h00100793;
Ram[215] = 32'h00f52223;
Ram[216] = 32'h00700713;
Ram[217] = 32'h00154783;
Ram[218] = 32'h0027f793;
Ram[219] = 32'hfe079ce3;
Ram[220] = 32'h00e50023;
Ram[221] = 32'h00154783;
Ram[222] = 32'h0017e793;
Ram[223] = 32'h00f500a3;
Ram[224] = 32'h00154783;
Ram[225] = 32'h0027f793;
Ram[226] = 32'hfe079ce3;
Ram[227] = 32'h00854783;
Ram[228] = 32'h0017f793;
Ram[229] = 32'hfc0798e3;
Ram[230] = 32'h00008067;
Ram[231] = 32'h02060263;
Ram[232] = 32'h00c58733;
Ram[233] = 32'h00255783;
Ram[234] = 32'h0107f793;
Ram[235] = 32'hfe078ce3;
Ram[236] = 32'h00454783;
Ram[237] = 32'h00158593;
Ram[238] = 32'hfef58fa3;
Ram[239] = 32'hfee594e3;
Ram[240] = 32'h00008067;
Ram[241] = 32'h02060263;
Ram[242] = 32'h00c58733;
Ram[243] = 32'h00255783;
Ram[244] = 32'h0087f793;
Ram[245] = 32'hfe079ce3;
Ram[246] = 32'h0005c783;
Ram[247] = 32'h00158593;
Ram[248] = 32'h00f50223;
Ram[249] = 32'hfee594e3;
Ram[250] = 32'h00008067;
Ram[251] = 32'hffc00234;
Ram[252] = 32'hffc00194;
Ram[253] = 32'hffc00170;
Ram[254] = 32'hffc00154;
Ram[255] = 32'hffc00108;
Ram[256] = 32'hffc000ac;
Ram[257] = 32'hffc00318;
numRamUsed = 258;
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
