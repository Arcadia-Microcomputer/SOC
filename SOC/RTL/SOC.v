`timescale 1ns / 1ps

module SOC(
    input i_OscClk_100Mhz
    
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

    // //UART0
    // output UART0_TX,
    // input UART0_nCTS,
    // input UART0_RX,
    // output UART0_nRTS,

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
    parameter ADDR_TOP_MEM      = 2'd0;
    parameter ADDR_TOP_PERIPH   = 2'd3;

    //----TOP MEM Block----//
    parameter ADDR_MEM_SEL_BITS = (ADDR_TOP_SEL_BITS + 3);
    parameter ADDR_MEM = {ADDR_TOP_MEM};

    parameter ADDR_MEM_SDRAM0      = 3'd0;
    parameter ADDR_MEM_SMALL_MEM   = 3'd7;

    //----TOP MEM SMALL_MEM Block----//
    parameter ADDR_SMALL_MEM_SEL_BITS = (ADDR_MEM_SEL_BITS + 3);
    parameter ADDR_SMALL_MEM = {ADDR_MEM, ADDR_MEM_SMALL_MEM};
    parameter ADDR_SMALL_MEM_QSPI0 = 3'd0;

    //----TOP PERIPH Block----//
    parameter ADDR_PERIPH_SEL_BITS = (ADDR_TOP_SEL_BITS + 8);
    parameter ADDR_PERIPH = {ADDR_TOP_PERIPH};

    parameter ADDR_PERIPH_RAM           = 8'd0;
    parameter ADDR_PERIPH_SMALL_PERIPH  = 8'd255;

    //----TOP PERIPH SMALL_PERIPH Block----//
    parameter ADDR_SMALL_PERIPH_SEL_BITS = (ADDR_PERIPH_SEL_BITS + 10);
    parameter ADDR_SMALL_PERIPH = {ADDR_PERIPH, ADDR_PERIPH_SMALL_PERIPH};

    parameter ADDR_SMALL_PERIPH_BOOT_ROM      = 10'd0;
    parameter ADDR_SMALL_PERIPH_QSPI0_CNTRL   = 10'd1;
    parameter ADDR_SMALL_PERIPH_GPIO          = 10'd2;
    parameter ADDR_SMALL_PERIPH_WSG           = 10'd3;
    parameter ADDR_SMALL_PERIPH_UART0         = 10'd4;
    parameter ADDR_SMALL_PERIPH_UART1         = 10'd5;
    parameter ADDR_SMALL_PERIPH_SPI0          = 10'd6;
    parameter ADDR_SMALL_PERIPH_SPI1          = 10'd7;
    parameter ADDR_SMALL_PERIPH_I2S0          = 10'd8;
    parameter ADDR_SMALL_PERIPH_TIMER0        = 10'd9;
    parameter ADDR_SMALL_PERIPH_TIMER1        = 10'd10;

    //--Bus Masters Signals--/
    //CPU Instuction Bus
    wire [29:0]r_AV_IBus_Addr;
    wire [3:0]r_AV_IBus_ByteEn = 4'b1111;
    wire r_AV_IBus_Read;
    wire [31:0]w_AV_IBus_ReadData;
    wire r_AV_IBus_Write = 0;
    wire [31:0]r_AV_IBus_WriteData = 0;
    wire w_AV_IBus_WaitRequest;
    wire [7:0]r_AV_IBus_BurstCount = 1;

    //CPU Data Bus
    wire [29:0]r_AV_DBus_Addr;
    wire [3:0]r_AV_DBus_ByteEn;
    wire r_AV_DBus_Read;
    wire [31:0]w_AV_DBus_ReadData;
    wire r_AV_DBus_Write;
    wire [31:0]r_AV_DBus_WriteData;
    wire w_AV_DBus_WaitRequest;
    wire [7:0]r_AV_DBus_BurstCount = 1;

    //VGA Video Bus
    wire [29:0]r_AV_VGABus_Addr = 0;
    wire [3:0]r_AV_VGABus_ByteEn = 4'b1111;
    wire r_AV_VGABus_Read = 0;
    wire [31:0]w_AV_VGABus_ReadData;
    wire r_AV_VGABus_Write = 0;
    wire [31:0]r_AV_VGABus_WriteData = 0;
    wire w_AV_VGABus_WaitRequest;
    wire [7:0]r_AV_VGABus_BurstCount = 0;

    //2D DMA bus
    wire [29:0]r_AV_2DDMA_Addr = 0;
    wire [3:0]r_AV_2DDMA_ByteEn = 4'b1111;
    wire r_AV_2DDMA_Read = 0;
    wire [31:0]w_AV_2DDMA_ReadData;
    wire r_AV_2DDMA_Write = 0;
    wire [31:0]r_AV_2DDMA_WriteData = 0;
    wire w_AV_2DDMA_WaitRequest;
    wire [7:0]r_AV_2DDMA_BurstCount = 0;

    //DMA Bus
    wire [29:0]r_AV_DMA_Addr = 0;
    wire [3:0]r_AV_DMA_ByteEn = 4'b1111;
    wire r_AV_DMA_Read = 0;
    wire [31:0]w_AV_DMA_ReadData;
    wire r_AV_DMA_Write = 0;
    wire [31:0]r_AV_DMA_WriteData = 0;
    wire w_AV_DMA_WaitRequest;
    wire [7:0]r_AV_DMA_BurstCount = 0;

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
        //Starts executing from ROM
        .INITIAL_PC_VALUE(32'hFFC00000)
    )CPU0 (
        .i_Clk(w_SysClk),

        //IBus Master
        .o_IBus_Address(r_AV_IBus_Addr),
        .o_IBus_Read(r_AV_IBus_Read),
        .i_IBus_ReadData(w_AV_IBus_ReadData),
        .i_IBus_WaitReq(w_AV_IBus_WaitRequest),

        //DBus Master
        .i_DBus_Gnt_M(1'b1),
        
        .o_DBus_Address(r_AV_DBus_Addr),
        .o_DBus_ByteEn(r_AV_DBus_ByteEn),
        .o_DBus_Read(r_AV_DBus_Read),
        .o_DBus_Write(r_AV_DBus_Write),
        .i_DBus_ReadData(w_AV_DBus_ReadData),
        .o_DBus_WriteData(r_AV_DBus_WriteData),
        .i_DBus_WaitRequest(w_AV_DBus_WaitRequest)
    );

    BOOTROM #(
        .ADDR_SEL_BITS(ADDR_SMALL_PERIPH_SEL_BITS),
        .DEPTH(1024)
    )BOOT_ROM0(
        .i_Clk(w_SysClk),

        //IBus Slave
        .i_AV0_SlaveSel(),
        .i_AV0_RegAddr(),
        .i_AV0_Read(),
        .o_AV0_ReadData(),
        .o_AV0_WaitRequest(),

        //DBus Slave
        .i_AV1_SlaveSel(),
        .i_AV1_RegAddr(),
        .i_AV1_Read(),
        .o_AV1_ReadData(),
        .o_AV1_WaitRequest()
    );

    RAM #(
        .ADDR_SEL_BITS(ADDR_PERIPH_SEL_BITS),
        .DEPTH(1024)
    )RAM0(
        .i_Clk(w_SysClk),

        //IBus R Slave
        .i_AV0_SlaveSel(),
        .i_AV0_RegAddr(),
        .i_AV0_Read(),
        .o_AV0_ReadData(),
        .o_AV0_WaitRequest(),

        //DBus RW Slave
        .i_AV1_SlaveSel(),
        .i_AV1_RegAddr(),
        .i_AV1_ByteEn(),
        .i_AV1_Read(),
        .i_AV1_Write(),
        .o_AV1_ReadData(),
        .i_AV1_WriteData(),
        .o_AV1_WaitRequest()
    );

endmodule