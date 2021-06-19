`timescale 1ns / 1ps

module BusArbiter#(
    parameter NUM_INPUTS = 2,
    parameter SEL_NUM_BITS = {5'd5, 5'd5},
    parameter SEL_VAL = {30'd1, 30'd0}
    )(
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
    
    genvar i;
    for (i = 0; i < NUM_INPUTS; i = i + 1) begin : addressDecode
        wire [29:0]w_SelAddr = i_AVIn_Addr[30*i +: 30];
        always @(*) begin
            r_Req[i] <= 0;

            if(i_AVIn_Read[i] || i_AVIn_Write[i])begin
                if(w_SelAddr[29:30 - SEL_NUM_BITS[5*i +: 5]] == SEL_VAL[30*i +: 30])begin
                    r_Req[i] <= 1;
                end   
            end
        end
    end


endmodule