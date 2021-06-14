`timescale 1ns / 1ps

module ICache(
    input i_Clk,

    input i_RdEn,
    input i_HoldOut,
    output o_Stall,

    //CPU
    input [31:0]i_CpuAddr,
    output reg [31:0]o_CpuRd,

    //IBus Master
    output [29:0]o_IBus_Address,
    output o_IBus_Read,
    input [31:0]i_IBus_ReadData,
    input i_IBus_WaitReq
    );

    // Stall if wait request line is high and
    // currently performing a read operation
    assign o_Stall = i_RdEn & i_IBus_WaitReq;

    reg [31:0]r_Old_CpuRd = 0;
    reg r_Old_RdEn = 0;

    assign o_IBus_Address = i_CpuAddr[31:2];
    assign o_IBus_Read = i_RdEn;
    

    always @(*) begin
        o_CpuRd <= r_Old_CpuRd;

        if(r_Old_RdEn & !i_HoldOut) begin
            o_CpuRd <= i_IBus_ReadData; 
        end
    end

    always @(posedge i_Clk) begin
        r_Old_CpuRd <= o_CpuRd; 
        r_Old_RdEn <= i_RdEn;
    end
endmodule