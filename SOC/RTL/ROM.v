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
Ram[3] = 32'h0f430313;
Ram[4] = 32'h00032403;
Ram[5] = 32'h00432483;
Ram[6] = 32'h00832903;
Ram[7] = 32'h04b00293;
Ram[8] = 32'h00541023;
Ram[9] = 32'h00c32283;
Ram[10] = 32'h0054a223;
Ram[11] = 32'h0f000593;
Ram[12] = 32'h03900613;
Ram[13] = 32'h084000ef;
Ram[14] = 32'h00a906b3;
Ram[15] = 32'h06e68693;
Ram[16] = 32'h00a00513;
Ram[17] = 32'h00a00593;
Ram[18] = 32'h0fc00613;
Ram[19] = 32'h038000ef;
Ram[20] = 32'h00100293;
Ram[21] = 32'h0054a023;
Ram[22] = 32'h00d00293;
Ram[23] = 32'h00000317;
Ram[24] = 32'h0b030313;
Ram[25] = 32'h00000393;
Ram[26] = 32'h00030e03;
Ram[27] = 32'h01c40223;
Ram[28] = 32'h00130313;
Ram[29] = 32'h00138393;
Ram[30] = 32'hfe7298e3;
Ram[31] = 32'h054000ef;
Ram[32] = 32'hfd9ff06f;
Ram[33] = 32'h00712423;
Ram[34] = 32'h0f000393;
Ram[35] = 32'h40a383b3;
Ram[36] = 32'h00000313;
Ram[37] = 32'h00000293;
Ram[38] = 32'h00c68023;
Ram[39] = 32'h00128293;
Ram[40] = 32'h00168693;
Ram[41] = 32'hfe551ae3;
Ram[42] = 32'h007686b3;
Ram[43] = 32'h00130313;
Ram[44] = 32'hfe6592e3;
Ram[45] = 32'h00008067;
Ram[46] = 32'h00000513;
Ram[47] = 32'h00000293;
Ram[48] = 32'h00b50533;
Ram[49] = 32'h00128293;
Ram[50] = 32'hfe561ce3;
Ram[51] = 32'h00008067;
Ram[52] = 32'h0004a283;
Ram[53] = 32'h0022f293;
Ram[54] = 32'hfe028ce3;
Ram[55] = 32'h0004a283;
Ram[56] = 32'h0022e293;
Ram[57] = 32'h0054a023;
Ram[58] = 32'h00008067;
Ram[59] = 32'h00042283;
Ram[60] = 32'h0102d293;
Ram[61] = 32'hfe028ce3;
Ram[62] = 32'h00008067;
Ram[63] = 32'h20000000;
Ram[64] = 32'h20000800;
Ram[65] = 32'h30000000;
Ram[66] = 32'h047868c0;
Ram[67] = 32'h6c6c6548;
Ram[68] = 32'h6f57206f;
Ram[69] = 32'h0d646c72;
Ram[70] = 32'h0000000a;
numRamUsed = 71;

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
