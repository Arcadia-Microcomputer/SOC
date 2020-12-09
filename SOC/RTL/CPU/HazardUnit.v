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

    input i_IBusWaitReq_F,
    input i_DBusWaitReq_M,

    input i_IsMemRead_E,
    input i_IsMemRead_M,
    input i_IsMemRead_W,

    input i_IsJump_M,
    input i_IsBranch_M,
    input i_TakeBranch_M,

    output reg o_PcEn,
    output reg o_IBusRdEn,
    output reg o_IBusOZero,
    output reg o_DBusTranslatorEn,

    output reg o_RegEn_IF2,
    output reg o_RegEn_D,
    output reg o_RegEn_E,
    output reg o_RegEn_M,
    output reg o_RegEn_W,

    output reg o_RegClr_IF2,
    output reg o_RegClr_D,
    output reg o_RegClr_E,
    output reg o_RegClr_M,
    output reg o_RegClr_W
    );
    
    initial begin
        o_PcEn = 1;
        o_IBusRdEn  = 1;
        o_IBusOZero = 0;
        o_DBusTranslatorEn = 1;

        o_RegEn_IF2 = 1;
        o_RegEn_D   = 1;
        o_RegEn_E   = 1;
        o_RegEn_M   = 1;
        o_RegEn_W   = 1;

        o_RegClr_IF2 = 0;
        o_RegClr_D   = 0;
        o_RegClr_E   = 0;
        o_RegClr_M   = 0;
        o_RegClr_W   = 0;
    end

    wire w_DBusHaz_DE  = (i_IsMemRead_E && ((i_RS1Valid_D & (i_RS1Addr_D == i_RDAddr_E)) || (i_RS2Valid_D & (i_RS2Addr_D == i_RDAddr_E))));
    wire w_DBusHaz_DM  = (i_IsMemRead_M && ((i_RS1Valid_D & (i_RS1Addr_D == i_RDAddr_M)) || (i_RS2Valid_D & (i_RS2Addr_D == i_RDAddr_M))));
    wire w_DBusHaz_DW  = (i_IsMemRead_W && ((i_RS1Valid_D & (i_RS1Addr_D == i_RDAddr_W)) || (i_RS2Valid_D & (i_RS2Addr_D == i_RDAddr_W))));
    wire w_DBusHazzard = w_DBusHaz_DE || w_DBusHaz_DM || w_DBusHaz_DW;

    reg r_StallCounter_d = 2'b0;
    reg r_StallCounter_q = 2'b0;

    reg r_DBusWaitReq_W = 0;

    always @(*) begin
        o_PcEn   <= 1;
        o_IBusRdEn  <= 1;
        o_IBusOZero <= 0;
        o_DBusTranslatorEn <= 1;

        o_RegEn_IF2 <= 1;
        o_RegEn_D  <= 1;
        o_RegEn_E  <= 1;
        o_RegEn_M  <= 1;
        o_RegEn_W  <= 1;

        o_RegClr_IF2 <= 0;
        o_RegClr_D <= 0;
        o_RegClr_E <= 0;
        o_RegClr_M <= 0;
        o_RegClr_W <= 0;

        r_StallCounter_d <= r_StallCounter_q;

        if(r_DBusWaitReq_W) begin
            //If there is a load data hazzard due to:
            //  -Slave asserting WaitReq

            o_DBusTranslatorEn <= 0;

            //Stall all the previous stages
            o_PcEn <= 0;
            o_IBusRdEn <= 0;

            o_RegEn_IF2 <= 0;
            o_RegEn_D   <= 0;
            o_RegEn_E   <= 0;
            o_RegEn_M   <= 0;
            o_RegEn_W   <= 0;

        end else if (i_TakeBranch_M) begin
            //If there is a branch hazzard
            //Clear out the consecutive instructions executing
            o_RegClr_IF2 <= 1;
            o_RegClr_D   <= 1;
            o_RegClr_E   <= 1;
            o_RegClr_M   <= 1;

            //Stall the pipelined for 2 cycles
            o_IBusOZero <= 0;

            r_StallCounter_d <= 1'd1;
        end else if(w_DBusHazzard)begin
            //If there is a load data dependency hazzard
            o_PcEn <= 0;
            o_IBusRdEn <= 0;
            
            o_RegEn_IF2 <= 0;
            o_RegEn_D <= 0;

            if(!(w_DBusHaz_DW && i_IsBranch_M))begin
                //Don't clear
                o_RegClr_E <= 1; 
            end
        end 

        if (r_StallCounter_q != 0)begin
            o_RegEn_E <= 0;

            if(r_StallCounter_q != 1)begin
                //POSSIBLE BUG
                o_RegEn_IF2 <= 0;
                o_RegEn_D <= 0; 
            end
            r_StallCounter_d <= r_StallCounter_q - 1;
        end
    end

    always @(posedge i_Clk ) begin
        r_StallCounter_q <= r_StallCounter_d;
        r_DBusWaitReq_W <= i_DBusWaitReq_M;
    end
endmodule
