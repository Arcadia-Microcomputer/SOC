`timescale 1ns / 1ps

module AvalonTerminatedMux #(
    parameter NUM_INPUTS = 2
    )(
    input i_Clk,
    input [$clog2(NUM_INPUTS+1)-1:0]i_MuxSel,

    //Avalon inputs
    input [(30*(NUM_INPUTS+1))-1:0]i_AVIn_Addr,
    input [(4*(NUM_INPUTS+1))-1:0]i_AVIn_ByteEn,
    input [(NUM_INPUTS+1)-1:0]i_AVIn_Read,
    output [31:0]o_AVIn_ReadData,
    input [(NUM_INPUTS+1)-1:0]i_AVIn_Write,
    input [(32*(NUM_INPUTS+1)-1):0]i_AVIn_WriteData,
    output o_AVIn_WaitRequest,
    input [(8*(NUM_INPUTS+1))-1:0]i_AVIn_BurstCount,

    //Avalon output
    output [29:0]o_AVOut_Addr,
    output [3:0]o_AVOut_ByteEn,
    output o_AVOut_Read,
    input [31:0]i_AVOut_ReadData,
    output o_AVOut_Write,
    output [31:0]o_AVOut_WriteData,
    input i_AVOut_WaitRequest,
    output [7:0]o_AVOut_BurstCount
    );

    assign o_AVOut_Addr = i_AVIn_Addr[30*i_MuxSel +: 30];
    assign o_AVOut_ByteEn = i_AVIn_ByteEn[4*i_MuxSel +: 4];
    assign o_AVOut_Read = i_AVIn_Read[i_MuxSel];
    assign o_AVOut_Write = i_AVIn_Write[i_MuxSel];
    assign o_AVOut_WriteData = i_AVIn_WriteData[32*i_MuxSel +: 32];
    assign o_AVOut_BurstCount = i_AVIn_BurstCount[8*i_MuxSel +: 8];

    assign o_AVIn_ReadData = i_AVOut_ReadData;
    assign o_AVIn_WaitRequest = i_AVOut_WaitRequest;

endmodule


