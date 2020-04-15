`timescale 1ns / 1ps

module HazardUnit(
    input i_Clk,

    input [4:0]i_RS1Addr_D,
    input [4:0]i_RS2Addr_D,
    input [4:0]i_RDAddr_E,
    input [4:0]i_RDAddr_M,
    input [4:0]i_RDAddr_W,
    input i_IsMemRead_E,
    input i_IsMemRead_M,
    input i_IsMemRead_W,
    input i_IsBranch_E,
    input i_IsBranch_M,
    input i_TakeBranch_M,

    output reg o_PcEn0,
    output reg o_IRAMSel,

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
        o_PcEn0   = 1'b1;
        o_IRAMSel = 1'b0;

        o_RegEn_D  = 1'b1;
        o_RegEn_E  = 1'b1;
        o_RegEn_M  = 1'b1;
        o_RegEn_W  = 1'b1;

        o_RegClr_D = 1'b0;
        o_RegClr_E = 1'b0;
        o_RegClr_M = 1'b0;
        o_RegClr_W = 1'b0;
    end

    wire w_HazDRam_DE =  (i_IsMemRead_E && ((i_RS1Addr_D == i_RDAddr_E) || (i_RS2Addr_D == i_RDAddr_E));
    wire w_HazDRam_DM  = (i_IsMemRead_M && ((i_RS1Addr_D == i_RDAddr_M) || (i_RS2Addr_D == i_RDAddr_M));
    wire w_HazDRam_DW  = (i_IsMemRead_W && ((i_RS1Addr_D == i_RDAddr_W) || (i_RS2Addr_D == i_RDAddr_W));

    reg r_HazDram_q = 1'b0;

    reg [1:0]r_StallCounter_d = 2'b0;
    reg [1:0]r_StallCounter_q = 2'b0;

    always @(*) begin
        o_PcEn0   <= 1'b1;
        o_IRAMSel <= 1'b0;

        o_RegEn_D  <= 1'b1;
        o_RegEn_E  <= 1'b1;
        o_RegEn_M  <= 1'b1;
        o_RegEn_W  <= 1'b1;

        o_RegClr_D <= 1'b0;
        o_RegClr_E <= 1'b0;
        o_RegClr_M <= 1'b0;
        o_RegClr_W <= 1'b0;

        r_StallCounter_d <= r_StallCounter_q;
        
        if(w_HazDRam_DE)begin
            o_PcEn0 <= 1'b0;

            o_RegEn_D <= 1'b0;
            o_RegEn_E <= 1'b0;
        end else if(w_HazDRam_DM)begin
            o_PcEn0 <= 1'b0;
            o_IRAMSel <= 1'b1;

            o_RegEn_D <= 1'b0;
            o_RegEn_E <= 1'b0;

            o_RegClr_M <= 1'b1;
            o_RegClr_E <= 1'b1;
        end else if(w_HazDRam_DW)begin
        
        end else if(r_HazDram_q)begin
            o_IRAMSel <= 1'b1;
        end else if (i_IsBranch_M) begin
            if(i_TakeBranch_M)begin
                //Clear out the consecutive instructions executing
                o_RegClr_D <= 1'b1;
                o_RegClr_E <= 1'b1;
                o_RegClr_M <= 1'b1;

                //Stall the pipelined for 2 cycles
                o_IRAMSel <= 1'b1;
                r_StallCounter_d <= 2'd1;
            end
        end 

        if (r_StallCounter_q != 0)begin
            o_IRAMSel <= 1'b1;

            if(r_StallCounter_q != 1)begin
                o_RegEn_D <= 1'b0;
            end
            r_StallCounter_d <= r_StallCounter_q - 1;
        end
    end

    always @(posedge i_Clk ) begin
        r_StallCounter_q <= r_StallCounter_d;
        r_HazDram_q <= (w_HazDRam_E || w_HazDRam_M || w_HazDRam_W);
    end
endmodule
