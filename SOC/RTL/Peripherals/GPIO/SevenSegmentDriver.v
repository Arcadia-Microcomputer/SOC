`timescale 1ns / 1ps

module SevenSegmentDriver(
        input i_Clk,
        input i_HexLutEn,

        input [6:0]i_SegOne,
        input [6:0]i_SegTwo,
        input [6:0]i_SegThree,

        output reg [2:0]o_7Seg_En,
        output reg [6:0]o_7Seg_Led
    );

    initial begin
        o_7Seg_En <= 0;
        o_7Seg_Led <= 0;
    end
    
    wire [6:0]w_HexLut[15:0] = {
        7'b1110001, //F
        7'b1111001, //E
        7'b0111111, //D
        7'b0111001, //C
        7'b1111111, //B
        7'b1110111, //A
        7'b1100111, //9
        7'b1111111, //8
        7'b0000111, //7
        7'b1111101, //6
        7'b1101101, //5
        7'b1100110, //4
        7'b1001111, //3
        7'b1011011, //2
        7'b0000110, //1
        7'b0111111  //0
    };

    wire [6:0]w_SegOne    = i_HexLutEn? w_HexLut[i_SegOne[3:0]]   : i_SegOne;
    wire [6:0]w_SegTwo    = i_HexLutEn? w_HexLut[i_SegTwo[3:0]]   : i_SegTwo;
    wire [6:0]w_SegThree  = i_HexLutEn? w_HexLut[i_SegThree[3:0]] : i_SegThree;

    reg [2:0]r_7SegSelCounter = 0;

    always @(posedge i_Clk) begin
        if(r_7SegSelCounter == 2)begin
            r_7SegSelCounter <= 0;
        end else begin
            r_7SegSelCounter <= r_7SegSelCounter + 1;
        end
        
        case (r_7SegSelCounter)
            0:begin
                o_7Seg_En <= 3'b001;
                o_7Seg_Led <= w_SegOne;
            end
            1:begin
                o_7Seg_En <= 3'b010;
                o_7Seg_Led <= w_SegTwo;
            end
            2:begin
                o_7Seg_En <= 3'b100;
                o_7Seg_Led <= w_SegThree;
            end
        endcase
    end


endmodule
