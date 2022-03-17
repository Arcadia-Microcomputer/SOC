`timescale 1ns / 1ps

module SlaveInterconnect#(
    parameter NUM_MASTERS = 2
    )(
    input i_Clk,

    // Arbiter interface
    input [NUM_MASTERS-1:0] i_Req,
    input [NUM_MASTERS-1:0] i_Lock,
    output [NUM_MASTERS-1:0] o_Gnt,

    //Avalon master inputs
    input [(30*(NUM_MASTERS))-1:0] i_AVIn_Addr,
    input [(4*(NUM_MASTERS))-1:0] i_AVIn_ByteEn,
    input [(1*(NUM_MASTERS)-1):0] i_AVIn_Read,
    input [(1*(NUM_MASTERS))-1:0] i_AVIn_Write,
    output [(32*(NUM_MASTERS)-1):0] o_AVIn_ReadData,
    input [(32*(NUM_MASTERS)-1):0] i_AVIn_WriteData,
    output [(1*(NUM_MASTERS))-1:0] o_AVIn_WaitRequest,

    //Avalon slave output
    output [29:0] o_AVOut_Addr,
    output [3:0] o_AVOut_ByteEn,
    output o_AVOut_Read,
    output o_AVOut_Write,
    input [31:0] i_AVOut_ReadData,
    output [31:0] o_AVOut_WriteData,
    input i_AVOut_WaitRequest
    );

    wire [$clog2(NUM_MASTERS+1)-1:0] w_MuxSel;

    BusMux #(
        .NUM_INPUTS(NUM_MASTERS)
    )BusMux0(
        .i_Clk(i_Clk),
        .i_MuxSel(w_MuxSel),

        .i_AVIn_Addr(i_AVIn_Addr),
        .i_AVIn_ByteEn(i_AVIn_ByteEn),
        .i_AVIn_Read(i_AVIn_Read),
        .i_AVIn_Write(i_AVIn_Write),
        .o_AVIn_ReadData(o_AVIn_ReadData),
        .i_AVIn_WriteData(i_AVIn_WriteData),
        .o_AVIn_WaitRequest(o_AVIn_WaitRequest),

        .o_AVOut_Addr(o_AVOut_Addr),
        .o_AVOut_ByteEn(o_AVOut_ByteEn),
        .o_AVOut_Read(o_AVOut_Read),
        .o_AVOut_Write(o_AVOut_Write),
        .i_AVOut_ReadData(i_AVOut_ReadData),
        .o_AVOut_WriteData(o_AVOut_WriteData),
        .i_AVOut_WaitRequest(i_AVOut_WaitRequest)
    );

    SlaveArbiter #(
        .NUM_MASTERS(NUM_MASTERS)
    )SlaveArbiter0(
        .i_Clk(i_Clk),

        .i_Req(i_Req),
        .i_Lock(i_Lock),

        .o_Gnt(o_Gnt),
        .o_MuxSel(w_MuxSel)
    );
endmodule