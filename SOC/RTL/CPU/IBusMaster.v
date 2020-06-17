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

    // reg [29:0]r_Old_Address = 0;
    // reg r_Old_Read = 0;

    // assign o_IBus_Address = (i_IBus_WaitReq === 1)? r_Old_Address: i_CpuAddr[31:2];
    // assign o_IBus_Read = (i_IBus_WaitReq === 1)? r_Old_Read: i_RdEn;

    assign o_IBus_Address = i_CpuAddr[31:2];
    assign o_IBus_Read = i_RdEn;

    always @(*)begin
        // if(i_IBus_WaitReq === 0)begin
            if(i_OZero)begin
                o_CpuRd <= 0;
            end else begin
                o_CpuRd <= i_IBus_ReadData;
            end
        // end else begin
        //     o_CpuRd <= 32'b0;
        // end
    end

    // always @(posedge i_Clk)begin
    //     if(!i_IBus_WaitReq)begin
    //         r_Old_Address <= i_CpuAddr[31:2];
    //         r_Old_Read <= i_RdEn;
    //     end
    // end
endmodule