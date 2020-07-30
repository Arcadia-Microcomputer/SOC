`timescale 1ns / 1ps

module UartBusInterface #(
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
    output o_UART_TX,
    input i_UART_RX
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
    reg r_Reg_TxEn = 0;
    reg r_Reg_RxEn = 0;
    reg [7:0] r_Reg_WrData = 0;
    reg [7:0] r_Reg_RdData = 0;

    //UartTx Signals
    wire w_UartTX_Done;
    reg r_UartTX_En = 0;

    //Tx Fifo Signals
    reg w_TxFifo_WrEn = 0;
    wire [7:0]w_TxFifo_RdData;
    wire w_TxFifo_Full;
    wire w_TxFifo_Empty;

    reg r_TxActive = 0;
    reg r_TxFifoWriteWait = 0;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
        w_TxFifo_WrEn <= 0;

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        if(i_AV_ByteEn[0]) r_Reg_ClksPerBit[7:0] <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1]) r_Reg_ClksPerBit[15:8] <= i_AV_WriteData[15:8];
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_AV_ByteEn[0])begin
                            w_TxFifo_WrEn <= 1;
                            r_Reg_WrData <= i_AV_WriteData[7:0];
                        end
                    end
                endcase
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        o_AV_ReadData <= {15'b0, (w_TxFifo_Empty && w_UartTX_Done), r_Reg_ClksPerBit};
                    end
                    p_REG_ADDR_DATA:begin
                        o_AV_ReadData <= {24'b0, 8'b0};
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase
            end
        end
    end

    always @(posedge i_Clk) begin
        r_UartTX_En <= 0;

        if(!w_TxFifo_Empty && w_UartTX_Done && !r_UartTX_En)begin
            r_UartTX_En <= 1;
        end
    end

    FIFO #(
        .WIDTH(8),
        .DEPTH(16)
    )TxFIFO(
        .i_Clk(i_Clk),

        .i_WrEn(w_TxFifo_WrEn),
        .i_WrData(r_Reg_WrData),

        .i_RdEn(r_UartTX_En),
        .o_RdData(w_TxFifo_RdData),

        .o_Full(w_TxFifo_Full),
        .o_Empty(w_TxFifo_Empty)
    );

    UartTx TX(
        .i_Clk(i_Clk),
        
        //Control Signals
        .i_ClksPerBit(r_Reg_ClksPerBit),
        .i_TxEn(r_UartTX_En),
        .i_Data(w_TxFifo_RdData),
        .o_TxDone(w_UartTX_Done),

        .o_UART_TX(o_UART_TX)
    );
endmodule