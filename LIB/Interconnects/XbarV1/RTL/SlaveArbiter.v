`timescale 1ns / 1ps

module SlaveArbiter#(
    parameter NUM_MASTERS = 2
    )(
    input i_Clk,

    // Arbiter inputs    
    input [NUM_MASTERS-1:0] i_Req,
    input [NUM_MASTERS-1:0] i_Lock,

    // Arbiter outputs
    output reg [NUM_MASTERS-1:0] o_Gnt,
    output reg [$clog2(NUM_MASTERS+1)-1:0] o_MuxSel
    );

    initial begin
      o_Gnt <= 0;
      o_MuxSel <= 0;  
    end
    
    reg [NUM_MASTERS-1:0] r_Old_Gnt = 0;
    reg [$clog2(NUM_MASTERS+1)-1:0] r_Old_MuxSel = 0;

    // Arbitration (MUST BE SELF IMPLEMENTED BASED ON NUMBER OF INPUTS)
    always @(*) begin
        o_MuxSel <= 0;
        o_Gnt <= 0;
        
        // Check if previously granted master wants to keep control
        if((r_Old_MuxSel != 0) && (i_Lock & r_Old_Gnt))begin
            o_MuxSel <= r_Old_MuxSel;
            o_Gnt <= r_Old_Gnt;
        end else begin
            if(i_Req[1])begin
                o_MuxSel <= 2;
                o_Gnt[1] <= 1;
            end else if(i_Req[0])begin
                o_MuxSel <= 1;
                o_Gnt[0] <= 1;
            end
        end
    end

    always @(posedge i_Clk) begin
        r_Old_MuxSel <= o_MuxSel;
        r_Old_Gnt <= o_Gnt;
    end

endmodule