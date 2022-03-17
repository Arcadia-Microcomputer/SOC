`timescale 1ns / 1ps

module SlaveArbiter_tb();
    reg r_Clk = 0;

    // Master 0
    reg r_M0_Req = 0;
    reg r_M0_Lock = 0;
    wire w_M0_Gnt;

    // Master 1
    reg r_M1_Req = 0;
    reg r_M1_Lock = 0;
    wire w_M1_Gnt;
    
    wire [1:0] w_MuxSel;
    
    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    // Master 0
    initial begin
       @(posedge r_Clk);
       r_M0_Req <= 1;
       @(posedge w_M0_Gnt);
       r_M0_Lock = 1;
       #60;
       @(posedge r_Clk);
       r_M0_Req <= 0;
       r_M0_Lock = 0;
    end
    
    // Master 1
    initial begin
       @(posedge r_Clk);
       r_M1_Req <= 1;
       @(posedge w_M1_Gnt);
       r_M1_Lock = 1;
       #40;
       @(posedge r_Clk);
       r_M1_Req <= 0;
       r_M1_Lock = 0;
    end

    SlaveArbiter #(
        .NUM_MASTERS(2)
    )SlaveArbiter0(
        .i_Clk(r_Clk),

        .i_Req({r_M1_Req, r_M0_Req}),
        .i_Lock({r_M1_Lock, r_M0_Lock}),

        .o_Gnt({w_M1_Gnt, w_M0_Gnt}),
        .o_MuxSel(w_MuxSel)
    );

endmodule