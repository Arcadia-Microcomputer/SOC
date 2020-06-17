`timescale 1ns / 1ps

module UART #(
    parameter ADDR_SEL_BITS = 0
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
    output reg o_AV_WaitRequest,

    //UART
    output o_UART_TX
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
    end

    //The various register addresses
    parameter p_REG_ADDR_CTRL   = 0;
    parameter p_REG_ADDR_DATA   = 1;

    //DBus addressable registers
    reg [15:0] r_Reg_ClksPerBit = 0;
    reg [7:0] r_Reg_DataWR = 0;
    reg [7:0] r_Reg_DataRD = 0;

    //UartTx Signals
    wire w_TXDone;
    reg r_TXEn = 0;    
    reg r_Idle = 0;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
        r_TXEn <= 0;
        
        if(!r_Idle && !r_TXEn)begin
            if(w_TXDone)begin
                r_Idle <= 1;
            end
        end

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        r_Reg_ClksPerBit[7:0]  <= i_AV_ByteEn[0]? i_AV_WriteData[7:0] : r_Reg_ClksPerBit[7:0];
                        r_Reg_ClksPerBit[15:8] <= i_AV_ByteEn[1]? i_AV_WriteData[15:8]: r_Reg_ClksPerBit[15:8];
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_AV_ByteEn[0])begin
                            if(!r_Idle)begin
                                o_AV_WaitRequest <= 1;
                            end else begin
                                r_Reg_DataWR <= i_AV_WriteData[7:0];
                                r_Idle <= 0;
                                r_TXEn <= 1;
                            end
                        end
                    end
                endcase
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        o_AV_ReadData <= {15'b0, r_Idle, r_Reg_ClksPerBit};
                    end
                    p_REG_ADDR_DATA:begin
                        o_AV_ReadData <= {24'b0, r_Reg_DataRD};
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase
            end
        end
    end

    UartTx TX(
        .i_Clk(i_Clk),
        
        //Control Signals
        .i_ClksPerBit(r_Reg_ClksPerBit),
        .i_TxEn(r_TXEn),
        .i_Data(r_Reg_DataWR[7:0]),
        .o_TxDone(w_TXDone),

        .o_UART_TX(o_UART_TX)
    );

endmodule