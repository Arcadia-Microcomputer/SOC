`timescale 1ns / 1ps

module IRAM #(
    parameter ADDR_SEL_BITS = 6,
    parameter ADDR_BLOCK = 0,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon IBus slave
    input [29:0] i_IBus_Address,
    input i_IBus_Read,
    output [31:0] o_IBus_ReadData,
    output o_IBus_WaitRequest
    );
    reg [31:0]r_RD = 32'b0;
    reg r_SelRd = 1'b0;

    wire w_Sel = (i_IBus_Address[29:30-ADDR_SEL_BITS] === ADDR_BLOCK)? 1: 0;
    wire [29-ADDR_SEL_BITS:0] w_Addr = i_IBus_Address[29-ADDR_SEL_BITS:0];

    assign o_IBus_ReadData = r_SelRd? r_RD : 32'bz;
    assign o_IBus_WaitRequest = r_SelRd? 1'b0: 1'bz;

    //The ROM block
    reg [31:0]Ram[DEPTH - 1:0];

    //Initalize the ROM
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h11000317;
Ram[1] = 32'h00030313;
Ram[2] = 32'h00032403;
Ram[3] = 32'h00432483;
Ram[4] = 32'h00832903;
Ram[5] = 32'h25f00293;
Ram[6] = 32'h00541023;
Ram[7] = 32'h00c32283;
Ram[8] = 32'h0054a223;
Ram[9] = 32'h00100293;
Ram[10] = 32'h0054a023;
Ram[11] = 32'h00000993;
Ram[12] = 32'h06498993;
Ram[13] = 32'h01391023;
Ram[14] = 32'h01000293;
Ram[15] = 32'h11000317;
Ram[16] = 32'hfd430313;
Ram[17] = 32'h00000393;
Ram[18] = 32'h00100e13;
Ram[19] = 32'h00042e83;
Ram[20] = 32'h010ede93;
Ram[21] = 32'hffde1ae3;
Ram[22] = 32'h00030e03;
Ram[23] = 32'h00130313;
Ram[24] = 32'h00138393;
Ram[25] = 32'h01c40223;
Ram[26] = 32'hfe7290e3;
Ram[27] = 32'h00000097;
Ram[28] = 32'h00c080e7;
Ram[29] = 32'hfbdff06f;
Ram[30] = 32'h00200293;
Ram[31] = 32'h0004a303;
Ram[32] = 32'h0062f333;
Ram[33] = 32'hfe629ce3;
Ram[34] = 32'h0004a303;
Ram[35] = 32'h00536333;
Ram[36] = 32'h0064a023;
Ram[37] = 32'h00008067;
numRamUsed = 38;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        r_SelRd <= w_Sel;

        if(i_IBus_Read)begin
           r_RD <= Ram[w_Addr]; 
        end
    end

endmodule
