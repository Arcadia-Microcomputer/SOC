`timescale 1ns / 1ps

module DBUS_ARBITER(
        input i_Clk,

        input i_Req0,
        output reg o_Gnt0,

        input i_Req1,
        output reg o_Gnt1
    );

    initial begin
        o_Gnt0 <= 1'b0;
        o_Gnt1 <= 1'b0;
    end

    always @(posedge i_Clk) begin

        //Basic priority arbiter
        if(i_Req0)begin
            o_Gnt0 <= 1'b1;
        end else if(i_Req1)begin
            o_Gnt1 <= 1'b1;
        end
    end

endmodule