`timescale 1ns / 1ps

`define NUM_INPUTS 5
`define NUM_OUTPUTS 4

module OutputArbiter(
    input i_Clk,

    input [`NUM_INPUTS-1:0]i_In_Req,
    input [`NUM_INPUTS-1:0]i_In_NewTransaction,
    output reg [$clog2(`NUM_OUTPUTS+1)-1:0]o_MuxSel
    );
    initial begin
        o_MuxSel <= `NUM_OUTPUTS;
    end

    reg [$clog2(`NUM_INPUTS)-1:0]r_Old_MuxSel = `NUM_OUTPUTS;

    always@(*)begin
        if(i_In_Req[r_Old_MuxSel] && !i_In_NewTransaction[r_Old_MuxSel])begin
            //Check for a continuing transaction
            o_MuxSel <= r_Old_MuxSel;
        end else if(i_In_Req[0])begin
            o_MuxSel <= 0;
        end else if(i_In_Req[1])begin
            o_MuxSel <= 1;
        end else if(i_In_Req[2])begin
            o_MuxSel <= 2;
        end else if(i_In_Req[3])begin
            o_MuxSel <= 3;
        end else begin
            //Select the no master input
            o_MuxSel <= `NUM_OUTPUTS;
        end
    end
    
    always @(posedge i_Clk)begin
        r_Old_MuxSel <= o_MuxSel;
    end
endmodule


