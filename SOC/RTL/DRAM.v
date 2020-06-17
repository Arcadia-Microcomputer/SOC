`timescale 1ns / 1ps

module DRAM #(
    parameter ADDR_SEL_BITS = 6,
    parameter DEPTH = 32
    )(
    input i_Clk,

    //Avalon R slave
    input i_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_RegAddr,
    
    input [29:0]i_AV_Address,
    input i_AV_Read,
    output reg [31:0]o_AV_ReadData,
    output o_AV_WaitRequest
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
    end
    assign o_AV_WaitRequest = 0;

    //The Ram block
    reg [31:0] Ram [DEPTH - 1:0];

    //Initalize the ram
    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'h20000000;
Ram[1] = 32'h20000800;
Ram[2] = 32'h20001000;
Ram[3] = 32'h00239a95;
Ram[4] = 32'h2077654e;
Ram[5] = 32'h6f6c6f43;
Ram[6] = 32'h53207275;
Ram[7] = 32'h0a0d7465;
Ram[8] = 32'h00000000;
numRamUsed = 9;

        for(i = numRamUsed; i < DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    always @(posedge i_Clk) begin
        o_AV_ReadData <= 0;

        if(i_SlaveSel)begin
            if(i_AV_Read)begin
                o_AV_ReadData <= Ram[i_RegAddr]; 
            end
        end 
    end

endmodule
