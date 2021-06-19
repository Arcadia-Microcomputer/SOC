`timescale 1ns / 1ps

module BusCrossBar#(
    parameter NUM_MASTERS = 2,
    parameter NUM_SLAVES = 2,
    parameter SEL_NUM_BITS = {5'd1, 5'd1},
    parameter SEL_VAL = {30'd1, 30'd0}
    )(
    input i_Clk,

    //Avalon master inputs
    input [(30*(NUM_MASTERS))-1:0]i_AVIn_Addr,
    input [(4*(NUM_MASTERS))-1:0]i_AVIn_ByteEn,
    input [(1*(NUM_MASTERS)-1):0]i_AVIn_Read,
    input [(1*(NUM_MASTERS))-1:0]i_AVIn_Write,
    output [(32*(NUM_MASTERS)-1):0]o_AVIn_ReadData,
    input [(32*(NUM_MASTERS)-1):0]i_AVIn_WriteData,
    output [(1*(NUM_MASTERS))-1:0]o_AVIn_WaitRequest,

    //Avalon slave outputs
    output [(30*(NUM_SLAVES))-1:0]o_AVOut_Addr,
    output [(4*(NUM_SLAVES))-1:0]o_AVOut_ByteEn,
    output [(1*(NUM_SLAVES)-1):0]o_AVOut_Read,
    output [(1*(NUM_SLAVES))-1:0]o_AVOut_Write,
    input [(32*(NUM_SLAVES)-1):0]i_AVOut_ReadData,
    output [(32*(NUM_SLAVES)-1):0]o_AVOut_WriteData,
    input [(1*(NUM_SLAVES))-1:0i_AVOut_WaitRequest
    );

    genvar i;
    for (i = 0; i < NUM_SLAVES; i = i + 1) begin : masterInterconnects

    end

endmodule