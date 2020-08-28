`timescale 1ns / 1ps

module SOC(
    input i_OscClk_100Mhz,
    
    //VGA
    output o_VGA_Clk,
    output o_VGA_VSync,
    output o_VGA_HSync,
    output o_VGA_nBlank,
    output [4:0]o_VGA_R,
    output [5:0]o_VGA_G,
    output [4:0]o_VGA_B,

    //User Flash
    output o_UserFlash_Clk,
    output o_UserFlash_nCS,
    inout [3:0]io_UserFlash_IO,

    //UART0
    output UART0_TX,
    input UART0_nCTS,
    input UART0_RX,
    output UART0_nRTS,

    //GPIO0
    output [2:0]o_7Seg_En,
    output [6:0]o_7Seg_Led,

    //I2S0
    output o_I2S_SDIN,
    output o_I2S_SCLK,
    output o_I2S_LCLK,
    output o_I2S_MCLK
    );
    
    //--1080p resolution--//
    //horizontal timing (Line)
    parameter HorSyncTime = 44;
    parameter HorBackPorch = 148;
    parameter HorFrontPorch = 88;
    parameter HorAddrVideoTime = 1920;
    parameter HorEndCnt = 2200;
    //vertical timing (Frame)
    parameter VertSyncTime = 5;
    parameter VertBackPorch = 36;
    parameter VertFrontPorch = 4;
    parameter VertAddrVideoTime = 1080;
    parameter VertEndCnt = 1125;

    //----I/D Bus----//
    //IBus
    wire [29:0]w_IBus_Address;
    wire w_IBus_Read;
    wire [31:0]w_IBus_ReadData;
    wire w_IBus_WaitRequest;

    //DBus
    wire [29:0]w_DBus_Address;
    wire [3:0]w_DBus_ByteEn;
    wire w_DBus_Read;
    wire w_DBus_Write;
    wire [31:0]w_DBus_ReadData;
    wire [31:0]w_DBus_WriteData;
    wire w_DBus_WaitRequest;

    //Address Space Layout//
    //Top Block
    parameter ADDR_TOP_SEL_BITS     = 3;
    parameter ADDR_TOP_MAIN_PERIPH  = 3'd0;

    //----Main Periph Block----//
    parameter ADDR_MAIN_PERIPH_SEL_BITS = 2;
    parameter ADDR_MAIN_PERIPH_SLAVE_SEL_BITS = (ADDR_TOP_SEL_BITS + ADDR_MAIN_PERIPH_SEL_BITS);
    parameter ADDR_MAIN_PERIPH = {ADDR_TOP_MAIN_PERIPH};

    parameter ADDR_MAIN_PERIPH_SDRAM0       = 2'd0;
    parameter ADDR_MAIN_PERIPH_SMALL_PERIPH = 2'd3;

    wire [ADDR_MAIN_PERIPH_SLAVE_SEL_BITS-1:0]w_IBus_MAIN_PERIPH_SlaveSelAddr = w_IBus_Address[29:30-ADDR_MAIN_PERIPH_SLAVE_SEL_BITS];
    wire [29-ADDR_MAIN_PERIPH_SLAVE_SEL_BITS:0]w_IBus_MAIN_PERIPH_RegSelAddr  = w_IBus_Address[29-ADDR_MAIN_PERIPH_SLAVE_SEL_BITS:0];

    wire [ADDR_MAIN_PERIPH_SLAVE_SEL_BITS-1:0]w_DBus_MAIN_PERIPH_SlaveSelAddr = w_DBus_Address[29:30-ADDR_MAIN_PERIPH_SLAVE_SEL_BITS];
    wire [29-ADDR_MAIN_PERIPH_SLAVE_SEL_BITS:0]w_DBus_MAIN_PERIPH_RegSelAddr  = w_DBus_Address[29-ADDR_MAIN_PERIPH_SLAVE_SEL_BITS:0];

    //-SDRAM0-//
    parameter SDRAM0_SlaveAddr = {ADDR_MAIN_PERIPH, ADDR_MAIN_PERIPH_SDRAM0};
    //IBus Port
    wire w_IBUS_SDRAM0_Sel = (w_IBus_MAIN_PERIPH_SlaveSelAddr == SDRAM0_SlaveAddr)? 1: 0;
    wire [31:0]w_IBUS_SDRAM0_ReadData = 0;
    wire w_IBUS_SDRAM0_WaitRequest = 0;
    //DBus Port
    wire w_DBUS_SDRAM0_Sel = (w_DBus_MAIN_PERIPH_SlaveSelAddr == SDRAM0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_SDRAM0_ReadData = 0;
    wire w_DBUS_SDRAM0_WaitRequest = 0;

    //----Small Periph Block----//
    parameter ADDR_SMALL_PERIPH_SEL_BITS = 3;
    parameter ADDR_SMALL_PERIPH_SLAVE_SEL_BITS = (ADDR_MAIN_PERIPH_SLAVE_SEL_BITS + ADDR_SMALL_PERIPH_SEL_BITS);
    parameter ADDR_SMALL_PERIPH = {ADDR_MAIN_PERIPH, ADDR_MAIN_PERIPH_SMALL_PERIPH};

    parameter ADDR_SMALL_PERIPH_QSPI_FLASH0   = 3'd0;
    parameter ADDR_SMALL_PERIPH_VSMALL_PERIPH = 3'd1;
    parameter ADDR_SMALL_PERIPH_TMP_VRAM      = 3'd2;

    wire [ADDR_SMALL_PERIPH_SLAVE_SEL_BITS-1:0]w_IBus_SMALL_PERIPH_SlaveSelAddr = w_IBus_Address[29:30-ADDR_SMALL_PERIPH_SLAVE_SEL_BITS];
    wire [29-ADDR_SMALL_PERIPH_SLAVE_SEL_BITS:0]w_IBus_SMALL_PERIPH_RegSelAddr  = w_IBus_Address[29-ADDR_SMALL_PERIPH_SLAVE_SEL_BITS:0];

    wire [ADDR_SMALL_PERIPH_SLAVE_SEL_BITS-1:0]w_DBus_SMALL_PERIPH_SlaveSelAddr = w_DBus_Address[29:30-ADDR_SMALL_PERIPH_SLAVE_SEL_BITS];
    wire [29-ADDR_SMALL_PERIPH_SLAVE_SEL_BITS:0]w_DBus_SMALL_PERIPH_RegSelAddr  = w_DBus_Address[29-ADDR_SMALL_PERIPH_SLAVE_SEL_BITS:0];

    //-QSPI FLASH0-//
    parameter QSPI_FLASH0_SlaveAddr = {ADDR_SMALL_PERIPH, ADDR_SMALL_PERIPH_QSPI_FLASH0};
    //IBus Port (Not Implemented)
    wire w_IBUS_QSPI_FLASH0_Sel = (w_IBus_SMALL_PERIPH_SlaveSelAddr == QSPI_FLASH0_SlaveAddr)? 1: 0;
    wire [31:0]w_IBUS_QSPI_FLASH0_ReadData = 0;
    wire w_IBUS_QSPI_FLASH0_WaitRequest = 0;

    //DBus Port
    wire w_DBUS_QSPI_FLASH0_Sel = (w_DBus_SMALL_PERIPH_SlaveSelAddr == QSPI_FLASH0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_QSPI_FLASH0_ReadData;
    wire w_DBUS_QSPI_FLASH0_WaitRequest;

    //-Temp VRAM0-//
    parameter TVRAM0_SlaveAddr = {ADDR_SMALL_PERIPH, ADDR_SMALL_PERIPH_TMP_VRAM};
    //DBus Port
    wire w_DBUS_TVRAM0_Sel = (w_DBus_SMALL_PERIPH_SlaveSelAddr == TVRAM0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_TVRAM0_ReadData;
    wire w_DBUS_TVRAM0_WaitRequest;
    
    //----VSmall Periph Block----//
    parameter ADDR_VSMALL_PERIPH_SEL_BITS = 10;
    parameter ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS = (ADDR_SMALL_PERIPH_SLAVE_SEL_BITS + ADDR_VSMALL_PERIPH_SEL_BITS);
    parameter ADDR_VSMALL_PERIPH = {ADDR_SMALL_PERIPH, ADDR_SMALL_PERIPH_VSMALL_PERIPH};

    parameter ADDR_VSMALL_PERIPH_QSPI_FLASH_CNTRL   = 10'd0;
    parameter ADDR_VSMALL_PERIPH_ROM0               = 10'd1;
    parameter ADDR_VSMALL_PERIPH_DRAM0              = 10'd2;
    parameter ADDR_VSMALL_PERIPH_UART0              = 10'd3;
    parameter ADDR_VSMALL_PERIPH_UART1              = 10'd4;
    parameter ADDR_VSMALL_PERIPH_SPI0               = 10'd5;
    parameter ADDR_VSMALL_PERIPH_SPI1               = 10'd6;
    parameter ADDR_VSMALL_PERIPH_I2S0               = 10'd7;
    parameter ADDR_VSMALL_PERIPH_COUNTER0           = 10'd8;
    parameter ADDR_VSMALL_PERIPH_GPIO               = 10'd9;

    wire [ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS-1:0]w_IBus_VSMALL_PERIPH_SlaveSelAddr = w_IBus_Address[29:30-ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS];
    wire [29-ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS:0]w_IBus_VSMALL_PERIPH_RegSelAddr  = w_IBus_Address[29-ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS:0];

    wire [ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS-1:0]w_DBus_VSMALL_PERIPH_SlaveSelAddr = w_DBus_Address[29:30-ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS];
    wire [29-ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS:0]w_DBus_VSMALL_PERIPH_RegSelAddr  = w_DBus_Address[29-ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS:0];

    //-QSPI FLASH0 CNTRL-//
    parameter QSPI_FLASH0_CNTL_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_QSPI_FLASH_CNTRL};
    //DBUS Port
    wire w_DBUS_QSPI_FLASH0_CNTL_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == QSPI_FLASH0_CNTL_SlaveAddr)? 1: 0;

    //-ROM0-//
    parameter ROM0_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_ROM0};
    //IBus Port
    wire w_IBUS_ROM0_Sel = (w_IBus_VSMALL_PERIPH_SlaveSelAddr == ROM0_SlaveAddr)? 1: 0;
    wire [31:0]w_IBUS_ROM0_ReadData;
    wire w_IBUS_ROM0_WaitRequest;
    //DBus Port
    wire w_DBUS_ROM0_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == ROM0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_ROM0_ReadData;
    wire w_DBUS_ROM0_WaitRequest;

    //-DRAM0-//
    //DBus Port
    parameter DRAM0_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_DRAM0};
    wire w_DBUS_DRAM0_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == DRAM0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_DRAM0_ReadData;
    wire w_DBUS_DRAM0_WaitRequest;

    //-UART0-//
    parameter UART0_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_UART0};
    //DBus Port
    wire w_DBUS_UART0_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == UART0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_UART0_ReadData;
    wire w_DBUS_UART0_WaitRequest;

    //-UART1-//
    parameter UART1_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_UART1};
    //DBus Port
    wire w_DBUS_UART1_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == UART1_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_UART1_ReadData = 0;
    wire w_DBUS_UART1_WaitRequest = 0;

    //-SPI0-//
    parameter SPI0_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_SPI0};
    //DBus Port
    wire w_DBUS_SPI0_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == SPI0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_SPI0_ReadData = 0;
    wire w_DBUS_SPI0_WaitRequest = 0;

    //-SPI1-//
    parameter SPI1_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_SPI1};
    //DBus Port
    wire w_DBUS_SPI1_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == SPI1_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_SPI1_ReadData = 0;
    wire w_DBUS_SPI1_WaitRequest = 0;

    //-I2S0-//
    parameter I2S0_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_I2S0};
    //DBus Port
    wire w_DBUS_I2S0_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == I2S0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_I2S0_ReadData;
    wire w_DBUS_I2S0_WaitRequest;

    //-COUNTER0-//
    parameter COUNTER0_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_COUNTER0};
    //DBus Port
    wire w_DBUS_COUNTER0_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == COUNTER0_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_COUNTER0_ReadData;
    wire w_DBUS_COUNTER0_WaitRequest;

    //-GPIO-//
    parameter GPIO_SlaveAddr = {ADDR_VSMALL_PERIPH, ADDR_VSMALL_PERIPH_GPIO};
    //DBus Port
    wire w_DBUS_GPIO_Sel = (w_DBus_VSMALL_PERIPH_SlaveSelAddr == GPIO_SlaveAddr)? 1: 0;
    wire [31:0]w_DBUS_GPIO_ReadData;
    wire w_DBUS_GPIO_WaitRequest;

    //--IBus Slave Driver--//
    assign w_IBus_ReadData = w_IBUS_SDRAM0_ReadData | w_IBUS_ROM0_ReadData | w_IBUS_QSPI_FLASH0_ReadData;
    assign w_IBus_WaitRequest = w_IBUS_SDRAM0_WaitRequest | w_IBUS_ROM0_WaitRequest | w_IBUS_QSPI_FLASH0_WaitRequest;

    //--DBus Slave Driver--//
    assign w_DBus_ReadData = w_DBUS_SDRAM0_ReadData | w_DBUS_QSPI_FLASH0_ReadData | w_DBUS_TVRAM0_ReadData | w_DBUS_ROM0_ReadData | w_DBUS_DRAM0_ReadData | w_DBUS_GPIO_ReadData
                           | w_DBUS_UART0_ReadData | w_DBUS_UART1_ReadData | w_DBUS_SPI0_ReadData | w_DBUS_SPI1_ReadData | w_DBUS_I2S0_ReadData | w_DBUS_COUNTER0_ReadData;

    assign w_DBus_WaitRequest = w_DBUS_SDRAM0_WaitRequest | w_DBUS_QSPI_FLASH0_WaitRequest | w_DBUS_TVRAM0_WaitRequest | w_DBUS_ROM0_WaitRequest | w_DBUS_DRAM0_WaitRequest | w_DBUS_GPIO_WaitRequest
                              | w_DBUS_UART0_WaitRequest | w_DBUS_UART1_WaitRequest | w_DBUS_SPI0_WaitRequest | w_DBUS_SPI1_WaitRequest | w_DBUS_I2S0_WaitRequest | w_DBUS_COUNTER0_WaitRequest;

    //--PLL_M Signals--//
    wire w_SysClk;
    wire w_VidClk;
    wire w_AudioClk;

    //--CPU DBUS Arbitor--//
    wire w_CPU0_DBus_Req;
    reg r_CPU0_DBus_Gnt = 1'b0;

    always @(posedge w_SysClk) begin
        //If the slave asserted the wait request signals, we want the master that won
        //abitration to stay on
        if(!w_DBus_WaitRequest)begin
            r_CPU0_DBus_Gnt <= w_CPU0_DBus_Req;
        end
    end

    PLL_M PLL_M_0(
        .i_Clk100M(i_OscClk_100Mhz),
        .o_SysClk75M(w_SysClk),
        .o_VidClk25M(w_VidClk),
        .o_I2SClk12_88M(w_AudioClk)
    );

    CPU #(
        //Starts executing from ROM
        .INITIAL_PC_VALUE(32'h19004000)
    )CPU0 (
        .i_Clk(w_SysClk),

        //IBus Master
        .o_IBus_Address(w_IBus_Address),
        .o_IBus_Read(w_IBus_Read),
        .i_IBus_ReadData(w_IBus_ReadData),
        .i_IBus_WaitReq(w_IBus_WaitRequest),

        //DBus Master
        .o_DBus_Req_E(w_CPU0_DBus_Req),
        .i_DBus_Gnt_M(1'b1),
        
        .o_DBus_Address(w_DBus_Address),
        .o_DBus_ByteEn(w_DBus_ByteEn),
        .o_DBus_Read(w_DBus_Read),
        .o_DBus_Write(w_DBus_Write),
        .i_DBus_ReadData(w_DBus_ReadData),
        .o_DBus_WriteData(w_DBus_WriteData),
        .i_DBus_WaitRequest(w_DBus_WaitRequest)
    );

    FlashBusInterface #(
        .MEM_ADDR_SEL_BITS(ADDR_SMALL_PERIPH_SLAVE_SEL_BITS),
        .CNTRL_ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS)
    )FLASH0(
        .i_Clk(w_SysClk),

        //DBUS
        .i_MEM_SlaveSel(w_DBUS_QSPI_FLASH0_Sel),
        .i_MEM_RegAddr(w_DBus_SMALL_PERIPH_RegSelAddr),
        
        .i_CNTRL_SlaveSel(w_DBUS_QSPI_FLASH0_CNTL_Sel),
        .i_CNTRL_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_QSPI_FLASH0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_QSPI_FLASH0_WaitRequest),

        .o_Flash_Clk(o_UserFlash_Clk),
        .o_Flash_nCS(o_UserFlash_nCS),
        .io_Flash_IO(io_UserFlash_IO)
    );

    VideoDriver #(
        //Video Timings
        .HorSyncTime(HorSyncTime),
		.HorBackPorch(HorBackPorch),
		.HorFrontPorch(HorFrontPorch),
		.HorAddrVideoTime(HorAddrVideoTime),
		.HorEndCnt(HorEndCnt),

		.VertSyncTime(VertSyncTime),
		.VertBackPorch(VertBackPorch),
		.VertFrontPorch(VertFrontPorch),
		.VertAddrVideoTime(VertAddrVideoTime),
		.VertEndCnt(VertEndCnt),

        .ADDR_SEL_BITS(ADDR_SMALL_PERIPH_SLAVE_SEL_BITS)
    )VideoDriver(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_DBUS_TVRAM0_Sel),
        .i_RegAddr(w_DBus_SMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_TVRAM0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_TVRAM0_WaitRequest),

        //Video
        .i_VidClk(w_VidClk),

        .o_Pixel_Clk(o_VGA_Clk),
		.o_VSync(o_VGA_VSync),
		.o_HSync(o_VGA_HSync),
		.o_nBlank(o_VGA_nBlank),
		.o_R(o_VGA_R),
		.o_G(o_VGA_G),
		.o_B(o_VGA_B)
    );

    ROM #(
        .ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS),
        .DEPTH(512)
    )ROM0(
        .i_Clk(w_SysClk),

        //IBus Slave
        .i_AV0_SlaveSel(w_IBUS_ROM0_Sel),
        .i_AV0_RegAddr(w_IBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV0_Read(w_IBus_Read),
        .o_AV0_ReadData(w_IBUS_ROM0_ReadData),
        .o_AV0_WaitRequest(w_IBUS_ROM0_WaitRequest),

        //DBus Slave
        .i_AV1_SlaveSel(w_DBUS_ROM0_Sel),
        .i_AV1_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV1_Read(w_DBus_Read),
        .o_AV1_ReadData(w_DBUS_ROM0_ReadData),
        .o_AV1_WaitRequest(w_DBUS_ROM0_WaitRequest)
    );

    RAM #(
        .ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS),
        .DEPTH(512)
    )DRAM0(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_DBUS_DRAM0_Sel),
        .i_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_DRAM0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_DRAM0_WaitRequest)
    );

    UartBusInterface #(
        .ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS)
    )UART0(
        .i_Clk(w_SysClk),
        
        //DBus Slave
        .i_SlaveSel(w_DBUS_UART0_Sel),
        .i_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_UART0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_UART0_WaitRequest),

        .o_UART_TX(UART0_TX),
        .i_UART_nCTS(UART0_nCTS),
        .i_UART_RX(UART0_RX),
        .o_UART_nRTS(UART0_nRTS)
    );
    
    I2SBusInterface#(
        .ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS)
    )I2S0(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_DBUS_I2S0_Sel),
        .i_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_I2S0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_I2S0_WaitRequest),

        //I2S0 Output
        .i_Audio_Clk(w_AudioClk),
        .o_I2S0_SDIN(o_I2S_SDIN),
        .o_I2S0_SCLK(o_I2S_SCLK),
        .o_I2S0_LRCK(o_I2S_LCLK),
        .o_I2S0_MCLK(o_I2S_MCLK)
    );

    Counter #(
        .ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS)
    )Counter0(
        .i_Clk(w_SysClk),
        
        //DBus Slave
        .i_SlaveSel(w_DBUS_COUNTER0_Sel),
        .i_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_COUNTER0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_COUNTER0_WaitRequest)
    );

    GPIOBusInterface #(
        .ADDR_SEL_BITS(ADDR_VSMALL_PERIPH_SLAVE_SEL_BITS)
    )GPIO0(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_DBUS_GPIO_Sel),
        .i_RegAddr(w_DBus_VSMALL_PERIPH_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_DBUS_GPIO_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_DBUS_GPIO_WaitRequest),

        //GPIO
        .o_7Seg_En(o_7Seg_En),
        .o_7Seg_Led(o_7Seg_Led)
    );
endmodule