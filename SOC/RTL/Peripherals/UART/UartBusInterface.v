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
    input i_UART_nCTS,
    input i_UART_RX,
    output o_UART_nRTS
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
    reg [15:0] r_AReg_ClksPerBit = 0;
    reg r_AReg_TxEn = 0;
    reg r_AReg_RxEn = 0;
    reg r_AReg_FlowControlEn = 0;
    reg [7:0] r_AReg_WrData = 0;
    reg [7:0] r_AReg_RdData = 0;

    //Tx FIFO Signals
    reg r_TxFifo_WrEn = 0;
    wire [7:0]w_TxFifo_RdData;
    wire w_TxFifo_Full;
    wire w_TxFifo_Empty;

    //UartTx Signals
    wire w_UartTX_Idle;
    reg r_UartTX_En = 0;

    //Rx FIFO Signals    
    reg r_RxFifo_RdEn = 0;
    wire [7:0]w_RxFifo_RdData;
    wire w_RxFifo_Full;
    wire w_RxFifo_Empty;
    wire w_RxFifo_ProgFull;

    //UartRx Signals
    wire w_RxDataValid;
    wire [7:0]w_RxData;

    assign o_UART_nRTS = r_AReg_FlowControlEn? w_RxFifo_ProgFull: 1'b0;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
        r_TxFifo_WrEn <= 0;
        r_RxFifo_RdEn <= 0;

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        if(i_AV_ByteEn[0]) r_AReg_ClksPerBit[7:0] <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1]) r_AReg_ClksPerBit[15:8] <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2])begin
                            r_AReg_TxEn <= i_AV_WriteData[16];
                            r_AReg_RxEn <= i_AV_WriteData[17];
                            r_AReg_FlowControlEn <= i_AV_WriteData[21];
                        end
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_AV_ByteEn[0])begin
                            r_TxFifo_WrEn <= 1;
                            r_AReg_WrData <= i_AV_WriteData[7:0];
                        end
                    end
                endcase
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        o_AV_ReadData <= {10'b0, r_AReg_FlowControlEn, !w_RxFifo_Empty, w_TxFifo_Full, (w_TxFifo_Empty && w_UartTX_Idle),
                                          r_AReg_RxEn, r_AReg_TxEn, r_AReg_ClksPerBit};
                    end
                    p_REG_ADDR_DATA:begin
                        r_RxFifo_RdEn <= 1;
                        o_AV_ReadData <= {24'b0, w_RxFifo_RdData};
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

        //If the tx fifo isn't empty and the uart tx module is idle,
        //send the next byte in the fifo
        if(!w_TxFifo_Empty && w_UartTX_Idle && !r_UartTX_En)begin
            r_UartTX_En <= 1;
        end
    end

    FIFO #(
        .FWFT("FALSE"),
        .WIDTH(8),
        .DEPTH(16)
    )TxFIFO(
        .i_Clk(i_Clk),

        .i_WrEn(r_TxFifo_WrEn),
        .i_WrData(r_AReg_WrData),

        .i_RdEn(r_UartTX_En),
        .o_RdData(w_TxFifo_RdData),

        .o_Full(w_TxFifo_Full),
        .o_Empty(w_TxFifo_Empty)
    );

    UartTx TX(
        .i_Clk(i_Clk),
        
        .i_ClksPerBit(r_AReg_ClksPerBit),
        .i_FC_En(r_AReg_FlowControlEn),
        .i_TxEn(r_UartTX_En),
        .i_Data(w_TxFifo_RdData),
        .o_TxIdle(w_UartTX_Idle),

        .o_UART_TX(o_UART_TX),
        .i_UART_nCTS(i_UART_nCTS)
    );

    FIFO #(
        .FWFT("TRUE"),
        .PROG_FULL_TRESHOLD(14),
        .WIDTH(8),
        .DEPTH(16)
    )RxFIFO(
        .i_Clk(i_Clk),

        .i_WrEn(w_RxDataValid),
        .i_WrData(w_RxData),

        .i_RdEn(r_RxFifo_RdEn),
        .o_RdData(w_RxFifo_RdData),

        .o_Full(w_RxFifo_Full),
        .o_Empty(w_RxFifo_Empty),
        .o_ProgFull(w_RxFifo_ProgFull)
    );

    UartRx RX(
        .i_Clk(i_Clk),
        
        .i_ClksPerBit(r_AReg_ClksPerBit),
        .o_RxDataValid(w_RxDataValid),
        .o_RxData(w_RxData),

        .i_UART_RX(i_UART_RX)
    );
endmodule