`timescale 1ns / 1ps

module DMA #(
    parameter ADDR_SEL_BITS = 0,
    parameter ADDR_BLOCK = 0
    )(
    input i_Clk,

    //Avalon RW slave
    input i_AV_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV_RegAddr,
    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    input i_AV_Write,
    output reg [31:0]o_AV_ReadData,
    input [31:0]i_AV_WriteData,
    output o_AV_WaitRequest,
    );

    reg [29:0]r_AREG_Address = 0;
    reg [15:0]r_AREG_BurstLength = 0;
    reg r_AREG_En = 0;


endmodule