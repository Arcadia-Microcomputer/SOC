`timescale 1ns / 1ps

module ADV7123_BusInterface#(
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
    input i_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_RegAddr,

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


    //The various register addresses
    parameter p_REG_ADDR_COLOUR   = 0;

    //DBus addressable registers
    reg [15:0] r_NewColour = 0;

    //--ADV7123 Driver Signals--//
    wire w_inVBlank;
    reg [15:0] r_NewColour1 = 0;
    reg [15:0] r_Colour = 16'hFFE0;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_COLOUR:begin
                        r_NewColour[7:0]  <= i_AV_ByteEn[0]? i_AV_WriteData[7:0] : r_Colour[7:0];
                        r_NewColour[15:8] <= i_AV_ByteEn[1]? i_AV_WriteData[15:8]: r_Colour[15:8];
                    end
                endcase
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_COLOUR:begin
                        o_AV_ReadData <= {r_Colour, r_NewColour};
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase
            end
        end
    end

    always @(posedge i_VidClk)begin
        if(w_inVBlank)begin
           r_Colour <= r_NewColour; 
        end
    end

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
		.i_Colour(r_Colour),

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
