`timescale 1ns / 1ps

module Power2Div#(
        parameter POWER_OF_2_DIV = 2
    )(
        input i_Clk,
        output o_DivClk
    );
    reg [$clog2(POWER_OF_2_DIV)-1:0]r_Counter = 0;

    //Output clock the msb of the counter
    assign o_DivClk = r_Counter[$clog2(POWER_OF_2_DIV)-1];

    always @(posedge i_Clk) begin
        r_Counter <= r_Counter + 1;
    end

endmodule
