`timescale 1ns / 1ps

module BusArbiter#(
    parameter NUM_INPUTS = 2,
    parameter SEL_NUM_BITS = 5,
    parameter SEL_VAL = 0
    )(
    input i_Clk,
    
    output reg [$clog2(NUM_INPUTS+1)-1:0]o_MuxSel,

    // Inputs from master
    input [(30*(NUM_INPUTS))-1:0]i_AVIn_Addr,
    input [(1*(NUM_INPUTS)-1):0]i_AVIn_Read,
    input [(1*(NUM_INPUTS))-1:0]i_AVIn_Write
    );

    initial begin
      o_MuxSel <= 0;  
    end

    reg [NUM_INPUTS-1:0] r_Req = 0;

    // Address decoding and arbiter req generation
    genvar i;
    for (i = 0; i < NUM_INPUTS; i = i + 1) begin : addressDecode
        wire [29:0]w_SelAddr = i_AVIn_Addr[30*i +: 30];

        always @(*) begin
            r_Req[i] <= 0;

            if(i_AVIn_Read[i] || i_AVIn_Write[i])begin
                if(w_SelAddr[29:30 - SEL_NUM_BITS] == SEL_VAL)begin
                    r_Req[i] <= 1;
                end   
            end
        end
    end

    // Arbitration (MUST BE SELF IMPLEMENTED BASED ON NUMBER OF INPUTS)
    always @(posedge i_Clk) begin
        o_MuxSel <= 0;

        if(r_Req[0])begin
            o_MuxSel <= 1;
        end else if(r_Req[1])begin
            o_MuxSel <= 2;
        end
    end

endmodule