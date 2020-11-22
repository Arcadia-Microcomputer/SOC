`timescale 1ns / 1ps

module SOC(
    input i_OscClk_100Mhz,
    
    // //VGA
    // output o_VGA_Clk,
    // output o_VGA_VSync,
    // output o_VGA_HSync,
    // output o_VGA_nBlank,
    // output [4:0]o_VGA_R,
    // output [5:0]o_VGA_G,
    // output [4:0]o_VGA_B,

    // //User Flash
    // output o_UserFlash_Clk,
    // output o_UserFlash_nCS,
    // inout [3:0]io_UserFlash_IO,

    //UART0
    output UART0_TX,
    input UART0_nCTS,
    input UART0_RX, 
    output UART0_nRTS

    // //GPIO0
    // output [2:0]o_7Seg_En,
    // output [6:0]o_7Seg_Led,

    // //I2S0
    // output o_I2S_SDIN,
    // output o_I2S_SCLK,
    // output o_I2S_LCLK,
    // output o_I2S_MCLK
    );

    //------------Address Space Layout---------------//
    //Top Block
    parameter ADDR_TOP_SEL_BITS = 2;
    parameter TADDR_TOP_MEM      = 2'd0;
    parameter TADDR_TOP_PERIPH   = 2'd3;

    //----TOP MEM Block----//
    parameter ADDR_MEM_SEL_BITS = (ADDR_TOP_SEL_BITS + 3);
    parameter ADDR_MEM = {TADDR_TOP_MEM};

    parameter TADDR_MEM_SDRAM0      = 3'd0;
    parameter TADDR_MEM_SMALL_MEM   = 3'd7;

    //----TOP MEM SMALL_MEM Block----//
    parameter ADDR_SMALL_MEM_SEL_BITS = (ADDR_MEM_SEL_BITS + 3);
    parameter ADDR_SMALL_MEM = {ADDR_MEM, TADDR_MEM_SMALL_MEM};

    parameter TADDR_SMALL_MEM_QSPI0 = 3'd0;

    //----TOP PERIPH Block----//
    parameter ADDR_PERIPH_SEL_BITS = (ADDR_TOP_SEL_BITS + 4);
    parameter ADDR_PERIPH = {TADDR_TOP_PERIPH};

    parameter TADDR_PERIPH_MMEM          = 4'd0;
    parameter TADDR_PERIPH_SMALL_PERIPH  = 4'd15;

    //----TOP PERIPH MISC_MEM Block----//
    parameter ADDR_MMEM_SEL_BITS = (ADDR_PERIPH_SEL_BITS + 3);
    parameter ADDR_MMEM = {ADDR_PERIPH, TADDR_PERIPH_MMEM};

    parameter TADDR_MMEM_RAM = 3'd0;
    parameter TADDR_MMEM_BOOT_ROM = 3'd1;

    //----TOP PERIPH SMALL_PERIPH Block----//
    parameter ADDR_SMALL_PERIPH_SEL_BITS = (ADDR_PERIPH_SEL_BITS + 10);
    parameter ADDR_SMALL_PERIPH = {ADDR_PERIPH, TADDR_PERIPH_SMALL_PERIPH};

    parameter TADDR_SMALL_PERIPH_QSPI0_CNTRL   = 10'd0;
    parameter TADDR_SMALL_PERIPH_GPIO          = 10'd1;
    parameter TADDR_SMALL_PERIPH_WSG           = 10'd2;
    parameter TADDR_SMALL_PERIPH_UART0         = 10'd3;
    parameter TADDR_SMALL_PERIPH_UART1         = 10'd4;
    parameter TADDR_SMALL_PERIPH_SPI0          = 10'd5;
    parameter TADDR_SMALL_PERIPH_SPI1          = 10'd6;
    parameter TADDR_SMALL_PERIPH_I2S0          = 10'd7;
    parameter TADDR_SMALL_PERIPH_TIMER0        = 10'd8;
    parameter TADDR_SMALL_PERIPH_TIMER1        = 10'd9;

    //--Sub Bus Masters Signals--/
    //CPU Instuction Master Bus
    wire [29:0]w_AV_IBus_Addr;
    wire [3:0]w_AV_IBus_ByteEn = 4'b1111;
    wire w_AV_IBus_Read;
    wire [31:0]w_AV_IBus_ReadData;
    wire w_AV_IBus_Write = 0;
    wire [31:0]w_AV_IBus_WriteData = 0;
    wire w_AV_IBus_WaitRequest;
    wire [7:0]w_AV_IBus_BurstCount = 1;

    //CPU Data Master Bus
    wire [29:0]w_AV_DBus_Addr;
    wire [3:0]w_AV_DBus_ByteEn;
    wire w_AV_DBus_Read;
    wire [31:0]w_AV_DBus_ReadData;
    wire w_AV_DBus_Write;
    wire [31:0]w_AV_DBus_WriteData;
    wire w_AV_DBus_WaitRequest;
    wire [7:0]w_AV_DBus_BurstCount = 1;

    //VGA Video Master Bus
    wire [29:0]w_AV_VGABus_Addr = 0;
    wire [3:0]w_AV_VGABus_ByteEn = 4'b1111;
    wire w_AV_VGABus_Read = 0;
    wire [31:0]w_AV_VGABus_ReadData;
    wire w_AV_VGABus_Write = 0;
    wire [31:0]w_AV_VGABus_WriteData = 0;
    wire w_AV_VGABus_WaitRequest;
    wire [7:0]w_AV_VGABus_BurstCount = 0;

    //2D DMA Master bus
    wire [29:0]w_AV_2DDMA_Addr = 0;
    wire [3:0]w_AV_2DDMA_ByteEn = 4'b1111;
    wire w_AV_2DDMA_Read = 0;
    wire [31:0]w_AV_2DDMA_ReadData;
    wire w_AV_2DDMA_Write = 0;
    wire [31:0]w_AV_2DDMA_WriteData = 0;
    wire w_AV_2DDMA_WaitRequest;
    wire [7:0]w_AV_2DDMA_BurstCount = 0;

    //DMA Master Bus
    wire [29:0]w_AV_DMA_Addr = 0;
    wire [3:0]w_AV_DMA_ByteEn = 4'b1111;
    wire w_AV_DMA_Read = 0;
    wire [31:0]w_AV_DMA_ReadData;
    wire w_AV_DMA_Write = 0;
    wire [31:0]w_AV_DMA_WriteData = 0;
    wire w_AV_DMA_WaitRequest;
    wire [7:0]w_AV_DMA_BurstCount = 0;

    //--Sub Bus Slave Signals--/
    //DRAM
    wire [29:0]w_AV_DRAM_Addr;
    wire [3:0]w_AV_DRAM_ByteEn;
    wire w_AV_DRAM_Read;
    wire [31:0]w_AV_DRAM_ReadData = 0;
    wire w_AV_DRAM_Write;
    wire [31:0]w_AV_DRAM_WriteData;
    wire w_AV_DRAM_WaitRequest = 0;
    wire [7:0]w_AV_DRAM_BurstCount;

    //Flash
    wire [29:0]w_AV_FLASH_Addr;
    wire [3:0]w_AV_FLASH_ByteEn;
    wire w_AV_FLASH_Read;
    wire [31:0]w_AV_FLASH_ReadData = 0;
    wire w_AV_FLASH_Write;
    wire [31:0]w_AV_FLASH_WriteData;
    wire w_AV_FLASH_WaitRequest = 0;
    wire [7:0]w_AV_FLASH_BurstCount;

    //Misc Mem Bus
    wire[31:0]w_AV_BOOTROM_ReadData;
    wire w_AV_BOOTROM_WaitRequest;
    wire[31:0]w_AV_RAM_ReadData;
    wire w_AV_RAM_WaitRequest;

    wire [29:0]w_AV_MMEM_Addr;
    wire [3:0]w_AV_MMEM_ByteEn;
    wire w_AV_MMEM_Read;
    wire [31:0]w_AV_MMEM_ReadData = w_AV_BOOTROM_ReadData | w_AV_RAM_ReadData;
    wire w_AV_MMEM_Write;
    wire [31:0]w_AV_MMEM_WriteData;
    wire w_AV_MMEM_WaitRequest = w_AV_RAM_WaitRequest | w_AV_BOOTROM_WaitRequest;
    wire [7:0]w_AV_MMEM_BurstCount;

    //Periph Bus
    wire [31:0]w_AV_UART0_ReadData;
    wire w_AV_UART0_WaitRequest;

    wire [29:0]w_AV_PERIPH_Addr;
    wire [3:0]w_AV_PERIPH_ByteEn;
    wire w_AV_PERIPH_Read;
    wire [31:0]w_AV_PERIPH_ReadData = w_AV_UART0_ReadData;
    wire w_AV_PERIPH_Write;
    wire [31:0]w_AV_PERIPH_WriteData;
    wire w_AV_PERIPH_WaitRequest = w_AV_UART0_WaitRequest;
    wire [7:0]w_AV_PERIPH_BurstCount;

    //--PLL_M Signals--//
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
        //Starts executing from BOOT ROM
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

    BOOTROM #(
        .NUM_PERIPH_SEL_BITS(ADDR_MMEM_SEL_BITS),
        .PERIPH_SEL_VAL({ADDR_MMEM, TADDR_MMEM_BOOT_ROM}),
        .DEPTH(1024)
    )BOOT_ROM0(
        .i_Clk(w_SysClk),

        //IBus Slave
        .i_AV_Addr(w_AV_MMEM_Addr),
        .i_AV_Read(w_AV_MMEM_Read),
        .o_AV_ReadData(w_AV_BOOTROM_ReadData),
        .o_AV_WaitRequest(w_AV_BOOTROM_WaitRequest)
    );

    RAM #(
        .NUM_PERIPH_SEL_BITS(ADDR_MMEM_SEL_BITS),
        .PERIPH_SEL_VAL({ADDR_MMEM, TADDR_MMEM_RAM}),
        .DEPTH(1024)
    )RAM0(
        .i_Clk(w_SysClk),

        //RW Slave
        .i_AV_Addr(w_AV_MMEM_Addr),
        .i_AV_ByteEn(w_AV_MMEM_ByteEn),
        .i_AV_Read(w_AV_MMEM_Read),
        .o_AV_ReadData(w_AV_RAM_ReadData),
        .i_AV_Write(w_AV_MMEM_Write),
        .i_AV_WriteData(w_AV_MMEM_WriteData),
        .o_AV_WaitRequest(w_AV_RAM_WaitRequest)
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

    XBarInterconnect #(
        .ADDR_SEL_BITS_O0(ADDR_MEM_SEL_BITS),
        .ADDR_SEL_O0({ADDR_MEM, TADDR_MEM_SDRAM0}),
        .ADDR_SEL_BITS_O1(ADDR_SMALL_MEM_SEL_BITS),
        .ADDR_SEL_O1({ADDR_SMALL_MEM, TADDR_SMALL_MEM_QSPI0}),
        .ADDR_SEL_BITS_O2(ADDR_PERIPH_SEL_BITS),
        .ADDR_SEL_O2(ADDR_MMEM),
        .ADDR_SEL_BITS_O3(ADDR_PERIPH_SEL_BITS),
        .ADDR_SEL_O3(ADDR_SMALL_PERIPH)
    )XBarInterconnect0(
        .i_Clk(w_SysClk),

        //Inputs
        .i_AVIn_Addr({w_AV_DMA_Addr, w_AV_2DDMA_Addr, w_AV_VGABus_Addr, w_AV_DBus_Addr, w_AV_IBus_Addr}),
        .i_AVIn_ByteEn({w_AV_DMA_ByteEn, w_AV_2DDMA_ByteEn, w_AV_VGABus_ByteEn, w_AV_DBus_ByteEn, w_AV_IBus_ByteEn}),
        .i_AVIn_Read({w_AV_DMA_Read, w_AV_2DDMA_Read, w_AV_VGABus_Read, w_AV_DBus_Read, w_AV_IBus_Read}),
        .o_AVIn_ReadData({w_AV_DMA_ReadData, w_AV_2DDMA_ReadData, w_AV_VGABus_ReadData, w_AV_DBus_ReadData, w_AV_IBus_ReadData}),
        .i_AVIn_Write({w_AV_DMA_Write, w_AV_2DDMA_Write, w_AV_VGABus_Write, w_AV_DBus_Write, w_AV_IBus_Write}),
        .i_AVIn_WriteData({w_AV_DMA_WriteData, w_AV_2DDMA_WriteData, w_AV_VGABus_WriteData, w_AV_DBus_WriteData, w_AV_IBus_WriteData}),
        .o_AVIn_WaitRequest({w_AV_DMA_WaitRequest, w_AV_2DDMA_WaitRequest, w_AV_VGABus_WaitRequest, w_AV_DBus_WaitRequest, w_AV_IBus_WaitRequest}),
        .i_AVIn_BurstCount({w_AV_DMA_BurstCount, w_AV_2DDMA_BurstCount, w_AV_VGABus_BurstCount, w_AV_DBus_BurstCount, w_AV_IBus_BurstCount}),

        //Output
        .o_AVOut_Addr({w_AV_PERIPH_Addr, w_AV_MMEM_Addr, w_AV_FLASH_Addr, w_AV_DRAM_Addr}),
        .o_AVOut_ByteEn({w_AV_PERIPH_ByteEn, w_AV_MMEM_ByteEn, w_AV_FLASH_ByteEn, w_AV_DRAM_ByteEn}),
        .o_AVOut_Read({w_AV_PERIPH_Read, w_AV_MMEM_Read, w_AV_FLASH_Read, w_AV_DRAM_Read}),
        .i_AVOut_ReadData({w_AV_PERIPH_ReadData, w_AV_MMEM_ReadData, w_AV_FLASH_ReadData, w_AV_DRAM_ReadData}),
        .o_AVOut_Write({w_AV_PERIPH_Write, w_AV_MMEM_Write, w_AV_FLASH_Write, w_AV_DRAM_Write}),
        .o_AVOut_WriteData({w_AV_PERIPH_WriteData, w_AV_MMEM_WriteData, w_AV_FLASH_WriteData, w_AV_DRAM_WriteData}),
        .i_AVOut_WaitRequest({w_AV_PERIPH_WaitRequest, w_AV_MMEM_WaitRequest, w_AV_FLASH_WaitRequest, w_AV_DRAM_WaitRequest}),
        .o_AVOut_BurstCount({w_AV_PERIPH_BurstCount, w_AV_MMEM_BurstCount, w_AV_FLASH_BurstCount, w_AV_DRAM_BurstCount})
    );
endmodule