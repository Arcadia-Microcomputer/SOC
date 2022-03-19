`timescale 1ns / 1ps

module SOCTest_tb();
    reg r_Clk = 0;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

  SOCTest SOCTest0 (
    .i_Clk(r_Clk)
  );
  
endmodule
