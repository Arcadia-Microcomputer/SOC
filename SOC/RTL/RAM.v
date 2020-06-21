`timescale 1ns / 1ps

module RAM #(
    parameter ADDR_SEL_BITS = 6,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon RW slave
    input i_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_RegAddr,

    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    input i_AV_Write,
    output reg [31:0]o_AV_ReadData,
    input [31:0]i_AV_WriteData,
    output o_AV_WaitRequest
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
    end
    assign o_AV_WaitRequest = 0;

    //The Ram block
    reg [31:0] Ram [DEPTH - 1:0];

    //Initalize the RAM
    integer i;
    initial begin
        for(i = 0; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        o_AV_ReadData <= 0;

        if(i_SlaveSel)begin
            if(i_AV_Write)begin
                if(i_AV_ByteEn[0]) Ram[i_RegAddr][7:0]    <= i_AV_WriteData[7:0];
                if(i_AV_ByteEn[1]) Ram[i_RegAddr][15:8]   <= i_AV_WriteData[15:8];
                if(i_AV_ByteEn[2]) Ram[i_RegAddr][23:16]  <= i_AV_WriteData[23:16];
                if(i_AV_ByteEn[3]) Ram[i_RegAddr][31:24]  <= i_AV_WriteData[31:24];
            end

            if(i_AV_Read)begin
                o_AV_ReadData <= Ram[i_RegAddr]; 
            end
        end 
    end

endmodule
