`timescale 1ns / 1ps

module OutputArbiter_tb();
    reg r_Clk = 0;

    reg [4:0]r_In_Req = 0;
    reg [4:0]r_In_NewTransaction = 0;
    wire [2:0]w_MuxSel;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        @(posedge r_Clk);
        r_In_Req[0] = 1;
        r_In_Req[1] = 1;
        r_In_NewTransaction[0] = 1;
        r_In_NewTransaction[1] = 1;
        @(posedge r_Clk);
        r_In_NewTransaction[0] = 0;
        r_In_NewTransaction[1] = 0;
        @(posedge r_Clk);
        r_In_Req[0] = 0;
        r_In_Req[2] = 1;
        @(posedge r_Clk);
        @(posedge r_Clk);
        r_In_Req[1] = 0;
        @(posedge r_Clk);
        r_In_Req[2] = 0;
    end
    
    OutputArbiter DUT(
        .i_Clk(r_Clk),

        .i_In_Req(r_In_Req),
        .i_In_NewTransaction(r_In_NewTransaction),
        .o_MuxSel(w_MuxSel)
    );
endmodule