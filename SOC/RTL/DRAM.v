`timescale 1ns / 1ps

module DRAM #(
    parameter ADDR_BITS_PER_BLOCK = 6,
    parameter ADDR_BLOCK = 0,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //DBus slave
    input [29:0] i_DBusAddr,
    input i_DBusRe,
    input i_DBusWe,
    input [3:0] i_DBusByteEn,
    output [31:0] o_DBusRd,
    input [31:0] i_DBusWd
    );
    
    reg [31:0] r_Rd = 0;
    reg r_SelRd = 1'b0;
    wire w_Sel = (i_DBusAddr[29:ADDR_BITS_PER_BLOCK] === ADDR_BLOCK)? 1: 0;
    wire [ADDR_BITS_PER_BLOCK-1:0] w_Addr = i_DBusAddr[ADDR_BITS_PER_BLOCK-1:0];

    assign o_DBusRd = r_SelRd? r_Rd : 32'bz;

    //The Ram block
    reg [31:0] Ram [DEPTH - 1:0];

    //Initalize the ram
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h0000000d;
Ram[1] = 32'h6c6c6548;
Ram[2] = 32'h6f57206f;
Ram[3] = 32'h21646c72;
numRamUsed = 4;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        r_SelRd <= w_Sel;

        if(w_Sel)begin    
            if(i_DBusRe)begin
                r_Rd <= Ram[w_Addr]; 
            end

            if(i_DBusWe)begin
                Ram[w_Addr][7:0]    <= i_DBusByteEn[0]? i_DBusWd[7:0]   : Ram[w_Addr][7:0];
                Ram[w_Addr][15:8]   <= i_DBusByteEn[1]? i_DBusWd[15:8]  : Ram[w_Addr][15:8];
                Ram[w_Addr][23:16]  <= i_DBusByteEn[2]? i_DBusWd[23:16] : Ram[w_Addr][23:16];
                Ram[w_Addr][31:24]  <= i_DBusByteEn[3]? i_DBusWd[31:24] : Ram[w_Addr][31:24];
            end
        end
    end

endmodule
