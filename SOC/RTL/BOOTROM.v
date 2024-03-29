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
Ram[0] = 32'ha00000b7;
Ram[1] = 32'h00008023;
Ram[2] = 32'h00108103;
Ram[3] = 32'h00116113;
Ram[4] = 32'h002080a3;
Ram[5] = 32'h0000006f;
numRamUsed = 6;
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
