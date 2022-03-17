`timescale 1ns / 1ps

module RegFile(
    input i_Clk,

    input [4:0]i_AddrR1,
    output reg [31:0]o_RD1,

    input [4:0]i_AddrR2,
    output reg [31:0]o_RD2,

    input i_WE,
    input [4:0]i_WrAddr,
    input [31:0]i_WrData
    );

    //The registers, the first register is hard coded to 0
    reg [31:0] Registers[31:0];

    //Initalize the registers to 0 on startup
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)begin
            Registers[i] = 0;
        end
    end

    always @(*) begin
        o_RD1 <= (i_AddrR1 == 32'b0)? 32'b0: Registers[i_AddrR1];
        o_RD2 <= (i_AddrR2 == 32'b0)? 32'b0: Registers[i_AddrR2];
    end

    always @(negedge i_Clk)begin
        if(i_WE)begin
            if(i_WrAddr != 0)begin
                Registers[i_WrAddr] <= i_WrData; 
            end
        end
    end
endmodule
