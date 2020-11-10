`timescale 1ns / 1ps

module AvalonTestSlave #(
    parameter NUM_PERIPH_SEL_BITS = 5,
    parameter PERIPH_SEL = 0,
    parameter WRITE_WAIT_REQ_CYCLES = 0,
    parameter READ_WAIT_REQ_CYCLES = 0
    )(
    input i_Clk,

    //Avalon RW slave
    input [29:0]i_AV_Addr,
    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    output reg [31:0]o_AV_ReadData,
    input i_AV_Write,
    input [31:0]i_AV_WriteData,
    output reg o_AV_WaitRequest
    );
    initial begin
        o_AV_ReadData = 0;
        o_AV_WaitRequest = 0;
    end

    assign w_Sel = (i_AV_Addr[29:30-NUM_PERIPH_SEL_BITS] == PERIPH_SEL)? 1 : 0;
    assign w_RegAddr = i_AV_Addr[29-NUM_PERIPH_SEL_BITS:0];

    //Addresable registers
    reg [31:0]r_AReg_One = 0;

    reg [$clog2(WRITE_WAIT_REQ_CYCLES):0]r_Write_WaitReqCounter = 0;
    reg [$clog2(READ_WAIT_REQ_CYCLES):0]r_Read_WaitReqCounter = 0;

    always @(*) begin
        if(w_Sel)begin
            if(i_AV_Write)begin
                if(r_Write_WaitReqCounter != WRITE_WAIT_REQ_CYCLES)begin
                    o_AV_WaitRequest <= 1;
                end else begin
                    o_AV_WaitRequest <= 0;
                end
            end

            if(i_AV_Read)begin
                if(r_Read_WaitReqCounter != READ_WAIT_REQ_CYCLES)begin
                    o_AV_WaitRequest <= 1;
                end else begin
                    o_AV_WaitRequest <= 0;
                end
            end
        end
    end

    always @(posedge i_Clk) begin
        if(w_Sel)begin
            if(i_AV_Write)begin
                case (w_RegAddr)
                    0:begin
                        if(r_Write_WaitReqCounter == WRITE_WAIT_REQ_CYCLES)begin
                            if(i_AV_ByteEn[0]) r_AReg_One[7:0]   <= i_AV_WriteData[7:0];
                            if(i_AV_ByteEn[1]) r_AReg_One[15:8]  <= i_AV_WriteData[15:8];
                            if(i_AV_ByteEn[2]) r_AReg_One[23:16] <= i_AV_WriteData[23:16];
                            if(i_AV_ByteEn[3]) r_AReg_One[31:24] <= i_AV_WriteData[31:24];
                        end
                    end
                endcase
            end

            if(i_AV_Read)begin
                case (w_RegAddr)
                    0:begin
                       if(r_Read_WaitReqCounter == READ_WAIT_REQ_CYCLES)begin
                            o_AV_ReadData <= r_AReg_One;
                        end 
                    end
                endcase
            end 
            
            if(i_AV_Write)begin
                r_Write_WaitReqCounter <= r_Write_WaitReqCounter + 1;
            end else begin
                r_Write_WaitReqCounter <= 0;
            end

            if(i_AV_Read)begin
                r_Read_WaitReqCounter <= r_Read_WaitReqCounter + 1;
            end else begin
                r_Read_WaitReqCounter <= 0;
            end
        end
    end
endmodule


