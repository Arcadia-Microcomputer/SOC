`timescale 1ns / 1ps

module HazardUnit(
    input i_Clk,

    input i_RS1Valid_D,
    input [4:0]i_RS1Addr_D,

    input i_RS2Valid_D,
    input [4:0]i_RS2Addr_D,

    input [4:0]i_RDAddr_E,
    input [4:0]i_RDAddr_M,
    input [4:0]i_RDAddr_W,

    input i_DBusGnt_M,
    input i_DBusWaitReq_W,

    input i_IsMemRead_E,
    input i_IsMemRead_M,
    input i_IsMemRead_W,

    input i_IsJump_M,
    input i_IsBranch_M,
    input i_TakeBranch_M,

    output reg o_PcEn,
    output reg o_IRamRdEn,
    output reg o_IRamOZero,
    output reg o_DBusTranslatorEn,

    output reg o_RegEn_D,
    output reg o_RegEn_E,
    output reg o_RegEn_M,
    output reg o_RegEn_W,

    output reg o_RegClr_D,
    output reg o_RegClr_E,
    output reg o_RegClr_M,
    output reg o_RegClr_W
    );
    
    initial begin
        o_PcEn = 1'b1;
        o_IRamRdEn  = 1'b1;
        o_IRamOZero = 1'b0;
        o_DBusTranslatorEn = 1'b1;

        o_RegEn_D  = 1'b1;
        o_RegEn_E  = 1'b1;
        o_RegEn_M  = 1'b1;
        o_RegEn_W  = 1'b1;

        o_RegClr_D = 1'b0;
        o_RegClr_E = 1'b0;
        o_RegClr_M = 1'b0;
        o_RegClr_W = 1'b0;
    end

    wire w_DBusHaz_DE  = (i_IsMemRead_E && ((i_RS1Valid_D & (i_RS1Addr_D == i_RDAddr_E)) || (i_RS2Valid_D & (i_RS2Addr_D == i_RDAddr_E))));
    wire w_DBusHaz_DM  = (i_IsMemRead_M && ((i_RS1Valid_D & (i_RS1Addr_D == i_RDAddr_M)) || (i_RS2Valid_D & (i_RS2Addr_D == i_RDAddr_M))));
    wire w_DBusHaz_DW  = (i_IsMemRead_W && ((i_RS1Valid_D & (i_RS1Addr_D == i_RDAddr_W)) || (i_RS2Valid_D & (i_RS2Addr_D == i_RDAddr_W))));
    wire w_DBusHazzard = w_DBusHaz_DE || w_DBusHaz_DM || w_DBusHaz_DW;

    reg [1:0]r_StallCounter_d = 2'b0;
    reg [1:0]r_StallCounter_q = 2'b0;

    always @(*) begin
        o_PcEn   <= 1'b1;
        o_IRamRdEn  <= 1'b1;
        o_IRamOZero <= 1'b0;
        o_DBusTranslatorEn <= 1'b1;

        o_RegEn_D  <= 1'b1;
        o_RegEn_E  <= 1'b1;
        o_RegEn_M  <= 1'b1;
        o_RegEn_W  <= 1'b1;

        o_RegClr_D <= 1'b0;
        o_RegClr_E <= 1'b0;
        o_RegClr_M <= 1'b0;
        o_RegClr_W <= 1'b0;

        r_StallCounter_d <= r_StallCounter_q;

        if(i_DBusWaitReq_W && i_DBusGnt_M) begin
            //If there is a load data hazzard due to:
            //  -Slave asserting WaitReq

            o_DBusTranslatorEn <= 1'b0;

            //Stall all the previous stages
            o_PcEn <= 1'b0;
            o_IRamRdEn <= 1'b0;

            o_RegEn_D <= 1'b0;
            o_RegEn_E <= 1'b0;
            o_RegEn_M <= 1'b0;
            o_RegEn_W <= 1'b0;

        end else if ((i_IsBranch_M && i_TakeBranch_M) || i_IsJump_M) begin
            //If there is a branch hazzard
            //Clear out the consecutive instructions executing
            o_RegClr_D <= 1'b1;
            o_RegClr_E <= 1'b1;
            o_RegClr_M <= 1'b1;

            //Stall the pipelined for 2 cycles
            o_IRamOZero <= 1'b0;

            r_StallCounter_d <= 2'd1;
        end else if(w_DBusHazzard)begin
            //If there is a load data dependency hazzard
            o_PcEn <= 1'b0;
            o_IRamRdEn <= 1'b0;

            o_RegEn_D <= 1'b0;
            o_RegClr_E <= 1'b1;
        end

        if (r_StallCounter_q != 0)begin
            o_RegEn_E <= 1'b0;
            o_IRamOZero <= 1'b0;

            if(r_StallCounter_q != 1)begin
               o_RegEn_D <= 1'b0; 
            end
            r_StallCounter_d <= r_StallCounter_q - 1;
        end
    end

    always @(posedge i_Clk ) begin
        r_StallCounter_q <= r_StallCounter_d;
    end
endmodule
