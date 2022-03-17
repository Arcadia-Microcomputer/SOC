`timescale 1ns / 1ps

module ForwardingUnit(
    input [4:0]i_RS1Addr_D,
    input [4:0]i_RS2Addr_D,
    input [4:0]i_RS1Addr_E,
    input [4:0]i_RS2Addr_E,
    input [4:0]i_RS1Addr_M,
    input [4:0]i_RS2Addr_M,
    input [4:0]i_RDAddr_M,
    input i_RegWrEn_M,
    
    output reg o_RS1ForSel_D,
    output reg o_RS2ForSel_D,
    output reg o_RS1ForSel_E,
    output reg o_RS2ForSel_E,
    output reg o_RS1ForSel_M,
    output reg o_RS2ForSel_M
    );
    
    parameter p_SRC_REG = 2'd0;
    parameter p_SRC_WB = 2'd1;

    always @(*) begin
        //RS1 D Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS1Addr_D) && i_RegWrEn_M)begin
            o_RS1ForSel_D <= p_SRC_WB;
        end else begin
            o_RS1ForSel_D <= p_SRC_REG;
        end

        //RS2 D Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS2Addr_D) && i_RegWrEn_M)begin
            o_RS2ForSel_D <= p_SRC_WB;
        end else begin
            o_RS2ForSel_D <= p_SRC_REG;
        end

        //RS1 E Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS1Addr_E) && i_RegWrEn_M)begin
            o_RS1ForSel_E <= p_SRC_WB;
        end else begin
            o_RS1ForSel_E <= p_SRC_REG;
        end

        //RS2 E Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS2Addr_E) && i_RegWrEn_M)begin
            o_RS2ForSel_E <= p_SRC_WB;
        end else begin
            o_RS2ForSel_E <= p_SRC_REG;
        end

        //RS1 M Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS1Addr_M) && i_RegWrEn_M)begin
            o_RS1ForSel_M <= p_SRC_WB;
        end else begin
            o_RS1ForSel_M <= p_SRC_REG;
        end

        //RS2 M Forwading
        if((i_RDAddr_M != 0) && (i_RDAddr_M == i_RS2Addr_M) && i_RegWrEn_M)begin
            o_RS2ForSel_M <= p_SRC_WB;
        end else begin
            o_RS2ForSel_M <= p_SRC_REG;
        end
    end

endmodule
