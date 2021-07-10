`timescale 1ns / 1ps

module HazardUnit(
    input i_Clk,

    input i_RS1Valid_ID,
    input [4:0]i_RS1Addr_ID,

    input i_RS2Valid_ID,
    input [4:0]i_RS2Addr_ID,

    input [4:0]i_RDAddr_EX1,
    input [4:0]i_RDAddr_EX2,
    input [4:0]i_RDAddr_WB,

    input i_IsMemRead_EX1,
    input i_IsMemRead_EX2,
    input i_IsMemRead_WB,

    input i_IsJump_EX2,
    input i_IsBranch_EX2,
    input i_TakeBranch_EX2,

    input i_ICacheStall_PC,
    input i_DCacheStall_EX2,

    output reg o_PcEn,
    output reg o_ICacheRdEn,
    output reg o_ICacheHoldOut,
    output reg o_ICacheClear,

    output reg o_RegEn_IF,
    output reg o_RegEn_ID,
    output reg o_RegEn_EX1,
    output reg o_RegEn_EX2,
    output reg o_RegEn_WB,

    output reg o_RegClr_IF,
    output reg o_RegClr_ID,
    output reg o_RegClr_EX1,
    output reg o_RegClr_EX2,
    output reg o_RegClr_WB
    );
    
    initial begin
        o_PcEn = 1;
        o_ICacheRdEn  = 1;
        o_ICacheHoldOut = 0;
        o_ICacheClear = 0;

        o_RegEn_IF  = 1;
        o_RegEn_ID  = 1;
        o_RegEn_EX1 = 1;
        o_RegEn_EX2 = 1;
        o_RegEn_WB  = 1;

        o_RegClr_IF  = 0;
        o_RegClr_ID  = 0;
        o_RegClr_EX1 = 0;
        o_RegClr_EX2 = 0;
        o_RegClr_WB  = 0;
    end

    // Check for DBUS hazzards
    wire w_DBusHaz_ID_EX1  = (i_IsMemRead_EX1 && ((i_RS1Valid_ID & (i_RS1Addr_ID == i_RDAddr_EX1)) || (i_RS2Valid_ID & (i_RS2Addr_ID == i_RDAddr_EX1))));
    wire w_DBusHaz_ID_EX2  = (i_IsMemRead_EX2 && ((i_RS1Valid_ID & (i_RS1Addr_ID == i_RDAddr_EX2)) || (i_RS2Valid_ID & (i_RS2Addr_ID == i_RDAddr_EX2))));
    wire w_DBusHaz_ID_WB  = (i_IsMemRead_WB && ((i_RS1Valid_ID & (i_RS1Addr_ID == i_RDAddr_WB)) || (i_RS2Valid_ID & (i_RS2Addr_ID == i_RDAddr_WB))));
    wire w_DBusHazzard = w_DBusHaz_ID_EX1 || w_DBusHaz_ID_EX2 || w_DBusHaz_ID_WB;

    reg r_Old_ICacheStall_PC = 0;    
    reg r_Old_DCacheStall_EX2 = 0;

    reg r_Old_TakeBranch_EX2 = 0;
    reg r_Old_IsJump_EX2 = 0;
    reg r_Old_StallFetchStage = 0;
    reg r_Old_StallBranch = 0;
    reg r_Old_Old_StallBranch = 0;
    reg r_Old_ICacheHoldOut = 0;

    // Hazzards that result the fetch stages stalling
    wire w_StallFetchStage = i_DCacheStall_EX2 | (w_DBusHazzard && !i_TakeBranch_EX2) | r_Old_TakeBranch_EX2 | r_Old_IsJump_EX2;
    wire w_StallBranch = i_ICacheStall_PC;
    
    always @(posedge i_Clk) begin
        r_Old_ICacheStall_PC <= i_ICacheStall_PC;
        r_Old_DCacheStall_EX2 <= i_DCacheStall_EX2;

        r_Old_TakeBranch_EX2 <= i_TakeBranch_EX2;
        r_Old_IsJump_EX2 <= i_IsJump_EX2;
        r_Old_StallFetchStage <= w_StallFetchStage;
        r_Old_StallBranch <= w_StallBranch;
        r_Old_Old_StallBranch <= r_Old_StallBranch;
        r_Old_ICacheHoldOut <= o_ICacheHoldOut;
    end

    always @(*) begin
        o_PcEn <= 1;
        o_ICacheRdEn  <= 1;
        o_ICacheHoldOut <= 0;
        o_ICacheClear <= 0;

        o_RegEn_IF  <= 1;
        o_RegEn_ID  <= 1;
        o_RegEn_EX1 <= 1;
        o_RegEn_EX2 <= 1;
        o_RegEn_WB  <= 1;

        o_RegClr_IF  <= 0;
        o_RegClr_ID  <= 0;
        o_RegClr_EX1 <= 0;
        o_RegClr_EX2 <= 0;
        o_RegClr_WB  <= 0;

        // Fetch stages stall
        if(i_ICacheStall_PC)begin
            // Icache stall
            o_PcEn <= 0;

            // If fetch stage asked to stall from futher down the pipeline
            if(w_StallFetchStage)begin
                // Can't execute fetched instruction so just full stall for now
                o_RegEn_IF <= 0;
                o_RegEn_ID <= 0;

                // Store the next fetched instruction in the ICache internal reg
                if(r_Old_StallFetchStage)begin
                    o_ICacheHoldOut <= 1;
                end
            end else if(r_Old_ICacheStall_PC)begin
                // Wait one cycle to
                // - Allow previously fetched inst to executed
                // - IF PC to be synced with the instruction being fetched
                o_RegEn_IF <= 0;
                o_RegClr_ID <= 1;
            end
        end else if(r_Old_ICacheStall_PC) begin
            // New instrution is loaded into IF_ID reg

            if(w_StallFetchStage || r_Old_StallFetchStage)begin
                // Current instruction in ID need to be executed so no double fetch
                o_ICacheHoldOut <= 1; 
            end else begin
                // Double fetch happens to make sure to ignore first time inst fetched
                o_RegClr_ID <= 1;
            end
        end else if (w_StallFetchStage) begin
            // Stalls from deeper down the pipeline
            o_PcEn <= 0;
            o_ICacheRdEn <= 0;

            o_RegEn_IF <= 0;
            o_RegEn_ID <= 0;
        end else if (r_Old_StallFetchStage) begin
            // New inst is already fetched at this point
            // Gets loaded into IF_ID reg here
        end

        if (i_TakeBranch_EX2 | i_IsJump_EX2) begin
            if(w_StallBranch) begin
                // Stall taking branch until free to do so (i.e fetching stage stalled)

                // Stall previous stages
                // EX1 etc will have instructions from branch not taken so can ignore that stage
                o_RegEn_EX2 <= 0;
            end else begin
                // Clear out the consecutive instructions executing
                o_RegClr_IF <= 1;
                o_RegClr_ID  <= 1;
                o_RegClr_EX1 <= 1;
                o_RegClr_EX2 <= 1;
            end   
        end else if(r_Old_TakeBranch_EX2) begin
            // Need to clear as under certain circumstances, inst is bad
            //if(r_Old_ICacheHoldOut || r_Old_IsJump_EX2 || r_Old_Old_StallBranch)begin 
                o_ICacheClear <= 1;
            //end
        end

        if(i_DCacheStall_EX2) begin
            // If there is a load data hazzard due to DCache stalling
            // Stall all the previous stages
            
            o_RegEn_EX1 <= 0;
            o_RegEn_EX2 <= 0;
            
            if(w_DBusHaz_ID_WB || w_DBusHaz_ID_EX2 || i_IsMemRead_EX2)begin
                // Will be trash in WB reg as DCache hasn't got data yet
                o_RegClr_WB <= 1;
            end else if(r_Old_DCacheStall_EX2)begin
                // Allow inst currently in wb to execute, after cycle clear it though as
                // no vaid instruction in it
                o_RegClr_WB <= 1;
            end
        end else if(w_DBusHazzard)begin
            //If there is a load data dependency hazzard
            o_RegClr_EX1 <= 1;
        end 
    end

endmodule
