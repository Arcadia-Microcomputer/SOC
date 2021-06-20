`timescale 1ns / 1ps

module BusInterconnect#(
    parameter NUM_INPUTS = 2,
    parameter SEL_NUM_BITS = 5,
    parameter SEL_VAL = 0
    )(
    input i_Clk,

    //Avalon master inputs
    input [(30*(NUM_INPUTS))-1:0] i_AVIn_Addr,
    input [(4*(NUM_INPUTS))-1:0] i_AVIn_ByteEn,
    input [(1*(NUM_INPUTS)-1):0] i_AVIn_Read,
    input [(1*(NUM_INPUTS))-1:0] i_AVIn_Write,
    output [(32*(NUM_INPUTS)-1):0] o_AVIn_ReadData,
    input [(32*(NUM_INPUTS)-1):0] i_AVIn_WriteData,
    output [(1*(NUM_INPUTS))-1:0] o_AVIn_WaitRequest,

    //Avalon slave output
    output [29:0] o_AVOut_Addr,
    output [3:0] o_AVOut_ByteEn,
    output o_AVOut_Read,
    output o_AVOut_Write,
    input [31:0] i_AVOut_ReadData,
    output [31:0] o_AVOut_WriteData,
    input i_AVOut_WaitRequest
    );

    wire [$clog2(NUM_INPUTS+1)-1:0]w_MuxSel;

    BusArbiter#(
        .NUM_INPUTS(NUM_INPUTS),
        .SEL_NUM_BITS(SEL_NUM_BITS),
        .SEL_VAL(SEL_VAL)
    )BusArbiter0(
        .i_Clk(i_Clk),
        .o_MuxSel(w_MuxSel),

        .i_AVIn_Addr(i_AVIn_Addr),
        .i_AVIn_Read(i_AVIn_Read),
        .i_AVIn_Write(i_AVIn_Write)
    );

    BusMux #(
        .NUM_INPUTS(NUM_INPUTS)
    )BusMux0(
        .i_Clk(i_Clk),
        .i_MuxSel(w_MuxSel),

        //Inputs
        .i_AVIn_Addr(i_AVIn_Addr),
        .i_AVIn_ByteEn(i_AVIn_ByteEn),
        .i_AVIn_Read(i_AVIn_Read),
        .i_AVIn_Write(i_AVIn_Write),
        .o_AVIn_ReadData(o_AVIn_ReadData),
        .i_AVIn_WriteData(i_AVIn_WriteData),
        .o_AVIn_WaitRequest(o_AVIn_WaitRequest),

        //Output
        .o_AVOut_Addr(o_AVOut_Addr),
        .o_AVOut_ByteEn(o_AVOut_ByteEn),
        .o_AVOut_Read(o_AVOut_Read),
        .o_AVOut_Write(o_AVOut_Write),
        .i_AVOut_ReadData(i_AVOut_ReadData),
        .o_AVOut_WriteData(o_AVOut_WriteData),
        .i_AVOut_WaitRequest(i_AVOut_WaitRequest)
    );

endmodule