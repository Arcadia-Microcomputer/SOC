`timescale 1ns / 1ps

module DRAM #(
    parameter ADDR_BITS_PER_BLOCK = 6,
    parameter ADDR_BLOCK = 0,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon DBus slave
    input [29:0] i_DBus_Address,
    input [3:0] i_DBus_ByteEn,
    input i_DBus_Read,
    input i_DBusWrite,
    output [31:0] o_DBus_ReadData,
    input [31:0] i_DBus_WriteData,
    output o_DBus_WaitRequest
    );
    
    reg [31:0] r_Rd = 0;
    reg r_SelRd = 1'b0;

    wire w_Sel = (i_DBus_Address[29:ADDR_BITS_PER_BLOCK] === ADDR_BLOCK)? 1: 0;
    wire [ADDR_BITS_PER_BLOCK-1:0] w_Addr = i_DBus_Address[ADDR_BITS_PER_BLOCK-1:0];

    assign o_DBus_ReadData = r_SelRd? r_Rd : 32'bz;
    assign o_DBus_WaitRequest = r_SelRd? 1'b0: 1'bz;

    //The Ram block
    reg [31:0] Ram [DEPTH - 1:0];

    //Initalize the ram
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h00000800;
Ram[1] = 32'h000000c8;
Ram[2] = 32'h6c6c6548;
Ram[3] = 32'h6f57206f;
Ram[4] = 32'h21646c72;
Ram[5] = 32'h48000a0d;
Ram[6] = 32'h72662069;
Ram[7] = 32'h53206d6f;
Ram[8] = 32'h6e697274;
Ram[9] = 32'h0a0d3267;
Ram[10] = 32'h00000000;
numRamUsed = 11;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        r_SelRd <= w_Sel;

        if(i_DBus_Read)begin
            r_Rd <= Ram[w_Addr]; 
        end

        // if(w_Sel && i_DBusWrite)begin
        //     if(i_DBus_ByteEn[0]) Ram[w_Addr][7:0]    <= i_DBus_WriteData[7:0];
        //     if(i_DBus_ByteEn[1]) Ram[w_Addr][15:8]   <= i_DBus_WriteData[15:8];
        //     if(i_DBus_ByteEn[2]) Ram[w_Addr][23:16]  <= i_DBus_WriteData[23:16];
        //     if(i_DBus_ByteEn[3]) Ram[w_Addr][31:24]  <= i_DBus_WriteData[31:24];
        // end
    end

endmodule
