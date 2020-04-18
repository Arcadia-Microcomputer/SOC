`timescale 1ns / 1ps

module SOC(
    input i_Clk100M,

    output o_UART0_TX
    );

    //----CPU0 DBUS----//
    parameter p_CPU0_DBUS_ADDR_BITS_PER_BLOCK = 8;
    
    wire [29:0]w_CPU0_DBusAddr;
    wire w_CPU0_DBusRe;
    wire w_CPU0_DBusWe;
    wire [3:0]w_CPU0_DBusByteEn;
    wire [31:0]w_CPU0_DBusRd;
    wire [31:0]w_CPU0_DBusWd;

    CPU CPU0 (
        .i_Clk(i_Clk100M),

        //DBUS Master
        .o_DBusAddr(w_CPU0_DBusAddr),
        .o_DBusRe(w_CPU0_DBusRe),
        .o_DBusWe(w_CPU0_DBusWe),
        .o_DBusByteEn(w_CPU0_DBusByteEn),
        .i_DBusRd(w_CPU0_DBusRd),
        .i_DBusWd(w_CPU0_DBusWd)
    );

    DRAM #(
        .ADDR_BITS_PER_BLOCK(p_CPU0_DBUS_ADDR_BITS_PER_BLOCK),
        .ADDR_BLOCK(0),
        .DEPTH(64)
    )DRAM0(
        .i_Clk(i_Clk100M),

        //DBus Slave
        .i_DBusAddr(w_CPU0_DBusAddr),
        .i_DBusRe(w_CPU0_DBusRe),
        .i_DBusWe(w_CPU0_DBusWe),
        .i_DBusByteEn(w_CPU0_DBusByteEn),
        .o_DBusRd(w_CPU0_DBusRd),
        .i_DBusWd(w_CPU0_DBusWd)
    );

    UART #(
        .ADDR_BITS_PER_BLOCK(p_CPU0_DBUS_ADDR_BITS_PER_BLOCK),
        .ADDR_BLOCK(1)
    )UART0(
        .i_Clk(i_Clk100M),

        .o_UART_TX(o_UART0_TX),

        //DBus Slave
        .i_DBusAddr(w_CPU0_DBusAddr),
        .i_DBusRe(w_CPU0_DBusRe),
        .i_DBusWe(w_CPU0_DBusWe),
        .i_DBusByteEn(w_CPU0_DBusByteEn),
        .o_DBusRd(w_CPU0_DBusRd),
        .i_DBusWd(w_CPU0_DBusWd)
    );
    
endmodule