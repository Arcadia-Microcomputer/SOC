`timescale 1ns / 1ps

module BusMux_tb();
    reg r_Clk = 0;
    
    //Avalon Master Bus 0 signals
    reg [29:0]r_AV_M0_Addr = 0;
    reg [3:0]r_AV_M0_ByteEn = 4'b1111;
    reg r_AV_M0_Read = 0;
    reg r_AV_M0_Write = 0;
    wire [31:0]w_AV_M0_ReadData;
    reg [31:0]r_AV_M0_WriteData = 0;
    wire w_AV_M0_WaitRequest;

    //Avalon Master Bus 1 signals
    reg [29:0]r_AV_M1_Addr = 0;
    reg [3:0]r_AV_M1_ByteEn = 4'b1111;
    reg r_AV_M1_Read = 0;
    reg r_AV_M1_Write = 0;
    wire [31:0]w_AV_M1_ReadData;
    reg [31:0]r_AV_M1_WriteData = 0;
    wire w_AV_M1_WaitRequest;

    //Avalon Slave Bus 0 signals
    wire [29:0]w_AV_S0_Addr;
    wire [3:0]w_AV_S0_ByteEn;
    wire w_AV_S0_Read;
    wire w_AV_S0_Write;
    wire [31:0]w_AV_S0_ReadData;
    wire [31:0]w_AV_S0_WriteData;
    wire w_AV_S0_WaitRequest;
    
    reg [1:0]r_MuxSel = 0;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        //Master 0
        @(posedge r_Clk);
        r_AV_M0_Addr <= 0;
        r_AV_M0_Write <= 1;
        r_AV_M0_WriteData <= 32'h1;
        @(negedge w_AV_M0_WaitRequest);
        @(posedge r_Clk);
        r_AV_M0_Write <= 0;
    end

    initial begin
        //Master 1
        @(negedge w_AV_M1_WaitRequest);
        r_AV_M1_Addr <= 0;
        r_AV_M1_Read <= 1;
        @(negedge w_AV_M1_WaitRequest);
        @(posedge r_Clk);
        r_AV_M1_Read <= 0;
    end

    initial begin
        r_MuxSel <= 2'd1;
        #160;
        @(posedge r_Clk);
        r_MuxSel = 2'd2;

        #160;
        @(posedge r_Clk);
        r_MuxSel = 2'd0;
    end

    BusMux #(
        .NUM_INPUTS(2)
    )BusMux0(
        .i_Clk(r_Clk),
        .i_MuxSel(r_MuxSel),

        //Inputs
        .i_AVIn_Addr({r_AV_M1_Addr, r_AV_M0_Addr}),
        .i_AVIn_ByteEn({r_AV_M1_ByteEn, r_AV_M0_ByteEn}),
        .i_AVIn_Read({r_AV_M1_Read, r_AV_M0_Read}),
        .i_AVIn_Write({r_AV_M1_Write, r_AV_M0_Write}),
        .o_AVIn_ReadData({w_AV_M1_ReadData, w_AV_M0_ReadData}),
        .i_AVIn_WriteData({r_AV_M1_WriteData, r_AV_M0_WriteData}),
        .o_AVIn_WaitRequest({w_AV_M1_WaitRequest, w_AV_M0_WaitRequest}),

        //Output
        .o_AVOut_Addr(w_AV_S0_Addr),
        .o_AVOut_ByteEn(w_AV_S0_ByteEn),
        .o_AVOut_Read(w_AV_S0_Read),
        .o_AVOut_Write(w_AV_S0_Write),
        .i_AVOut_ReadData(w_AV_S0_ReadData),
        .o_AVOut_WriteData(w_AV_S0_WriteData),
        .i_AVOut_WaitRequest(w_AV_S0_WaitRequest)
    );

    AvalonTestSlave #(
        .NUM_PERIPH_SEL_BITS(5),
        .PERIPH_SEL_VAL(0),
        .WRITE_WAIT_REQ_CYCLES(1),
        .READ_WAIT_REQ_CYCLES(1)
    )AvalonTestSlave0(
        .i_Clk(r_Clk),

        //Avalon RW slave
        .i_AV_Addr(w_AV_S0_Addr),
        .i_AV_ByteEn(w_AV_S0_ByteEn),
        .i_AV_Read(w_AV_S0_Read),
        .i_AV_Write(w_AV_S0_Write),
        .o_AV_ReadData(w_AV_S0_ReadData),
        .i_AV_WriteData(w_AV_S0_WriteData),
        .o_AV_WaitRequest(w_AV_S0_WaitRequest)
    );
endmodule