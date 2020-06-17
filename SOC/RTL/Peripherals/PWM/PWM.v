`timescale 1ns / 1ps

module PWM#(
    parameter WIDTH = 32
    )(
		input i_Clk,
		
        input [WIDTH-1:0] i_Trig,
		output reg o_Out
    );
	
	reg [WIDTH-1:0] r_Counter = 0;

	always @(posedge i_Clk)begin
        if(r_Counter == 0)begin
            o_Out <= 1;
        end else if(r_Counter == i_Trig)begin
			o_Out <= 0;
        end
        
        r_Counter <= r_Counter + 1;
	end

endmodule
