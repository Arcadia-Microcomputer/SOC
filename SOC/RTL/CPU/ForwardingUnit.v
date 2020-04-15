`timescale 1ns / 1ps

module ForwardingUnit(
    input [4:0]i_RS1Addr_E,
    input [4:0]i_RS2Addr_E,
    input [4:0]i_RS2Addr_M,
    input [4:0]i_RDAddr_M,
    input [4:0]i_RDAddr_W,
    input i_RegWrEn_M,
    input i_RegWrEn_W,
    
    output reg [1:0] o_AluForA,
    output reg [1:0] o_AluForB,

    output reg o_DBusForA,
    output reg o_DBusForB
    );
    
    parameter p_SRC_REG = 2'd0;
    parameter p_SRC_MEM = 2'd1;
    parameter p_SRC_WB  = 2'd2;

    always @(*) begin
        //ALU Src A Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS1Addr_E) && i_RegWrEn_M)begin
            o_AluForA <= p_SRC_MEM;
        end else if ((i_RDAddr_W != 0) && (i_RDAddr_W == i_RS1Addr_E) && i_RegWrEn_W)begin
            o_AluForA <= p_SRC_WB;
        end else begin
            o_AluForA <= p_SRC_REG;
        end

        //ALU Src B Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS2Addr_E) && i_RegWrEn_M)begin
            o_AluForB <= p_SRC_MEM;
        end else if ((i_RDAddr_W != 0) && (i_RDAddr_W == i_RS2Addr_E) && i_RegWrEn_W)begin
            o_AluForB <= p_SRC_WB;
        end else begin
            o_AluForB <= p_SRC_REG;
        end

        //DBus Execute Stage WrData Forwarding
        if((i_RDAddr_W != 0) && (i_RDAddr_W == i_RS2Addr_E) && i_RegWrEn_W)begin
            o_DBusForA <= 1'b1;
        end else begin
            o_DBusForA <= 1'b0;
        end

        //DBus Mem Stage WrData Forwarding
        if((i_RDAddr_W != 0) && (i_RDAddr_W == i_RS2Addr_M) && i_RegWrEn_W)begin
            o_DBusForB <= 1'b1;
        end else begin
            o_DBusForB <= 1'b0;
        end
    end

endmodule
