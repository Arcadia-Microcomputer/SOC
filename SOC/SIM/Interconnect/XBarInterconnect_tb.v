`timescale 1ns / 1ps

module XBarInterconnect_tb();
    reg r_Clk = 0;

    //Avalon Master Bus 0 signals
    reg [29:0]r_AV_M0_Addr = 0;
    reg [3:0]r_AV_M0_ByteEn = 4'b1111;
    reg r_AV_M0_Read = 0;
    wire [31:0]w_AV_M0_ReadData;
    reg r_AV_M0_Write = 0;
    reg [31:0]r_AV_M0_WriteData = 0;
    wire w_AV_M0_WaitRequest;
    reg [7:0]r_AV_M0_BurstCount = 0;

    //Avalon Master Bus 1 signals
    reg [29:0]r_AV_M1_Addr = 0;
    reg [3:0]r_AV_M1_ByteEn = 4'b1111;
    reg r_AV_M1_Read = 0;
    wire [31:0]w_AV_M1_ReadData;
    reg r_AV_M1_Write = 0;
    reg [31:0]r_AV_M1_WriteData = 0;
    wire w_AV_M1_WaitRequest;
    reg [7:0]r_AV_M1_BurstCount = 0;

    //Avalon Master Bus 2 signals
    reg [29:0]r_AV_M2_Addr = 0;
    reg [3:0]r_AV_M2_ByteEn = 4'b1111;
    reg r_AV_M2_Read = 0;
    wire [31:0]w_AV_M2_ReadData;
    reg r_AV_M2_Write = 0;
    reg [31:0]r_AV_M2_WriteData = 0;
    wire w_AV_M2_WaitRequest;
    reg [7:0]r_AV_M2_BurstCount = 0;

    //Avalon Master Bus 3 signals
    reg [29:0]r_AV_M3_Addr = 0;
    reg [3:0]r_AV_M3_ByteEn = 4'b1111;
    reg r_AV_M3_Read = 0;
    wire [31:0]w_AV_M3_ReadData;
    reg r_AV_M3_Write = 0;
    reg [31:0]r_AV_M3_WriteData = 0;
    wire w_AV_M3_WaitRequest;
    reg [7:0]r_AV_M3_BurstCount = 0;

    //Avalon Master Bus 4 signals
    reg [29:0]r_AV_M4_Addr = 0;
    reg [3:0]r_AV_M4_ByteEn = 4'b1111;
    reg r_AV_M4_Read = 0;
    wire [31:0]w_AV_M4_ReadData;
    reg r_AV_M4_Write = 0;
    reg [31:0]r_AV_M4_WriteData = 0;
    wire w_AV_M4_WaitRequest;
    reg [7:0]r_AV_M4_BurstCount = 0;

    //Avalon Slave Bus 0 signals
    wire [29:0]w_AV_S0_Addr;
    wire [3:0]w_AV_S0_ByteEn;
    wire w_AV_S0_Read;
    wire [31:0]w_AV_S0_ReadData;
    wire w_AV_S0_Write;
    wire [31:0]w_AV_S0_WriteData;
    wire w_AV_S0_WaitRequest;
    wire [7:0]w_AV_S0_BurstCount;

    //Avalon Slave Bus 1 signals
    wire [29:0]w_AV_S1_Addr;
    wire [3:0]w_AV_S1_ByteEn;
    wire w_AV_S1_Read;
    wire [31:0]w_AV_S1_ReadData;
    wire w_AV_S1_Write;
    wire [31:0]w_AV_S1_WriteData;
    wire w_AV_S1_WaitRequest;
    wire [7:0]w_AV_S1_BurstCount;

    //Avalon Slave Bus 2 signals
    wire [29:0]w_AV_S2_Addr;
    wire [3:0]w_AV_S2_ByteEn;
    wire w_AV_S2_Read;
    wire [31:0]w_AV_S2_ReadData = 0;
    wire w_AV_S2_Write;
    wire [31:0]w_AV_S2_WriteData;
    wire w_AV_S2_WaitRequest = 0;
    wire [7:0]w_AV_S2_BurstCount;

    //Avalon Slave Bus 3 signals
    wire [29:0]w_AV_S3_Addr;
    wire [3:0]w_AV_S3_ByteEn;
    wire w_AV_S3_Read;
    wire [31:0]w_AV_S3_ReadData = 0;
    wire w_AV_S3_Write;
    wire [31:0]w_AV_S3_WriteData;
    wire w_AV_S3_WaitRequest = 0;
    wire [7:0]w_AV_S3_BurstCount;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    reg [31:0]i;
    
    //Master 0
    initial begin
        //Slave 0
        @(posedge r_Clk);
        r_AV_M0_Addr <= 0;
        r_AV_M0_ByteEn <= 4'b1111;
        r_AV_M0_Write <= 1;
        r_AV_M0_BurstCount <= 4;

        for(i = 0; i < 3; i = i + 1)begin
            r_AV_M0_WriteData <= i + 1;
            @(posedge r_Clk);
            
            if(i == 1)begin
                r_AV_M0_Write <= 0;
                #80;
                @(posedge r_Clk);
                r_AV_M0_Write <= 1;
            end
        end
        r_AV_M0_WriteData <= i + 1;
        @(negedge w_AV_M0_WaitRequest);
        @(posedge r_Clk);
        r_AV_M0_Write <= 0;
        #100;

        //Read
        @(posedge r_Clk);
        r_AV_M0_Addr <= 0;
        r_AV_M0_Read <= 1;
        r_AV_M0_BurstCount <= 4;
        for(i = 0; i < 4; i = i + 1)begin
            @(posedge r_Clk);    
        end
        @(negedge w_AV_M0_WaitRequest);
        @(posedge r_Clk); 
        r_AV_M0_Read <= 0;
    end

    //Master 1
    initial begin
        //Slave 0
        @(posedge r_Clk);
        r_AV_M1_Addr <= 30'h0000000;
        r_AV_M1_Write <= 1;
        r_AV_M1_WriteData <= 32'hA;
        r_AV_M1_BurstCount <= 1;
        @(negedge w_AV_M1_WaitRequest);
        #1;
        @(posedge r_Clk);
        r_AV_M1_Write <= 0;

        //Slave 1
        @(posedge r_Clk);
        r_AV_M1_Addr <= 30'h4000000;
        r_AV_M1_Write <= 1;
        r_AV_M1_WriteData <= 32'hA;
        r_AV_M1_BurstCount <= 1;
        @(posedge r_Clk);
        r_AV_M1_Write <= 0;
    end

    XBarInterconnect #(
        .ADDR_SEL_BITS_O0(5),
        .ADDR_SEL_O0(0),
        .ADDR_SEL_BITS_O1(5),
        .ADDR_SEL_O1(1),
        .ADDR_SEL_BITS_O2(5),
        .ADDR_SEL_O2(2),
        .ADDR_SEL_BITS_O3(5),
        .ADDR_SEL_O3(3)
    )XBarInterconnect0(
        .i_Clk(r_Clk),

        //Inputs
        .i_AVIn_Addr({r_AV_M4_Addr, r_AV_M3_Addr, r_AV_M2_Addr, r_AV_M1_Addr, r_AV_M0_Addr}),
        .i_AVIn_ByteEn({r_AV_M4_ByteEn, r_AV_M3_ByteEn, r_AV_M2_ByteEn, r_AV_M1_ByteEn, r_AV_M0_ByteEn}),
        .i_AVIn_Read({r_AV_M4_Read, r_AV_M3_Read, r_AV_M2_Read, r_AV_M1_Read, r_AV_M0_Read}),
        .o_AVIn_ReadData({w_AV_M4_ReadData, w_AV_M3_ReadData, w_AV_M2_ReadData, w_AV_M1_ReadData, w_AV_M0_ReadData}),
        .i_AVIn_Write({r_AV_M4_Write, r_AV_M3_Write, r_AV_M2_Write, r_AV_M1_Write, r_AV_M0_Write}),
        .i_AVIn_WriteData({r_AV_M4_WriteData, r_AV_M3_WriteData, r_AV_M2_WriteData, r_AV_M1_WriteData, r_AV_M0_WriteData}),
        .o_AVIn_WaitRequest({w_AV_M4_WaitRequest, w_AV_M3_WaitRequest, w_AV_M2_WaitRequest, w_AV_M1_WaitRequest, w_AV_M0_WaitRequest}),
        .i_AVIn_BurstCount({r_AV_M4_BurstCount, r_AV_M3_BurstCount, r_AV_M2_BurstCount, r_AV_M1_BurstCount, r_AV_M0_BurstCount}),

        //Output
        .o_AVOut_Addr({w_AV_S3_Addr, w_AV_S2_Addr, w_AV_S1_Addr, w_AV_S0_Addr}),
        .o_AVOut_ByteEn({w_AV_S3_ByteEn, w_AV_S2_ByteEn, w_AV_S1_ByteEn, w_AV_S0_ByteEn}),
        .o_AVOut_Read({w_AV_S3_Read, w_AV_S2_Read, w_AV_S1_Read, w_AV_S0_Read}),
        .i_AVOut_ReadData({w_AV_S3_ReadData, w_AV_S2_ReadData, w_AV_S1_ReadData, w_AV_S0_ReadData}),
        .o_AVOut_Write({w_AV_S3_Write, w_AV_S2_Write, w_AV_S1_Write, w_AV_S0_Write}),
        .o_AVOut_WriteData({w_AV_S3_WriteData, w_AV_S2_WriteData, w_AV_S1_WriteData, w_AV_S0_WriteData}),
        .i_AVOut_WaitRequest({w_AV_S3_WaitRequest, w_AV_S2_WaitRequest, w_AV_S1_WaitRequest, w_AV_S0_WaitRequest}),
        .o_AVOut_BurstCount({w_AV_S3_BurstCount, w_AV_S2_BurstCount, w_AV_S1_BurstCount, w_AV_S0_BurstCount})
    );

    AvalonTestBurstSlave #(
        .NUM_PERIPH_SEL_BITS(5),
        .PERIPH_SEL_VAL(0),
        .WRITE_WAIT_REQ_CYCLES(1),
        .READ_WAIT_REQ_CYCLES(3)
    )AvalonTestBurstSlave0(
        .i_Clk(r_Clk),

        //Avalon RW slave
        .i_AV_Addr(w_AV_S0_Addr),
        .i_AV_ByteEn(w_AV_S0_ByteEn),
        .i_AV_Read(w_AV_S0_Read),
        .o_AV_ReadData(w_AV_S0_ReadData),
        .i_AV_Write(w_AV_S0_Write),
        .i_AV_WriteData(w_AV_S0_WriteData),
        .o_AV_WaitRequest(w_AV_S0_WaitRequest),
        .i_AV_BurstCount(w_AV_S0_BurstCount)
    );

    AvalonTestBurstSlave #(
        .NUM_PERIPH_SEL_BITS(5),
        .PERIPH_SEL_VAL(1),
        .WRITE_WAIT_REQ_CYCLES(3),
        .READ_WAIT_REQ_CYCLES(1)
    )AvalonTestBurstSlave1(
        .i_Clk(r_Clk),

        //Avalon RW slave
        .i_AV_Addr(w_AV_S1_Addr),
        .i_AV_ByteEn(w_AV_S1_ByteEn),
        .i_AV_Read(w_AV_S1_Read),
        .o_AV_ReadData(w_AV_S1_ReadData),
        .i_AV_Write(w_AV_S1_Write),
        .i_AV_WriteData(w_AV_S1_WriteData),
        .o_AV_WaitRequest(w_AV_S1_WaitRequest),
        .i_AV_BurstCount(w_AV_S1_BurstCount)
    );
endmodule