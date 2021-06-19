`timescale 1ns / 1ps

module BusArbiter_tb();
    reg r_Clk = 0;

    //Avalon Master Bus 0 signals
    reg [29:0]r_AV_M0_Addr = 0;
    reg r_AV_M0_Read = 0;
    reg r_AV_M0_Write = 0;

    //Avalon Master Bus 1 signals
    reg [29:0]r_AV_M1_Addr = 00;
    reg r_AV_M1_Read = 0;
    reg r_AV_M1_Write = 0;

    wire [1:0]w_MuxSel;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        @(posedge r_Clk);
        r_AV_M0_Read <= 1;
        r_AV_M1_Read <= 0;

        @(posedge r_Clk);
        r_AV_M0_Read <= 0;
        r_AV_M1_Read <= 1;

        @(posedge r_Clk);
        r_AV_M0_Read <= 0;
        r_AV_M1_Read <= 0;
    end

    BusArbiter#(
        .NUM_INPUTS(2),
        .SEL_NUM_BITS(1),
        .SEL_VAL(0)
    )BusArbiter0(
        .i_Clk(r_Clk),
        .o_MuxSel(w_MuxSel),

        .i_AVIn_Addr({r_AV_M1_Addr, r_AV_M0_Addr}),
        .i_AVIn_Read({r_AV_M1_Read, r_AV_M0_Read}),
        .i_AVIn_Write({r_AV_M1_Write, r_AV_M0_Write})
    );

endmodule