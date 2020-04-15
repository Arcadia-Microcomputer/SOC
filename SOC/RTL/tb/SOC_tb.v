`timescale 1ns / 1ps

module SOC_tb();
    reg r_Clk = 0;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    SOC SOC0(
        .i_Clk(r_Clk)
    );
endmodule
