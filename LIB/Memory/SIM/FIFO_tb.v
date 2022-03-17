`timescale 1ns / 1ps

module FIFO_tb();
    reg r_Clk = 0;
    
    //FIFO Signals
    reg r_WrEn = 0;
    reg [7:0]r_WrData = 0;
    reg r_RdEn = 0;
    wire [7:0]r_RdData;
    wire w_Full;
    wire w_Empty;
    wire w_ProgFull;
    wire w_ProgEmpty;
    wire w_OverFlow;
    wire w_UnderFlow;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end
    
    integer i = 0;
    initial begin
        @(posedge r_Clk);
        for(i = 0; i < 6; i = i + 1)begin
            r_WrEn <= 1;
            r_WrData <= i[7:0];
            @(posedge r_Clk); 
        end
        
        @(posedge r_Clk);
        r_WrEn <= 0;

        while(!w_ProgEmpty)begin
            @(posedge r_Clk); 
            r_RdEn <= 1;
        end
        r_RdEn <= 0;
    end

    FIFO #(
        .FWFT("TRUE"),
        .PROG_FULL_TRESHOLD(6),
        .PROG_EMPTY_TRESHOLD(2),
        .WIDTH(8),
        .DEPTH(8)
    )DUT(
        .i_Clk(r_Clk),

        .i_WrEn(r_WrEn),
        .i_WrData(r_WrData),

        .i_RdEn(r_RdEn),
        .o_RdData(r_RdData),

        .o_Full(w_Full),
        .o_Empty(w_Empty),
        .o_ProgFull(w_ProgFull),
        .o_ProgEmpty(w_ProgEmpty),
        .o_OverFlow(w_OverFlow),
        .o_UnderFlow(w_UnderFlow)
    );

endmodule
