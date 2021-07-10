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
Ram[4] = 32'hb00007b7;
Ram[5] = 32'h00200713;
Ram[6] = 32'h800005b7;
Ram[7] = 32'h00e79023;
Ram[8] = 32'h00c00613;
Ram[9] = 32'h04c58593;
Ram[10] = 32'hb0000537;
Ram[11] = 32'h0040006f;
Ram[12] = 32'h00060c63;
Ram[13] = 32'h00c58633;
Ram[14] = 32'h0005c783;
Ram[15] = 32'h00158593;
Ram[16] = 32'h00f50223;
Ram[17] = 32'hfec59ae3;
Ram[18] = 32'h00008067;
Ram[19] = 32'h6c6c6548;
Ram[20] = 32'h6f57206f;
Ram[21] = 32'h0a646c72;
Ram[22] = 32'h00000000;
numRamUsed = 23;
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
