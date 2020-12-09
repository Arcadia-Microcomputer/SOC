`timescale 1ns / 1ps

`define NUM_INPUTS 5
`define NUM_OUTPUTS 4

module AvalonXBarMux (
    input i_Clk,

    input [(`NUM_OUTPUTS*`NUM_INPUTS)-1:0]i_M_SReq,
    input [($clog2(`NUM_INPUTS+1) * `NUM_OUTPUTS)-1:0]i_MuxSel,

    //Avalon inputs
    input [(30*`NUM_INPUTS)-1:0]i_AVIn_Addr,
    input [(4*`NUM_INPUTS)-1:0]i_AVIn_ByteEn,
    input [`NUM_INPUTS-1:0]i_AVIn_Read,
    output reg[(32*`NUM_INPUTS)-1:0]o_AVIn_ReadData,
    input [`NUM_INPUTS-1:0]i_AVIn_Write,
    input [(32*`NUM_INPUTS-1):0]i_AVIn_WriteData,
    output reg[`NUM_INPUTS-1:0]o_AVIn_WaitRequest,
    input [(8*`NUM_INPUTS)-1:0]i_AVIn_BurstCount,

    //Avalon outputs
    output [(30*`NUM_OUTPUTS)-1:0]o_AVOut_Addr,
    output [(4*`NUM_OUTPUTS)-1:0]o_AVOut_ByteEn,
    output [`NUM_OUTPUTS-1:0]o_AVOut_Read,
    input [(32*`NUM_OUTPUTS)-1:0]i_AVOut_ReadData,
    output [`NUM_OUTPUTS-1:0]o_AVOut_Write,
    output [(32*`NUM_OUTPUTS-1):0]o_AVOut_WriteData,
    input [`NUM_OUTPUTS-1:0]i_AVOut_WaitRequest,
    output [(8*`NUM_OUTPUTS)-1:0]o_AVOut_BurstCount
    );
    reg [($clog2(`NUM_INPUTS+1) * `NUM_OUTPUTS)-1:0]r_Old_MuxSel = 0;
    reg [(`NUM_OUTPUTS*`NUM_INPUTS)-1:0]r_Old_M_SReq = 0;

    wire w_TmpWaitRequest[`NUM_OUTPUTS-1:0];
    wire [31:0]w_TmpReadData[`NUM_OUTPUTS-1:0];
    
    for(genvar i = 0; i < `NUM_OUTPUTS; i = i + 1)begin
        AvalonTerminatedMux#(
            .NUM_INPUTS(`NUM_INPUTS)
        )busMux(
            .i_Clk(i_Clk),
            .i_MuxSel(i_MuxSel[3*i +:3]),

            .i_AVIn_Addr({30'b0, i_AVIn_Addr}),
            .i_AVIn_ByteEn({4'b0, i_AVIn_ByteEn}),
            .i_AVIn_Read({1'b0, i_AVIn_Read}),
            .o_AVIn_ReadData(w_TmpReadData[i]),
            .i_AVIn_Write({1'b0, i_AVIn_Write}),
            .i_AVIn_WriteData({32'b0, i_AVIn_WriteData}),
            .o_AVIn_WaitRequest(w_TmpWaitRequest[i]),
            .i_AVIn_BurstCount({8'b0, i_AVIn_BurstCount}),

            .o_AVOut_Addr(o_AVOut_Addr[30*i +: 30]),
            .o_AVOut_ByteEn(o_AVOut_ByteEn[4*i +: 4]),
            .o_AVOut_Read(o_AVOut_Read[i]),
            .i_AVOut_ReadData(i_AVOut_ReadData[32*i +: 32]),
            .o_AVOut_Write(o_AVOut_Write[i]),
            .o_AVOut_WriteData(o_AVOut_WriteData[32*i +: 32]),
            .i_AVOut_WaitRequest(i_AVOut_WaitRequest[i]),
            .o_AVOut_BurstCount(o_AVOut_BurstCount[8*i +: 8])
        );
    end

    always @(posedge i_Clk) begin
        r_Old_M_SReq <= i_M_SReq;
        r_Old_MuxSel <= i_MuxSel;
    end

    //Take care of the (output -> input) signals
    integer i;
    always @(i_Clk) begin
        for(i = 0; i < `NUM_INPUTS; i = i + 1)begin
            if(r_Old_MuxSel[2:0] == i)begin
                //Link data from Output 0 to Input i
                o_AVIn_ReadData[32*i +:32] <= w_TmpReadData[0];
            end else if(r_Old_MuxSel[5:3] == i) begin
                //Link data from Output 1 to Input i
                o_AVIn_ReadData[32*i +:32] <= w_TmpReadData[1];
            end else if(r_Old_MuxSel[8:6] == i) begin
                //Link data from Output 2 to Input i
                o_AVIn_ReadData[32*i +:32] <= w_TmpReadData[2];
            end else if(r_Old_MuxSel[11:9] == i) begin
                //Link data from Output 3 to Input i
                o_AVIn_ReadData[32*i +:32] <= w_TmpReadData[3];
            end else begin
                o_AVIn_ReadData[32*i +:32] <= 0;
            end
        end        
    end

    always @(*) begin
        for(i = 0; i < `NUM_INPUTS; i = i + 1)begin
            if(i_MuxSel[2:0] == i)begin
                //Link data from Output 0 to Input i
                o_AVIn_WaitRequest[i] <= w_TmpWaitRequest[0];
            end else if(i_MuxSel[5:3] == i) begin
                //Link data from Output 1 to Input i
                o_AVIn_WaitRequest[i] <= w_TmpWaitRequest[1];
            end else if(i_MuxSel[8:6] == i) begin
                //Link data from Output 2 to Input i
                o_AVIn_WaitRequest[i] <= w_TmpWaitRequest[2];
            end else if(i_MuxSel[11:9] == i) begin
                //Link data from Output 3 to Input i
                o_AVIn_WaitRequest[i] <= w_TmpWaitRequest[3];
            end else begin
                //Master wasn't selected, did it make a request though?
                //If so assert wait request until the master wins arbitration
                o_AVIn_WaitRequest[i] <= |i_M_SReq[i*4+:4];
            end
        end
    end
endmodule


