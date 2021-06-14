`timescale 1ns / 1ps

module DCache(
    input i_Clk,
    output o_Stall,

    //CPU
    input [2:0]i_BusMode,
    input [31:0]i_CpuAddr,
    input i_CpuRe,
    input i_CpuWe,
    output [31:0]o_CpuRd,
    input [31:0]i_CpuWd,

    //DBUS
    output [29:0]o_DBus_Address,
    output [3:0]o_DBus_ByteEn,
    output o_DBus_Read,
    output o_DBus_Write,
    input [31:0]i_DBus_ReadData,
    output [31:0]o_DBus_WriteData,
    input i_DBus_WaitRequest
    );
    
    reg r_TranslatorEn = 1;

    assign o_Stall = (i_CpuRe || i_CpuWe) & i_DBus_WaitRequest;

    always @(posedge i_Clk) begin
        r_TranslatorEn <= 1;

        if(o_Stall)begin
            r_TranslatorEn <= 0;
        end
    end

    DBusTranslator DBusTranslator0(
        .i_Clk(i_Clk),
        .i_TranslatorEn(r_TranslatorEn),

        .i_BusMode(i_BusMode),
        .i_CpuAddr(i_CpuAddr),
        .i_CpuRe(i_CpuRe),
        .i_CpuWe(i_CpuWe),
        .o_CpuRd(o_CpuRd),
        .i_CpuWd(i_CpuWd),

        .o_DBus_Address(o_DBus_Address),
        .o_DBus_ByteEn(o_DBus_ByteEn),
        .o_DBus_Read(o_DBus_Read),
        .o_DBus_Write(o_DBus_Write),
        .i_DBus_ReadData(i_DBus_ReadData),
        .o_DBus_WriteData(o_DBus_WriteData)  
    );

endmodule