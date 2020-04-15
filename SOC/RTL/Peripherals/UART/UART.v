`timescale 1ns / 1ps

module UART #(
    parameter ADDR_BITS_PER_BLOCK = 6,
    parameter ADDR_BLOCK = 0
    )(
    input i_Clk,

    //UART
    output o_UART_TX,

    //DBus slave
    input [29: 0] i_DBusAddr,
    input i_DBusRe,
    input i_DBusWe,
    input [3:0] i_DBusByteEn,
    output [31:0] o_DBusRd,
    input [31:0] i_DBusWd
    );

    reg r_SelRd = 1'b0;
    wire w_Sel = (i_DBusAddr[29:ADDR_BITS_PER_BLOCK] === ADDR_BLOCK)? 1: 0;
    wire [ADDR_BITS_PER_BLOCK-1:0] w_Addr = i_DBusAddr[ADDR_BITS_PER_BLOCK-1:0];

    assign o_DBusRd = r_SelRd? r_RD: 32'bz;

    wire w_TXDone;
    reg [31:0] r_RD = 0;
    reg r_TXEn = 1'b0;    
    reg r_Idle = 1'b0;

    //DBus addressable registers
    reg [15:0] r_Reg_ClksPerBit = 0;
    reg [7:0] r_Reg_DataWR = 0;
    reg [7:0] r_Reg_DataRD = 0;
 
    //The various register addresses
    parameter p_REG_ADDR_CTRL   = 0;
    parameter p_REG_ADDR_DATA   = 1;

    always @(posedge i_Clk)begin
        r_SelRd <= w_Sel;
        r_TXEn <= 1'b0;
        
        if(!r_Idle && !r_TXEn)begin
            if(w_TXDone )begin
                r_Idle <= 1'b1;
            end
        end

        if (w_Sel) begin
            if(i_DBusWe)begin
                //Write transaction
                case (w_Addr)
                    p_REG_ADDR_CTRL:begin
                        r_Reg_ClksPerBit[7:0]  <= i_DBusByteEn[0]? i_DBusWd[7:0] : r_Reg_ClksPerBit[7:0];
                        r_Reg_ClksPerBit[15:8] <= i_DBusByteEn[1]? i_DBusWd[15:8]: r_Reg_ClksPerBit[15:8];
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_DBusByteEn[0])begin
                            r_Reg_DataWR <= i_DBusWd[7:0];
                            r_Idle <= 1'b0;
                            r_TXEn <= 1'b1;
                        end
                    end
                endcase
            end
            
            if(i_DBusRe)begin
                //Read transaction
                case (w_Addr)
                    p_REG_ADDR_CTRL:begin
                        r_RD <= {15'b0, r_Idle, r_Reg_ClksPerBit};
                    end
                    p_REG_ADDR_DATA:begin
                        r_RD <= {24'b0, r_Reg_DataRD};
                    end
                    default:begin
                        r_RD <= 0;
                    end
                endcase
            end
        end
    end

    UartTx TX(
        .i_Clk(i_Clk),

        .o_UART_TX(o_UART_TX),
        
        .i_ClksPerBit(r_Reg_ClksPerBit),
        .i_TxEn(r_TXEn),
        .i_Data(r_Reg_DataWR[7:0]),
        .o_TxDone(w_TXDone)
    );
endmodule