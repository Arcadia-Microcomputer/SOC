`timescale 1ns / 1ps

`define NUM_INPUTS 5
`define NUM_OUTPUTS 5

module XBarInterconnect #(
    parameter ADDR_SEL_BITS_O0 = 5,
    parameter ADDR_SEL_O0 = 0,
    parameter ADDR_SEL_BITS_O1 = 5,
    parameter ADDR_SEL_O1 = 1,
    parameter ADDR_SEL_BITS_O2 = 5,
    parameter ADDR_SEL_O2 = 2,
    parameter ADDR_SEL_BITS_O3 = 5,
    parameter ADDR_SEL_O3 = 3,
    parameter ADDR_SEL_BITS_O4 = 5,
    parameter ADDR_SEL_O4 = 4
    )(
    input i_Clk,

    //Avalon inputs
    input [(30*`NUM_INPUTS)-1:0]i_AVIn_Addr,
    input [(4*`NUM_INPUTS)-1:0]i_AVIn_ByteEn,
    input [`NUM_INPUTS-1:0]i_AVIn_Read,
    output [(32*`NUM_INPUTS)-1:0]o_AVIn_ReadData,
    input [`NUM_INPUTS-1:0]i_AVIn_Write,
    input [(32*`NUM_INPUTS-1):0]i_AVIn_WriteData,
    output [`NUM_INPUTS-1:0]o_AVIn_WaitRequest,
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
    
    wire [(`NUM_OUTPUTS*3)-1:0]w_MuxSel;
    wire [`NUM_OUTPUTS-1:0]w_M_SReq[`NUM_INPUTS-1:0];
    wire [`NUM_OUTPUTS-1:0]w_M_SNewTransaction[`NUM_INPUTS-1:0];

    //Input decoders
    for(genvar i = 0; i < `NUM_INPUTS; i = i + 1)begin
        InputDecoder#(
            .ADDR_SEL_BITS_O0(ADDR_SEL_BITS_O0),
            .ADDR_SEL_O0(ADDR_SEL_O0),
            .ADDR_SEL_BITS_O1(ADDR_SEL_BITS_O1),
            .ADDR_SEL_O1(ADDR_SEL_O1),
            .ADDR_SEL_BITS_O2(ADDR_SEL_BITS_O2),
            .ADDR_SEL_O2(ADDR_SEL_O2),
            .ADDR_SEL_BITS_O3(ADDR_SEL_BITS_O3),
            .ADDR_SEL_O3(ADDR_SEL_O3),
            .ADDR_SEL_BITS_O4(ADDR_SEL_BITS_O4),
            .ADDR_SEL_O4(ADDR_SEL_O4)
        )InputDecoder(
            .i_Clk(i_Clk),

            .i_AV_Addr(i_AVIn_Addr[i*30+:30]),
            .i_AV_Read(i_AVIn_Read[i+:1]),
            .i_AV_Write(i_AVIn_Write[i+:1]),
            .i_AV_WaitRequest(o_AVIn_WaitRequest[i+:1]),
            .i_AV_BurstCount(i_AVIn_BurstCount[i*8+:8]),
            .o_Out_Req(w_M_SReq[i]),
            .o_Out_NewTransaction(w_M_SNewTransaction[i])
        );
    end

    //Output arbiters
    for(genvar i = 0; i < `NUM_OUTPUTS; i = i + 1)begin
        OutputArbiter OutputArbiter(
            .i_Clk(i_Clk),

            .i_In_Req({w_M_SReq[4][i], w_M_SReq[3][i], w_M_SReq[2][i], w_M_SReq[1][i], w_M_SReq[0][i]}),
            .i_In_NewTransaction({w_M_SNewTransaction[4][i], w_M_SNewTransaction[3][i], w_M_SNewTransaction[2][i], 
                                  w_M_SNewTransaction[1][i], w_M_SNewTransaction[0][i]}),
            .o_MuxSel(w_MuxSel[i*3+:3])
        );
    end

    //Main bus mux
    AvalonXBarMux AvalonXBarMux(
        .i_Clk(i_Clk),

        .i_MuxSel(w_MuxSel),

        //Inputs
        .i_AVIn_Addr(i_AVIn_Addr),
        .i_AVIn_ByteEn(i_AVIn_ByteEn),
        .i_AVIn_Read(i_AVIn_Read),
        .o_AVIn_ReadData(o_AVIn_ReadData),
        .i_AVIn_Write(i_AVIn_Write),
        .i_AVIn_WriteData(i_AVIn_WriteData),
        .o_AVIn_WaitRequest(o_AVIn_WaitRequest),
        .i_AVIn_BurstCount(i_AVIn_BurstCount),

        //Output
        .o_AVOut_Addr(o_AVOut_Addr),
        .o_AVOut_ByteEn(o_AVOut_ByteEn),
        .o_AVOut_Read(o_AVOut_Read),
        .i_AVOut_ReadData(i_AVOut_ReadData),
        .o_AVOut_Write(o_AVOut_Write),
        .o_AVOut_WriteData(o_AVOut_WriteData),
        .i_AVOut_WaitRequest(i_AVOut_WaitRequest),
        .o_AVOut_BurstCount(o_AVOut_BurstCount)
    );
    
endmodule


