`timescale 1ns / 1ps

module BusMux#(
    parameter NUM_INPUTS = 2 
    )(
    input i_Clk,

    input [$clog2(NUM_INPUTS+1)-1:0]i_MuxSel,

    //Avalon master inputs
    input [(30*(NUM_INPUTS))-1:0] i_AVIn_Addr,
    input [(4*(NUM_INPUTS))-1:0] i_AVIn_ByteEn,
    input [(1*(NUM_INPUTS)-1):0] i_AVIn_Read,
    input [(1*(NUM_INPUTS))-1:0] i_AVIn_Write,
    output reg [(32*(NUM_INPUTS)-1):0] o_AVIn_ReadData,
    input [(32*(NUM_INPUTS)-1):0] i_AVIn_WriteData,
    output reg [(1*(NUM_INPUTS))-1:0] o_AVIn_WaitRequest,

    //Avalon slave output
    output [29:0] o_AVOut_Addr,
    output [3:0] o_AVOut_ByteEn,
    output o_AVOut_Read,
    output o_AVOut_Write,
    input [31:0] i_AVOut_ReadData,
    output [31:0] o_AVOut_WriteData,
    input i_AVOut_WaitRequest
    );

    wire [(30*(NUM_INPUTS+1))-1:0]w_AVIn_Addr = {i_AVIn_Addr, 30'b0};
    wire [(4*(NUM_INPUTS+1))-1:0]w_AVIn_ByteEn = {i_AVIn_ByteEn, 4'b0};
    wire [(1*(NUM_INPUTS+1))-1:0]w_AVIn_Read = {i_AVIn_Read, 1'b0};
    wire [(1*(NUM_INPUTS+1))-1:0]w_AVIn_Write = {i_AVIn_Write, 1'b0};
    wire [(32*(NUM_INPUTS+1))-1:0]w_AVIn_WriteData = {i_AVIn_WriteData, 32'b0};

    reg [$clog2(NUM_INPUTS+1)-1:0]r_Old_MuxSel;

    // Link selected master to slave
    assign o_AVOut_Addr = w_AVIn_Addr[30*i_MuxSel +: 30];
    assign o_AVOut_ByteEn = w_AVIn_ByteEn[4*i_MuxSel +: 4];
    assign o_AVOut_Read = w_AVIn_Read[i_MuxSel];
    assign o_AVOut_Write = w_AVIn_Write[i_MuxSel];
    assign o_AVOut_WriteData = w_AVIn_WriteData[32*i_MuxSel +: 32];

    // Link slave to selected master
    genvar i;
    for (i = 0; i < NUM_INPUTS; i = i + 1) begin : linkBack
        always @(*) begin
            o_AVIn_WaitRequest[i] <= 1;
            o_AVIn_ReadData[32*i +: 32] <= 32'b0;

            // Check if master is selected, is so link wait request
            if(i_MuxSel == i+1)begin
                o_AVIn_WaitRequest[i] <= i_AVOut_WaitRequest;
            end

            // Check if master is selected, if so link read data (One cycle delay)
            if(r_Old_MuxSel == i+1)begin
                o_AVIn_ReadData[32*i +: 32] <= i_AVOut_ReadData;
            end
        end
    end

    always @(posedge i_Clk) begin
        r_Old_MuxSel <= i_MuxSel;
    end
endmodule