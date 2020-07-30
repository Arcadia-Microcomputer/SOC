`timescale 1ns / 1ps

module UartTx (
    input i_Clk,

    input [15:0] i_ClksPerBit,
    input i_TxEn,
    input [7:0] i_Data,
    output reg o_TxIdle,

    output reg o_UART_TX
    );

    initial begin
        o_TxIdle <= 1'b1;
        o_UART_TX <= 1'b1;
    end
    
    reg [15:0]r_ClksPerBitCounter = 16'b0;
    reg [2:0]r_BitCounter = 3'b0;
    reg [7:0]r_Data = 0;

    //UART TX state machine
    localparam TX_STATE_SIZE = 2;
    localparam TX_WAIT      = 0,
               TX_START_BIT = 1,
               TX_DATA      = 2,
               TX_STOP      = 3;
    reg [TX_STATE_SIZE-1:0] TXState = TX_WAIT;

    always @(posedge i_Clk)begin
        case (TXState)
            TX_WAIT:begin
                o_UART_TX <= 1;
                r_ClksPerBitCounter <= 0;
                r_BitCounter <= 0;

                if(i_TxEn == 1)begin
                    o_TxIdle <= 0;
                    TXState <= TX_START_BIT;
                end else begin
                    o_TxIdle <= 1;
                end
            end
            TX_START_BIT:begin
                o_UART_TX <= 0;

                if(r_ClksPerBitCounter == (i_ClksPerBit - 1))begin
                    r_ClksPerBitCounter <= 0;
                    TXState <= TX_DATA;
                end else begin
                    r_ClksPerBitCounter <= r_ClksPerBitCounter + 1;
                end
            end
            TX_DATA:begin
                o_UART_TX <= i_Data[r_BitCounter];

                if(r_ClksPerBitCounter == (i_ClksPerBit - 1))begin
                    r_BitCounter <= r_BitCounter + 1;
                    r_ClksPerBitCounter <= 0;

                    if(r_BitCounter == 7)begin
                        r_BitCounter <= 0;
                        TXState <= TX_STOP; 
                    end
                end else begin
                    r_ClksPerBitCounter <= r_ClksPerBitCounter + 1;
                end
            end
            TX_STOP:begin
                o_UART_TX <= 1;
                if(r_ClksPerBitCounter == (i_ClksPerBit - 1))begin
                    r_ClksPerBitCounter <= 0;
                    TXState <= TX_WAIT;
                end else begin
                    r_ClksPerBitCounter <= r_ClksPerBitCounter + 1;
                end
            end
        endcase
    end
endmodule