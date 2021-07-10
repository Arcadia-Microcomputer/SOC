`timescale 1ns / 1ps

module BOOTROM #(
    parameter NUM_PERIPH_SEL_BITS = 5,
    parameter PERIPH_SEL_VAL = 0,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon R slave
    input [29:0]i_AV_Addr,
    input i_AV_Read,
    output reg [31:0] o_AV_ReadData,
    output o_AV_WaitRequest
    );

    initial begin
        o_AV_ReadData <= 0;
    end
    assign o_AV_WaitRequest = 0;

    //DBUS Signals
    assign w_SlaveSel = (i_AV_Addr[29:30-NUM_PERIPH_SEL_BITS] == PERIPH_SEL_VAL)? 1 : 0;
	wire [29-NUM_PERIPH_SEL_BITS:0]w_RegAddr = i_AV_Addr[29-NUM_PERIPH_SEL_BITS:0];

    //The ROM block
    reg [31:0]Ram[DEPTH - 1:0];

    //Initalize the ROM
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h10000117;
Ram[1] = 32'h1fc10113;
Ram[2] = 32'h008000ef;
Ram[3] = 32'h0000006f;
Ram[4] = 32'hfe010113;
Ram[5] = 32'h00112e23;
Ram[6] = 32'h01212823;
Ram[7] = 32'h01312623;
Ram[8] = 32'h00812c23;
Ram[9] = 32'h00912a23;
Ram[10] = 32'h158000ef;
Ram[11] = 32'h0a000593;
Ram[12] = 32'hb0000537;
Ram[13] = 32'h240009b7;
Ram[14] = 32'h0ec000ef;
Ram[15] = 32'h00100913;
Ram[16] = 32'h00198993;
Ram[17] = 32'hb0000537;
Ram[18] = 32'h0e4000ef;
Ram[19] = 32'hfe050ce3;
Ram[20] = 32'hb0000537;
Ram[21] = 32'h0e8000ef;
Ram[22] = 32'h00050413;
Ram[23] = 32'h00000593;
Ram[24] = 32'h00000513;
Ram[25] = 32'h130000ef;
Ram[26] = 32'h00040c63;
Ram[27] = 32'h07240263;
Ram[28] = 32'h00f00593;
Ram[29] = 32'h00000513;
Ram[30] = 32'h11c000ef;
Ram[31] = 32'hfc9ff06f;
Ram[32] = 32'hb0000537;
Ram[33] = 32'h0a8000ef;
Ram[34] = 32'hfe050ce3;
Ram[35] = 32'hb0000537;
Ram[36] = 32'h0ac000ef;
Ram[37] = 32'hfa0508e3;
Ram[38] = 32'hfff50493;
Ram[39] = 32'h0ff4f493;
Ram[40] = 32'h013484b3;
Ram[41] = 32'h00249493;
Ram[42] = 32'h90000437;
Ram[43] = 32'hb0000537;
Ram[44] = 32'h07c000ef;
Ram[45] = 32'hfe050ce3;
Ram[46] = 32'hb0000537;
Ram[47] = 32'h080000ef;
Ram[48] = 32'h00a42023;
Ram[49] = 32'h00440413;
Ram[50] = 32'hfe9412e3;
Ram[51] = 32'hf79ff06f;
Ram[52] = 32'hb0000537;
Ram[53] = 32'h058000ef;
Ram[54] = 32'hfe050ce3;
Ram[55] = 32'hb0000537;
Ram[56] = 32'h05c000ef;
Ram[57] = 32'h02050863;
Ram[58] = 32'hfff50493;
Ram[59] = 32'h0ff4f493;
Ram[60] = 32'h00148493;
Ram[61] = 32'h00249493;
Ram[62] = 32'h00000413;
Ram[63] = 32'h00042583;
Ram[64] = 32'h00400613;
Ram[65] = 32'h00440413;
Ram[66] = 32'hb0000537;
Ram[67] = 32'h04c000ef;
Ram[68] = 32'hfe8496e3;
Ram[69] = 32'h00a00593;
Ram[70] = 32'hb0000537;
Ram[71] = 32'h028000ef;
Ram[72] = 32'hf25ff06f;
Ram[73] = 32'h00b51023;
Ram[74] = 32'h00008067;
Ram[75] = 32'h00255503;
Ram[76] = 32'h00455513;
Ram[77] = 32'h00157513;
Ram[78] = 32'h00008067;
Ram[79] = 32'h00454503;
Ram[80] = 32'h00008067;
Ram[81] = 32'h00255783;
Ram[82] = 32'h0087f793;
Ram[83] = 32'hfe079ce3;
Ram[84] = 32'h00b50223;
Ram[85] = 32'h00008067;
Ram[86] = 32'h02060263;
Ram[87] = 32'h00c586b3;
Ram[88] = 32'h0005c703;
Ram[89] = 32'h00255783;
Ram[90] = 32'h0087f793;
Ram[91] = 32'hfe079ce3;
Ram[92] = 32'h00e50223;
Ram[93] = 32'h00158593;
Ram[94] = 32'hfed594e3;
Ram[95] = 32'h00008067;
Ram[96] = 32'hc0000737;
Ram[97] = 32'h00f74783;
Ram[98] = 32'h0017e793;
Ram[99] = 32'h00f707a3;
Ram[100] = 32'h00008067;
Ram[101] = 32'hc00007b7;
Ram[102] = 32'h00c78793;
Ram[103] = 32'h00f50533;
Ram[104] = 32'h00b50023;
Ram[105] = 32'h00008067;
numRamUsed = 106;
        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        o_AV_ReadData <= 0;

        if(w_SlaveSel)begin
            if(i_AV_Read)begin
                o_AV_ReadData <= Ram[w_RegAddr]; 
            end
        end
    end

endmodule
