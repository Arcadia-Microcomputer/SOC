`timescale 1ns / 1ps

module VideoDriver#(
    //horizontal timing (Line)
    parameter HorSyncTime = 96,
    parameter HorBackPorch = 48,
    parameter HorFrontPorch = 16,
    parameter HorAddrVideoTime = 640,
    parameter HorEndCnt = 800,
    //vertical timing (Frame)
    parameter VertSyncTime = 2,
    parameter VertBackPorch = 32,
    parameter VertFrontPorch = 10,
    parameter VertAddrVideoTime = 480,
    parameter VertEndCnt = 525,

    //DBus Addressing
    parameter ADDR_SEL_BITS = 0
    )(
    input i_Clk,

    //Avalon RW slave
    input i_AV_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV_RegAddr,
    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    input i_AV_Write,
    output reg [31:0]o_AV_ReadData,
    input [31:0]i_AV_WriteData,
    output o_AV_WaitRequest,

    //--Video--//
	input i_VidClk,

    //ADV7123 Signals
    output o_Pixel_Clk,
    output o_VSync,
    output o_HSync,
    output o_nBlank,
    output [4:0]o_R,
    output [5:0]o_G,
    output [4:0]o_B
    );

    //--DBus Signals--//
    initial begin
        o_AV_ReadData <= 0;
    end
    assign o_AV_WaitRequest = 0;

    reg r_VRAM_WE = 0;
    reg [3:0]r_VRAM_ByteEn = 0;
    reg [12:0] r_VRAM_WriteAddr = 0;
    reg [31:0]r_VRAM_WData = 0;

    wire [14:0]w_VRAM_VidAddr = w_NextHPos[$clog2(HorEndCnt) - 1:3] + (w_NextVPos[$clog2(VertEndCnt) - 1:3] * (HorAddrVideoTime/8));
    wire [7:0] w_VRAM_Colour;

    //--ADV7123 Driver Signals--//
    wire [15:0] w_ADV7123_Colour = {w_VRAM_Colour[7:5],2'b0, w_VRAM_Colour[4:2], 3'b0, w_VRAM_Colour[1:0], 3'b0};
    wire w_inActiveArea;
    wire [$clog2(HorEndCnt) - 1:0] w_NextHPos;
    wire [$clog2(VertEndCnt) - 1:0] w_NextVPos;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        r_VRAM_WE <= 0;

        if (i_AV_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                if(i_AV_RegAddr < 8100)begin
                    r_VRAM_WE <= 1;
                    r_VRAM_ByteEn <= i_AV_ByteEn;
                    r_VRAM_WriteAddr <= i_AV_RegAddr[14:0];
                    r_VRAM_WData <= i_AV_WriteData;
                end
            end
            
            //Read transaction
            // if(i_AV_Read)begin
            //     case (i_AV_RegAddr)
            //         :begin
            //         end
            //         default:begin
            //             o_AV_ReadData <= 0;
            //         end
            //     endcase
            // end
        end
    end

    VRAM VRAM0 (
        .clka(i_Clk),
        .ena(r_VRAM_WE),
        .wea(r_VRAM_ByteEn),
        .addra(r_VRAM_WriteAddr),
        .dina(r_VRAM_WData),

        .clkb(i_VidClk),
        .enb(w_inActiveArea),
        .addrb(w_VRAM_VidAddr),
        .doutb(w_VRAM_Colour)
    );

    ADV7123_Driver #(
		.HorSyncTime(HorSyncTime),
		.HorBackPorch(HorBackPorch),
		.HorFrontPorch(HorFrontPorch),
		.HorAddrVideoTime(HorAddrVideoTime),
		.HorEndCnt(HorEndCnt),

		.VertSyncTime(VertSyncTime),
		.VertBackPorch(VertBackPorch),
		.VertFrontPorch(VertFrontPorch),
		.VertAddrVideoTime(VertAddrVideoTime),
		.VertEndCnt(VertEndCnt)
	)ADV7123_Driver0(
		.i_VidClk(i_VidClk),

        .o_inVBlank(w_inVBlank),
        .o_inActiveArea(w_inActiveArea),
        .o_NextHPos(w_NextHPos),
        .o_NextVPos(w_NextVPos),
		.i_Colour(w_ADV7123_Colour),

		//ADV7123 Signals
		.o_Pixel_Clk(o_Pixel_Clk),
		.o_VSync(o_VSync),
		.o_HSync(o_HSync),
		.o_nBlank(o_nBlank),
		.o_R(o_R),
		.o_G(o_G),
		.o_B(o_B)
	);

endmodule
