`timescale 1ns / 1ps

module FIFO#(
        parameter WIDTH = 8,
        parameter DEPTH = 2
    )(
        input i_Clk,
        
        input i_WrEn,
        input [WIDTH-1:0]i_WrData,

        input i_RdEn,
        output reg [WIDTH-1:0]o_RdData,

        output o_Full,
        output o_Empty,
        output reg o_OverFlow,
        output reg o_UnderFlow
    );
    //Fifo ram
    reg [WIDTH-1:0]r_RAM[DEPTH-1:0];

    //Write and read pointer
    reg [$clog2(DEPTH)-1:0]r_WrPointer = 0;
    reg [$clog2(DEPTH)-1:0]r_RdPointer = 0;

    reg [$clog2(DEPTH):0]r_Count = 0;

    assign o_Full = (r_Count == DEPTH)? 1 : 0;
    assign o_Empty = (r_Count == 0)? 1 : 0;

    integer i;
    initial begin
        o_RdData = 0;

        o_OverFlow = 0;
        o_UnderFlow = 0;

        //Initalize the FIFO ram to all zeros
        for(i = 0; i < DEPTH; i = i + 1)begin
            r_RAM[i] = 0;
        end
    end


    always @(posedge i_Clk) begin
        if(i_WrEn)begin
            if(o_Full)begin
                o_OverFlow <= 1;
            end else begin
                o_OverFlow <= 0;
                r_WrPointer <= r_WrPointer + 1;
                r_RAM[r_WrPointer] <= i_WrData;
            end
        end

        if(i_RdEn)begin
            if(o_Empty)begin
                o_UnderFlow <= 1;
            end else begin
                o_UnderFlow <= 0;
                r_RdPointer <= r_RdPointer + 1;
                o_RdData <= r_RAM[r_RdPointer]; 
            end
        end

        casex ({o_Empty, o_Full, i_RdEn, i_WrEn})
            4'bx001: r_Count <= r_Count + 1; //Write
            4'b0x10: r_Count <= r_Count - 1; //Read
            4'b0011: r_Count <= r_Count;     //Write and Read
            4'b1011: r_Count <= r_Count + 1; //Write (Read failed due to empty)
            4'b0111: r_Count <= r_Count - 1; //Read (Write failed due to full)
            default: r_Count <= r_Count;
        endcase
    end
endmodule
