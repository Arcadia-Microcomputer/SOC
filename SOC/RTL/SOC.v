`timescale 1ns / 1ps

module SOC(
    input i_OscClk_100Mhz,

    output io_IO,

    //VGA
    output o_VGA_Clk,
    output o_VGA_VSync,
    output o_VGA_HSync,
    output o_VGA_nBlank,
    output [4:0]o_VGA_R,
    output [5:0]o_VGA_G,
    output [4:0]o_VGA_B
    );
    
    //--480p resolution--//
    //horizontal timing (Line)
    parameter HorSyncTime = 96;
    parameter HorBackPorch = 48;
    parameter HorFrontPorch = 16;
    parameter HorAddrVideoTime = 640;
    parameter HorEndCnt = 800;
    //vertical timing (Frame)
    parameter VertSyncTime = 2;
    parameter VertBackPorch = 32;
    parameter VertFrontPorch = 10;
    parameter VertAddrVideoTime = 480;
    parameter VertEndCnt = 525;

    //--IBus Layout--//
    //Top Block
    parameter IBUS_TOP_SEL_BITS = 4;
    parameter IBUS_TOP_ROM      = 4'd0;

    //--PLL_M Signals--//
    wire w_SysClk;
    wire w_VidClk;
    
    //--IBus--//
    wire [29:0]w_IBus_Address;
    wire w_IBus_Read;
    wire [31:0]w_IBus_ReadData;
    wire w_IBus_WaitRequest;

    //------- DBus --------//
    wire [29:0]w_DBus_Address;
    wire [3:0]w_DBus_ByteEn;
    wire w_DBus_Read;
    wire w_DBus_Write;
    wire [31:0]w_DBus_ReadData;
    wire [31:0]w_DBus_WriteData;
    wire w_DBus_WaitRequest;

    //Top Block
    parameter DBUS_TOP_SEL_BITS = 4;
    parameter DBUS_TOP_SDRAM    = 4'd0;
    parameter DBUS_TOP_MEM      = 4'd1;
    parameter DBUS_TOP_IO       = 4'd2;

    //---DBUS MEM Block---//
    parameter DBUS_MEM_SEL_BITS = 4;
    parameter DBUS_MEM_SLAVE_SEL_BITS = (DBUS_TOP_SEL_BITS + DBUS_MEM_SEL_BITS);
    parameter DBUS_MEM_FLASH    = 4'd0;
    parameter DBUS_MEM_DROM     = 4'd1;

    wire [DBUS_MEM_SLAVE_SEL_BITS-1:0]w_DBUS_MEM_SlaveSelAddr = w_DBus_Address[29:30-DBUS_MEM_SLAVE_SEL_BITS];
    wire [29-DBUS_MEM_SLAVE_SEL_BITS:0]w_DBUS_MEM_RegSelAddr = w_DBus_Address[29-DBUS_MEM_SLAVE_SEL_BITS:0];

    //DROM0
    parameter w_DROM0_SlaveAddr = {DBUS_TOP_MEM, DBUS_MEM_DROM};
    wire w_DROM0_Sel = (w_DBUS_MEM_SlaveSelAddr == w_DROM0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_DROM0_ReadData;
    wire w_AV_DROM0_WaitRequest;

    //---IO Block---//
    parameter DBUS_IO_SEL_BITS  = 17;
    parameter DBUS_IO_SLAVE_SEL_BITS = (DBUS_TOP_SEL_BITS + DBUS_IO_SEL_BITS);
    parameter DBUS_IO_UART0     = 17'd0;
    parameter DBUS_IO_COUNTER0  = 17'd1;
    parameter DBUS_IO_ADV7123   = 17'd2;

    wire [DBUS_IO_SLAVE_SEL_BITS-1:0]w_DBUS_IO_SlaveSelAddr = w_DBus_Address[29:30-DBUS_IO_SLAVE_SEL_BITS];
    wire [29-DBUS_IO_SLAVE_SEL_BITS:0]w_DBUS_IO_RegSelAddr = w_DBus_Address[29-DBUS_IO_SLAVE_SEL_BITS:0];

    //UART0
    parameter w_UART0_SlaveAddr = {DBUS_TOP_IO, DBUS_IO_UART0};
    wire w_UART0_Sel = (w_DBUS_IO_SlaveSelAddr == w_UART0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_UART0_ReadData;
    wire w_AV_UART0_WaitRequest;

    //Counter0
    parameter w_Counter0_SlaveAddr = {DBUS_TOP_IO, DBUS_IO_COUNTER0};
    wire w_Counter0_Sel = (w_DBUS_IO_SlaveSelAddr == w_Counter0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_Counter0_ReadData;
    wire w_AV_Counter0_WaitRequest;

    //ADV7123
    parameter w_ADV7123_SlaveAddr = {DBUS_TOP_IO, DBUS_IO_ADV7123};
    wire w_ADV7123_Sel = (w_DBUS_IO_SlaveSelAddr == w_ADV7123_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_ADV7123_ReadData;
    wire w_AV_ADV7123_WaitRequest;

    //DBus Slave 
    assign w_DBus_ReadData = w_AV_DROM0_ReadData | w_AV_UART0_ReadData | w_AV_Counter0_ReadData | w_AV_ADV7123_ReadData;
    assign w_DBus_WaitRequest = w_AV_DROM0_WaitRequest | w_AV_UART0_WaitRequest | w_AV_Counter0_WaitRequest | w_AV_ADV7123_WaitRequest;

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
        .o_VidClk25M(w_VidClk)
    );

    CPU CPU0 (
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

    //IROM
    IRAM #(
        .ADDR_SEL_BITS(IBUS_TOP_SEL_BITS),
        .ADDR_BLOCK(IBUS_TOP_ROM),
        .DEPTH(64)
    )IRAM0(
        .i_Clk(w_SysClk),

        .i_IBus_Address(w_IBus_Address),
        .i_IBus_Read(w_IBus_Read),
        .o_IBus_ReadData(w_IBus_ReadData),
        .o_IBus_WaitRequest(w_IBus_WaitRequest)
    );

    DRAM #(
        .ADDR_SEL_BITS(DBUS_MEM_SLAVE_SEL_BITS),
        .DEPTH(64)
    )DRAM0(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_DROM0_Sel),
        .i_RegAddr(w_DBUS_MEM_RegSelAddr),

        .i_AV_Address(w_DBus_Address),
        .i_AV_Read(w_DBus_Read),
        .o_AV_ReadData(w_AV_DROM0_ReadData),
        .o_AV_WaitRequest(w_AV_DROM0_WaitRequest)
    );

    UART #(
        .ADDR_SEL_BITS(DBUS_IO_SLAVE_SEL_BITS)
    )UART0(
        .i_Clk(w_SysClk),
        
        //DBus Slave
        .i_SlaveSel(w_UART0_Sel),
        .i_RegAddr(w_DBUS_IO_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_UART0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_UART0_WaitRequest),

        .o_UART_TX(io_IO)
    );
    
    Counter #(
        .ADDR_SEL_BITS(DBUS_IO_SLAVE_SEL_BITS)
    )Counter0(
        .i_Clk(w_SysClk),
        
        //DBus Slave
        .i_SlaveSel(w_Counter0_Sel),
        .i_RegAddr(w_DBUS_IO_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_Counter0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_Counter0_WaitRequest)
    );

    ADV7123_BusInterface #(
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

        //DBus Addressing
        .ADDR_SEL_BITS(DBUS_IO_SLAVE_SEL_BITS)
    )ADV7123_BusInterface0(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_ADV7123_Sel),
        .i_RegAddr(w_DBUS_IO_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_ADV7123_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_ADV7123_WaitRequest),

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

endmodule