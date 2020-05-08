`timescale 1ns / 1ps

module SOC(
    input i_OscClk,

    output o_UART0_TX
    );
    
    //DBus Layout
    parameter DBUS_TOP_AddrBitsPerBlock = 8;

    //PLL_M Signals//
    wire w_ClkSys;

    //CPU0 DBus//
    wire [29:0]w_CPU0_DBus_Address;
    wire [3:0]w_CPU0_DBus_ByteEn;
    wire w_CPU0_DBus_Read;
    wire w_CPU0_DBus_Write;
    wire [31:0]w_CPU0_DBus_ReadData;
    wire [31:0]w_CPU0_DBus_WriteData;
    wire w_CPU0_DBus_WaitRequest;

    PLL_M PLL_M0(
        .i_Clk50M(i_OscClk),
        .o_Clk100M(w_ClkSys)
    );

    CPU CPU0 (
        .i_Clk(w_ClkSys),

        //DBus Master
        //.o_DBus_Req_E(),
        .i_DBus_Gnt_M(1'b1),
        
        .o_DBus_Address(w_CPU0_DBus_Address),
        .o_DBus_ByteEn(w_CPU0_DBus_ByteEn),
        .o_DBus_Read(w_CPU0_DBus_Read),
        .o_DBus_Write(w_CPU0_DBus_Write),
        .i_DBus_ReadData(w_CPU0_DBus_ReadData),
        .o_DBus_WriteData(w_CPU0_DBus_WriteData),
        .i_DBus_WaitRequest(w_CPU0_DBus_WaitRequest)
    );

    DRAM #(
        .ADDR_BITS_PER_BLOCK(DBUS_TOP_AddrBitsPerBlock),
        .ADDR_BLOCK(0),
        .DEPTH(64)
    )DRAM0(
        .i_Clk(w_ClkSys),

        //DBus Slave
        .i_DBus_Address(w_CPU0_DBus_Address),
        .i_DBus_ByteEn(w_CPU0_DBus_ByteEn),
        .i_DBus_Read(w_CPU0_DBus_Read),
        .i_DBusWrite(w_CPU0_DBus_Write),
        .o_DBus_ReadData(w_CPU0_DBus_ReadData),
        .i_DBus_WriteData(w_CPU0_DBus_WriteData),
        .o_DBus_WaitRequest(w_CPU0_DBus_WaitRequest)
    );

    UART #(
        .ADDR_BITS_PER_BLOCK(DBUS_TOP_AddrBitsPerBlock),
        .ADDR_BLOCK(1)
    )UART0(
        .i_Clk(w_ClkSys),

        //DBus Slave
        .i_DBus_Address(w_CPU0_DBus_Address),
        .i_DBus_ByteEn(w_CPU0_DBus_ByteEn),
        .i_DBus_Read(w_CPU0_DBus_Read),
        .i_DBusWrite(w_CPU0_DBus_Write),
        .o_DBus_ReadData(w_CPU0_DBus_ReadData),
        .i_DBus_WriteData(w_CPU0_DBus_WriteData),
        .o_DBus_WaitRequest(w_CPU0_DBus_WaitRequest),

        .o_UART_TX(o_UART0_TX)
    );
    
    Counter #(
        .ADDR_BITS_PER_BLOCK(DBUS_TOP_AddrBitsPerBlock),
        .ADDR_BLOCK(2)
    )Counter0(
        .i_Clk(w_ClkSys),

        //DBus Slave
        .i_DBus_Address(w_CPU0_DBus_Address),
        .i_DBus_ByteEn(w_CPU0_DBus_ByteEn),
        .i_DBus_Read(w_CPU0_DBus_Read),
        .i_DBusWrite(w_CPU0_DBus_Write),
        .o_DBus_ReadData(w_CPU0_DBus_ReadData),
        .i_DBus_WriteData(w_CPU0_DBus_WriteData),
        .o_DBus_WaitRequest(w_CPU0_DBus_WaitRequest)
    );

endmodule