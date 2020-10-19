`timescale 1ns / 1ps

module RAM #(
    parameter ADDR_SEL_BITS = 6,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon R slave
    input i_AV0_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV0_RegAddr,
    input i_AV0_Read,
    output reg [31:0]o_AV0_ReadData,
    output o_AV0_WaitRequest,

    //Avalon RW slave
    input i_AV1_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV1_RegAddr,
    input [3:0]i_AV1_ByteEn,
    input i_AV1_Read,
    input i_AV1_Write,
    output reg [31:0]o_AV1_ReadData,
    input [31:0]i_AV1_WriteData,
    output o_AV1_WaitRequest
    );

    //DBus Signals
    initial begin
        o_AV1_ReadData <= 0;
    end
    assign o_AV0_WaitRequest = 0;
    assign o_AV1_WaitRequest = 0;

    //The Ram block
    reg [31:0] Ram [DEPTH - 1:0];

    integer i;
    initial begin
        for(i = 0; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        o_AV0_ReadData <= 0;
        o_AV1_ReadData <= 0;

        if(i_AV0_SlaveSel)begin
            if(i_AV0_Read)begin
                o_AV0_ReadData <= Ram[i_AV0_RegAddr[$clog2(DEPTH)-1:0]]; 
            end
        end 

        if(i_AV1_SlaveSel)begin
            if(i_AV1_Write)begin
                if(i_AV1_ByteEn[0]) Ram[i_AV1_RegAddr][7:0]    <= i_AV1_WriteData[7:0];
                if(i_AV1_ByteEn[1]) Ram[i_AV1_RegAddr][15:8]   <= i_AV1_WriteData[15:8];
                if(i_AV1_ByteEn[2]) Ram[i_AV1_RegAddr][23:16]  <= i_AV1_WriteData[23:16];
                if(i_AV1_ByteEn[3]) Ram[i_AV1_RegAddr][31:24]  <= i_AV1_WriteData[31:24];
            end
            if(i_AV1_Read)begin
                o_AV1_ReadData <= Ram[i_AV1_RegAddr[$clog2(DEPTH)-1:0]]; 
            end
        end 
    end

endmodule
