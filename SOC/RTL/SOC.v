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
    parameter ADDR_TOP_SEL_BITS = 4;
    parameter ADDR_TOP_SDRAM    = 4'd0;
    parameter ADDR_TOP_MEM      = 4'd1;
    parameter ADDR_TOP_IO       = 4'd2;
    parameter ADDR_TOP_VRAM     = 4'd3;

    //---MEM Block---//
    parameter ADDR_MEM_SEL_BITS = 4;
    parameter ADDR_MEM_SLAVE_SEL_BITS = (ADDR_TOP_SEL_BITS + ADDR_MEM_SEL_BITS);
    
    parameter ADDR_MEM_ROM      = 4'd0;
    parameter ADDR_MEM_DRAM     = 4'd1;

    wire [ADDR_MEM_SLAVE_SEL_BITS-1:0]w_DBus_MEM_SlaveSelAddr = w_DBus_Address[29:30-ADDR_MEM_SLAVE_SEL_BITS];
    wire [29-ADDR_MEM_SLAVE_SEL_BITS:0]w_DBus_MEM_RegSelAddr = w_DBus_Address[29-ADDR_MEM_SLAVE_SEL_BITS:0];

    wire [ADDR_MEM_SLAVE_SEL_BITS-1:0]w_IBus_MEM_SlaveSelAddr = w_IBus_Address[29:30-ADDR_MEM_SLAVE_SEL_BITS];
    wire [29-ADDR_MEM_SLAVE_SEL_BITS:0]w_IBus_MEM_RegSelAddr = w_IBus_Address[29-ADDR_MEM_SLAVE_SEL_BITS:0];

    //ROM0
    parameter ROM0_SlaveAddr = {ADDR_TOP_MEM, ADDR_MEM_ROM};
    //IBus Port
    wire w_ROM0_I_Sel = (w_IBus_MEM_SlaveSelAddr == ROM0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV0_ROM0_ReadData;
    wire w_AV0_ROM0_WaitRequest;
    //DBus Port
    wire w_ROM0_D_Sel = (w_DBus_MEM_SlaveSelAddr == ROM0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV1_ROM0_ReadData;
    wire w_AV1_ROM0_WaitRequest;

    //DRAM0
    parameter DRAM0_SlaveAddr = {ADDR_TOP_MEM, ADDR_MEM_DRAM};
    wire w_DRAM0_Sel = (w_DBus_MEM_SlaveSelAddr == DRAM0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_DRAM0_ReadData;
    wire w_AV_DRAM0_WaitRequest;

    //---IO Block---//
    parameter ADDR_IO_SEL_BITS  = 17;
    parameter ADDR_IO_SLAVE_SEL_BITS = (ADDR_TOP_SEL_BITS + ADDR_IO_SEL_BITS);
    parameter ADDR_IO_UART0     = 17'd0;
    parameter ADDR_IO_COUNTER0  = 17'd1;

    wire [ADDR_IO_SLAVE_SEL_BITS-1:0]w_DBus_IO_SlaveSelAddr = w_DBus_Address[29:30-ADDR_IO_SLAVE_SEL_BITS];
    wire [29-ADDR_IO_SLAVE_SEL_BITS:0]w_DBus_IO_RegSelAddr  = w_DBus_Address[29-ADDR_IO_SLAVE_SEL_BITS:0];

    //UART0
    parameter UART0_SlaveAddr = {ADDR_TOP_IO, ADDR_IO_UART0};
    wire w_UART0_Sel = (w_DBus_IO_SlaveSelAddr == UART0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_UART0_ReadData;
    wire w_AV_UART0_WaitRequest;

    //Counter0
    parameter Counter0_SlaveAddr = {ADDR_TOP_IO, ADDR_IO_COUNTER0};
    wire w_Counter0_Sel = (w_DBus_IO_SlaveSelAddr == Counter0_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_Counter0_ReadData;
    wire w_AV_Counter0_WaitRequest;

    //---VRAM Block---//
    parameter ADDR_VRAM_SEL_BITS  = 2;
    parameter ADDR_VRAM_SLAVE_SEL_BITS = (ADDR_TOP_SEL_BITS + ADDR_VRAM_SEL_BITS);
    parameter ADDR_VRAM_VID     = 2'd0;

    wire [ADDR_VRAM_SLAVE_SEL_BITS-1:0]w_DBus_VRAM_SlaveSelAddr = w_DBus_Address[29:30-ADDR_VRAM_SLAVE_SEL_BITS];
    wire [29-ADDR_VRAM_SLAVE_SEL_BITS:0]w_DBus_VRAM_RegSelAddr  = w_DBus_Address[29-ADDR_VRAM_SLAVE_SEL_BITS:0];

    //Video Driver
    parameter VideoDriver_SlaveAddr = {ADDR_TOP_VRAM, ADDR_VRAM_VID};
    wire w_VideoDriver_Sel = (w_DBus_VRAM_SlaveSelAddr == VideoDriver_SlaveAddr)? 1: 0;
    wire [31:0]w_AV_VideoDriver_ReadData;
    wire w_AV_VideoDriver_WaitRequest;

    //--IBus Slave Driver--//
    assign w_IBus_ReadData = w_AV0_ROM0_ReadData;
    assign w_IBus_WaitRequest = w_AV0_ROM0_WaitRequest;

    //--DBus Slave Driver--//
    assign w_DBus_ReadData = w_AV1_ROM0_ReadData | w_AV_DRAM0_ReadData | w_AV_UART0_ReadData | w_AV_Counter0_ReadData | w_AV_VideoDriver_ReadData;
    assign w_DBus_WaitRequest = w_AV1_ROM0_WaitRequest | w_AV_DRAM0_WaitRequest | w_AV_UART0_WaitRequest | w_AV_Counter0_WaitRequest | w_AV_VideoDriver_WaitRequest;

    //--PLL_M Signals--//
    wire w_SysClk;
    wire w_VidClk;

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

    CPU #(
        //Starts executing from ROM
        .INITIAL_PC_VALUE(32'h10000000)
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

    ROM #(
        .ADDR_SEL_BITS(ADDR_MEM_SLAVE_SEL_BITS),
        .DEPTH(512)
    )ROM0(
        .i_Clk(w_SysClk),

        //IBus Slave
        .i_AV0_SlaveSel(w_ROM0_I_Sel),
        .i_AV0_RegAddr(w_IBus_MEM_RegSelAddr),
        .i_AV0_Read(w_IBus_Read),
        .o_AV0_ReadData(w_AV0_ROM0_ReadData),
        .o_AV0_WaitRequest(w_AV0_ROM0_WaitRequest),

        //DBus Slave
        .i_AV1_SlaveSel(w_ROM0_D_Sel),
        .i_AV1_RegAddr(w_DBus_MEM_RegSelAddr),
        .i_AV1_Read(w_DBus_Read),
        .o_AV1_ReadData(w_AV1_ROM0_ReadData),
        .o_AV1_WaitRequest(w_AV1_ROM0_WaitRequest)
    );

    RAM #(
        .ADDR_SEL_BITS(ADDR_MEM_SLAVE_SEL_BITS),
        .DEPTH(512)
    )RAM0(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_DRAM0_Sel),
        .i_RegAddr(w_DBus_MEM_RegSelAddr),
        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_DRAM0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_DRAM0_WaitRequest)
    );

    UART #(
        .ADDR_SEL_BITS(ADDR_IO_SLAVE_SEL_BITS)
    )UART0(
        .i_Clk(w_SysClk),
        
        //DBus Slave
        .i_SlaveSel(w_UART0_Sel),
        .i_RegAddr(w_DBus_IO_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_UART0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_UART0_WaitRequest),

        .o_UART_TX(io_IO)
    );
    
    Counter #(
        .ADDR_SEL_BITS(ADDR_IO_SLAVE_SEL_BITS)
    )Counter0(
        .i_Clk(w_SysClk),
        
        //DBus Slave
        .i_SlaveSel(w_Counter0_Sel),
        .i_RegAddr(w_DBus_IO_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_Counter0_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_Counter0_WaitRequest)
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

        //DBus Addressing
        .ADDR_SEL_BITS(ADDR_VRAM_SLAVE_SEL_BITS)
    )VideoDriver(
        .i_Clk(w_SysClk),

        //DBus Slave
        .i_SlaveSel(w_VideoDriver_Sel),
        .i_RegAddr(w_DBus_VRAM_RegSelAddr),

        .i_AV_ByteEn(w_DBus_ByteEn),
        .i_AV_Read(w_DBus_Read),
        .i_AV_Write(w_DBus_Write),
        .o_AV_ReadData(w_AV_VideoDriver_ReadData),
        .i_AV_WriteData(w_DBus_WriteData),
        .o_AV_WaitRequest(w_AV_VideoDriver_WaitRequest),

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