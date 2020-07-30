`timescale 1ns / 1ps

module UartRx (
    input i_Clk,

    input [15:0] i_ClksPerBit,
    output reg o_RxDataValid,
    output reg [7:0] o_RxData,

    input i_UART_RX
    );

    initial begin
        o_RxDataValid <= 0;
        o_RxData <= 0;
    end
    
    reg [15:0] r_ClksPerBitCounter = 16'b0;
    reg [2:0] r_BitCounter = 3'b0;

    //UART RX state machine
    localparam RX_STATE_SIZE = 2;
    localparam RX_WAIT          = 0,
               RX_WAIT_HALF_BIT = 1,
               RX_DATA          = 2,
               RX_WAIT_STOP_BIT = 3;
    reg [RX_STATE_SIZE-1:0] RXState = 0;

    always @(posedge i_Clk)begin
        o_RxDataValid <= 0;

        case (RXState)
            RX_WAIT:begin
                //Wait for the start bit
                if(i_UART_RX == 0)begin
                    RXState <= RX_WAIT_HALF_BIT;
                end
            end
            RX_WAIT_HALF_BIT:begin
                r_ClksPerBitCounter <= r_ClksPerBitCounter + 1;
                if(r_ClksPerBitCounter == (i_ClksPerBit[15:1]))begin
                    r_ClksPerBitCounter <= 0;
                    RXState <= RX_DATA;
                end
            end
            RX_DATA:begin
                r_ClksPerBitCounter <= r_ClksPerBitCounter + 1;
                if(r_ClksPerBitCounter == i_ClksPerBit)begin
                    if(r_BitCounter == 7)begin
                        o_RxDataValid <= 1;
                        r_BitCounter <= 0;
                        RXState <= RX_WAIT_STOP_BIT;
                    end else begin
                        r_BitCounter <= r_BitCounter + 1;
                    end
                    r_ClksPerBitCounter <= 0;
                    o_RxData <= {i_UART_RX, o_RxData[7:1]};
                end
            end
            RX_WAIT_STOP_BIT:begin
                r_ClksPerBitCounter <= r_ClksPerBitCounter + 1;
                if(r_ClksPerBitCounter == i_ClksPerBit)begin
                    r_ClksPerBitCounter <= 0;
                    RXState <= RX_WAIT;
                end
            end
        endcase
    end
endmodule