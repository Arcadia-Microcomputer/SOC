`timescale 1ns / 1ps

module MasterDecoder#(
    parameter NUM_SLAVES = 2,
    parameter SEL_NUM_BITS = {5'd1, 5'd1},
    parameter SEL_VAL = {30'd1, 30'd0}
    )(
    input i_Clk,

    output reg [NUM_SLAVES-1:0] o_Req,
    output reg [NUM_SLAVES-1:0] o_Lock,
    input [NUM_SLAVES-1:0] i_Gnt,

    input [29:0] i_AVIn_Addr,
    input i_AVIn_Read,
    input i_AVIn_Write,
    input o_AVIn_WaitRequest
    );

    initial begin
        o_Req = 0;
        o_Lock = 0;
    end

    // Address decoding and arbiter req generation
    genvar i;
    for (i = 0; i < NUM_SLAVES; i = i + 1) begin : addressDecode
        wire slaveSel = i_AVIn_Addr[29:30 - SEL_NUM_BITS[5*i +:5]] == SEL_VAL[30*i +:30]? 1 : 0;

        always @(*) begin
            o_Req[i] <= 0;
            o_Lock[i] <= 0;

            if((i_AVIn_Read || i_AVIn_Write) && slaveSel)begin
                o_Req[i] <= 1;

                // Once arbitration is won, make sure to keep it till transaction is complete
                if(i_Gnt[i])begin
                    o_Lock[i] <= 1;
                end
            end
        end
    end

endmodule