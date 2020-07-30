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
    wire w_OverFlow;
    wire w_UnderFlow;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end
    
    integer i;
    initial begin
        @(posedge r_Clk);
        for(i = 0; i < 4; i = i + 1)begin
            @(posedge r_Clk);
            r_WrEn <= 1;
            r_WrData <= {4'hA, i[3:0]};
        end
        @(posedge r_Clk);
        r_WrEn <= 0;

        for(i = 0; i < 4; i = i + 1)begin
            @(posedge r_Clk);
            r_RdEn <= 1;
        end

        @(posedge r_Clk);
        r_RdEn <= 0;
    end

    FIFO #(
        .WIDTH(8),
        .DEPTH(4)
    )DUT(
        .i_Clk(r_Clk),

        .i_WrEn(r_WrEn),
        .i_WrData(r_WrData),

        .i_RdEn(r_RdEn),
        .o_RdData(r_RdData),

        .o_Full(w_Full),
        .o_Empty(w_Empty),
        .o_OverFlow(w_OverFlow),
        .o_UnderFlow(w_UnderFlow)
    );

endmodule
