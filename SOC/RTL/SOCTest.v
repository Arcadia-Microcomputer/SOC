`timescale 1ns / 1ps

module SOCTest(
    input i_OscClk_100Mhz,
    
    //User Flash
    output o_UserFlash_Clk,
    output o_UserFlash_nCS,
    inout [3:0]io_UserFlash_IO,

    //UART0
    output UART0_TX,
    input UART0_nCTS,
    input UART0_RX, 
    output UART0_nRTS
    );

    //CPU Instuction Master Bus
    wire [29:0]w_AV_IBus_Addr;
    wire [3:0]w_AV_IBus_ByteEn = 4'b1111;
    wire w_AV_IBus_Read;
    wire w_AV_IBus_Write = 0;
    wire [31:0]w_AV_IBus_ReadData;
    wire [31:0]w_AV_IBus_WriteData = 0;
    wire w_AV_IBus_WaitRequest;
    wire [7:0]w_AV_IBus_BurstCount = 1;

    //CPU Data Master Bus
    wire [29:0]w_AV_DBus_Addr;
    wire [3:0]w_AV_DBus_ByteEn;
    wire w_AV_DBus_Read;
    wire w_AV_DBus_Write;
    wire [31:0]w_AV_DBus_ReadData;
    wire [31:0]w_AV_DBus_WriteData;
    wire w_AV_DBus_WaitRequest;
    wire [7:0]w_AV_DBus_BurstCount = 1;

    CPU #(
        //Start executing from BOOT ROM on startup
        .INITIAL_PC_VALUE(32'hC0800000)
    )CPU0 (
        .i_Clk(w_SysClk),

        //IBus Master
        .o_IBus_Address(w_AV_IBus_Addr),
        .o_IBus_Read(w_AV_IBus_Read),
        .i_IBus_ReadData(w_AV_IBus_ReadData),
        .i_IBus_WaitReq(w_AV_IBus_WaitRequest),

        //DBus Master        
        .o_DBus_Address(w_AV_DBus_Addr),
        .o_DBus_ByteEn(w_AV_DBus_ByteEn),
        .o_DBus_Read(w_AV_DBus_Read),
        .o_DBus_Write(w_AV_DBus_Write),
        .i_DBus_ReadData(w_AV_DBus_ReadData),
        .o_DBus_WriteData(w_AV_DBus_WriteData),
        .i_DBus_WaitRequest(w_AV_DBus_WaitRequest)
    );

    UartBusInterface #(
        .NUM_PERIPH_SEL_BITS(ADDR_SMALL_PERIPH_SEL_BITS),
        .PERIPH_SEL_VAL({ADDR_SMALL_PERIPH, TADDR_SMALL_PERIPH_UART0})
    )UART0(
        .i_Clk(w_SysClk),

        //RW Slave
        .i_AV_Addr(w_AV_PERIPH_Addr),
        .i_AV_ByteEn(w_AV_PERIPH_ByteEn),
        .i_AV_Read(w_AV_PERIPH_Read),
        .o_AV_ReadData(w_AV_UART0_ReadData),
        .i_AV_Write(w_AV_PERIPH_Write),
        .i_AV_WriteData(w_AV_PERIPH_WriteData),
        .o_AV_WaitRequest(w_AV_UART0_WaitRequest),
        .i_AV_BurstCount(w_AV_PERIPH_BurstCount),

        .o_UART_TX(UART0_TX),
        .i_UART_nCTS(UART0_nCTS),
        .i_UART_RX(UART0_RX),
        .o_UART_nRTS(UART0_nRTS)
    );

endmodule