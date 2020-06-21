`timescale 1ns / 1ps

module IBusMaster(
    input i_Clk,

    input i_RdEn,
    input i_OZero,

    //IBus Master
    output [29:0]o_IBus_Address,
    output o_IBus_Read,
    input [31:0] i_IBus_ReadData,
    input i_IBus_WaitReq,

    //CPU
    input [31:0] i_CpuAddr,
    output reg [31:0] o_CpuRd
    );

    reg r_Old_RdEn = 0;
    reg [31:0]r_OldRd = 0;

    assign o_IBus_Address = i_CpuAddr[31:2];
    assign o_IBus_Read = i_RdEn;

    always @(*)begin
        if(r_Old_RdEn)begin
           if(i_OZero)begin
                o_CpuRd <= 0;
            end else begin
                o_CpuRd <= i_IBus_ReadData;
            end 
        end else begin
            o_CpuRd <= r_OldRd;
        end
    end

    always @(posedge i_Clk) begin
        r_Old_RdEn <= i_RdEn;

        if(r_Old_RdEn)begin
            r_OldRd <= o_CpuRd;  
        end
    end
endmodule