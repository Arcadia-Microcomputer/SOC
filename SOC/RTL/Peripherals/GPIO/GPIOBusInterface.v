`timescale 1ns / 1ps

module GPIOBusInterface #(
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
    output reg o_AV_WaitRequest,

    //7 Segment Display
	output [2:0]o_7Seg_En,
	output [6:0]o_7Seg_Led
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
    end

    //The various register addresses
    parameter p_REG_ADDR_GPIO_IN  = 0;
    parameter p_REG_ADDR_GPIO_OUT = 1;
    parameter p_REG_ADDR_GPIO_DDR = 2;
    parameter p_REG_ADDR_7SEG     = 3;

    reg [6:0]r_AReg_7SegOne = 0;
    reg [6:0]r_AReg_7SegTwo = 0;
    reg [6:0]r_AReg_7SegThree = 0;
    reg r_AReg_7SegLUTModeEn = 0;

    //7Seg Divider Clk Signals
    wire w_7SegClk;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
        
        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_7SEG:begin
                        if(i_AV_ByteEn[0]) r_AReg_7SegOne        <= i_AV_WriteData[6:0];
                        if(i_AV_ByteEn[1]) r_AReg_7SegTwo        <= i_AV_WriteData[14:8];
                        if(i_AV_ByteEn[2]) r_AReg_7SegThree      <= i_AV_WriteData[22:16];
                        if(i_AV_ByteEn[3]) r_AReg_7SegLUTModeEn  <= i_AV_WriteData[24];
                    end
                endcase 
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_7SEG:begin
                        o_AV_ReadData <= {7'b0, r_AReg_7SegLUTModeEn, r_AReg_7SegThree, r_AReg_7SegTwo, r_AReg_7SegOne};
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase 
            end
        end
    end

    Power2Div #(
        .POWER_OF_TWO_DIV(32768)
    )SegDivClk(
        .i_Clk(i_Clk),
        .o_DivClk(w_7SegClk)
    );

    SevenSegmentDriver SevenSegmentDriver0(
		.i_Clk(w_7SegClk),
		.i_HexLutEn(r_AReg_7SegLUTModeEn),

		.i_SegOne(r_AReg_7SegOne),
		.i_SegTwo(r_AReg_7SegTwo),
		.i_SegThree(r_AReg_7SegThree),

		.o_7Seg_En(o_7Seg_En),
		.o_7Seg_Led(o_7Seg_Led)
	);
endmodule