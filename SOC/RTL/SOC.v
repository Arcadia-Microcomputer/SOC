`timescale 1ns / 1ps

module SOC(
    input i_OscClk_100Mhz,
    
    //User Flash
    output o_UserFlash_Clk,
    output o_UserFlash_nCS,
    inout [3:0]io_UserFlash_IO,

    //UART
    output o_UART0_TX,
    input i_UART0_nCTS,
    input i_UART0_RX, 
    output o_UART0_nRTS
    );

    //-------- Address Space Layout --------//
    //Top Block
    parameter ADDR_TOP_SEL_BITS = 1;
    parameter TADDR_TOP_MEM     = 1'd0;
    parameter TADDR_TOP_PERIPH  = 1'd1;

    //---- TOP MEM Block ----//
    parameter ADDR_MEM_SEL_BITS = (ADDR_TOP_SEL_BITS + 2);
    parameter ADDR_MEM = {TADDR_TOP_MEM};

    parameter TADDR_MEM_FLASH = 2'd0; 

    //---- TOP PERIPH Block ----//
    parameter ADDR_PERIPH_SEL_BITS = (ADDR_TOP_SEL_BITS + 3);
    parameter ADDR_PERIPH = {TADDR_TOP_PERIPH};

    parameter TADDR_PERIPH_BROM             = 3'd0;
    parameter TADDR_PERIPH_RAM              = 3'd1;
    parameter TADDR_PERIPH_FLASH_CNTRL      = 3'd2;
    parameter TADDR_PERIPH_UART             = 3'd3;
    parameter TADDR_PERIPH_DISPLAY_C_CNTRL  = 3'd4;

    //---- MASTER BUSES ----//
    // CPU Instuction Master Bus
    wire [29:0]w_AV_IBus_Addr;
    wire [3:0]w_AV_IBus_ByteEn = 4'b1111;
    wire w_AV_IBus_Read;
    wire w_AV_IBus_Write = 0;
    wire [31:0]w_AV_IBus_ReadData;
    wire [31:0]w_AV_IBus_WriteData = 0;
    wire w_AV_IBus_WaitRequest;

    // CPU Data Master Bus
    wire [29:0]w_AV_DBus_Addr;
    wire [3:0]w_AV_DBus_ByteEn;
    wire w_AV_DBus_Read;
    wire w_AV_DBus_Write;
    wire [31:0]w_AV_DBus_ReadData;
    wire [31:0]w_AV_DBus_WriteData;
    wire w_AV_DBus_WaitRequest;

    //---- SLAVE BUSES ----//
    // MEM bus
    wire [31:0]w_AV_FLASH_ReadData = 0;
    wire w_AV_FLASH_WaitRequest = 0;

    wire [29:0]w_AV_MEM_Addr;
    wire [3:0]w_AV_MEM_ByteEn;
    wire w_AV_MEM_Read;
    wire w_AV_MEM_Write;
    wire [31:0]w_AV_MEM_ReadData = w_AV_FLASH_ReadData;
    wire [31:0]w_AV_MEM_WriteData;
    wire w_AV_MEM_WaitRequest = w_AV_FLASH_WaitRequest;

    // Periph bus
    wire [31:0]w_AV_BROM_ReadData;
    wire w_AV_BROM_WaitRequest;

    wire [31:0]w_AV_RAM_ReadData;
    wire w_AV_RAM_WaitRequest;

    wire [31:0]w_AV_FLASH_CNTRL_ReadData = 0;
    wire w_AV_FLASH_CNTRL_WaitRequest = 0;

    wire [31:0]w_AV_UART_ReadData;
    wire w_AV_UART_WaitRequest;

    wire [29:0]w_AV_PERIPH_Addr;
    wire [3:0]w_AV_PERIPH_ByteEn;
    wire w_AV_PERIPH_Read;
    wire w_AV_PERIPH_Write;
    wire [31:0]w_AV_PERIPH_ReadData = w_AV_BROM_ReadData | w_AV_RAM_ReadData | w_AV_FLASH_CNTRL_ReadData | w_AV_UART_ReadData;
    wire [31:0]w_AV_PERIPH_WriteData;
    wire w_AV_PERIPH_WaitRequest = w_AV_BROM_WaitRequest | w_AV_RAM_WaitRequest | w_AV_FLASH_CNTRL_WaitRequest | w_AV_UART_WaitRequest;

    //Main PLL
    wire w_SysClk;
    wire w_VidClk;
    wire w_AudioClk;

    PLL_M PLL_M_0(
        .i_Clk100M(i_OscClk_100Mhz),
        .o_SysClk75M(w_SysClk),
        .o_VidClk25M(w_VidClk),
        .o_I2SClk12_88M(w_AudioClk)
    );

    CPU #(
        //Start executing from BOOT ROM on startup
        .INITIAL_PC_VALUE(32'h80000000)
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

    // MEM Slaves

    // PERIPH Slaves
    BOOTROM #(
        .NUM_PERIPH_SEL_BITS(ADDR_PERIPH_SEL_BITS),
        .PERIPH_SEL_VAL({ADDR_PERIPH, TADDR_PERIPH_BROM}),
        .DEPTH(128)
    )BOOT_ROM0(
        .i_Clk(w_SysClk),

        .i_AV_Addr(w_AV_PERIPH_Addr),
        .i_AV_Read(w_AV_PERIPH_Read),
        .o_AV_ReadData(w_AV_BROM_ReadData),
        .o_AV_WaitRequest(w_AV_BROM_WaitRequest)
    );

    RAM #(
        .NUM_PERIPH_SEL_BITS(ADDR_PERIPH_SEL_BITS),
        .PERIPH_SEL_VAL({ADDR_PERIPH, TADDR_PERIPH_RAM}),
        .DEPTH(128)
    )RAM0(
        .i_Clk(w_SysClk),

        .i_AV_Addr(w_AV_PERIPH_Addr),
        .i_AV_ByteEn(w_AV_PERIPH_ByteEn),
        .i_AV_Read(w_AV_PERIPH_Read),
        .i_AV_Write(w_AV_PERIPH_Write),
        .o_AV_ReadData(w_AV_RAM_ReadData),
        .i_AV_WriteData(w_AV_PERIPH_WriteData),
        .o_AV_WaitRequest(w_AV_RAM_WaitRequest)
    );

    UartBusInterface #(
        .NUM_PERIPH_SEL_BITS(ADDR_PERIPH_SEL_BITS),
        .PERIPH_SEL_VAL({ADDR_PERIPH, TADDR_PERIPH_UART})
    )UART0(
        .i_Clk(w_SysClk),

        .i_AV_Addr(w_AV_PERIPH_Addr),
        .i_AV_ByteEn(w_AV_PERIPH_ByteEn),
        .i_AV_Read(w_AV_PERIPH_Read),
        .i_AV_Write(w_AV_PERIPH_Write),
        .o_AV_ReadData(w_AV_UART_ReadData),
        .i_AV_WriteData(w_AV_PERIPH_WriteData),
        .o_AV_WaitRequest(w_AV_UART_WaitRequest),

        .o_UART_TX(o_UART0_TX),
        .i_UART_nCTS(i_UART0_nCTS),
        .i_UART_RX(i_UART0_RX),
        .o_UART_nRTS(o_UART0_nRTS)
    );

    BusCrossBar #(
        .NUM_MASTERS(2),
        .NUM_SLAVES(2),
        .SEL_NUM_BITS({5'd1, 5'd1}),
        .SEL_VAL({30'd1, 30'd0})
    )BusCrossBar(
        .i_Clk(w_SysClk),

        //Inputs
        .i_AVIn_Addr({w_AV_DBus_Addr, w_AV_IBus_Addr}),
        .i_AVIn_ByteEn({w_AV_DBus_ByteEn, w_AV_IBus_ByteEn}),
        .i_AVIn_Read({w_AV_DBus_Read, w_AV_IBus_Read}),
        .i_AVIn_Write({w_AV_DBus_Write, w_AV_IBus_Write}),
        .o_AVIn_ReadData({w_AV_DBus_ReadData, w_AV_IBus_ReadData}),
        .i_AVIn_WriteData({w_AV_DBus_WriteData, w_AV_IBus_WriteData}),
        .o_AVIn_WaitRequest({w_AV_DBus_WaitRequest, w_AV_IBus_WaitRequest}),

        //Output
        .o_AVOut_Addr({w_AV_PERIPH_Addr, w_AV_MEM_Addr}),
        .o_AVOut_ByteEn({w_AV_PERIPH_ByteEn, w_AV_MEM_ByteEn}),
        .o_AVOut_Read({w_AV_PERIPH_Read, w_AV_MEM_Read}),
        .o_AVOut_Write({w_AV_PERIPH_Write, w_AV_MEM_Write}),
        .i_AVOut_ReadData({w_AV_PERIPH_ReadData, w_AV_MEM_ReadData}),
        .o_AVOut_WriteData({w_AV_PERIPH_WriteData, w_AV_MEM_WriteData}),
        .i_AVOut_WaitRequest({w_AV_PERIPH_WaitRequest, w_AV_MEM_WaitRequest})
    );
endmodule