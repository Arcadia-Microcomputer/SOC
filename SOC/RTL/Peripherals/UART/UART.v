`timescale 1ns / 1ps

module UART #(
    parameter ADDR_BITS_PER_BLOCK = 6,
    parameter ADDR_BLOCK = 0
    )(
    input i_Clk,

    //DBus slave
    input [29: 0] i_DBus_Address,
    input [3:0] i_DBus_ByteEn,
    input i_DBus_Read,
    input i_DBusWrite,
    output [31:0] o_DBus_ReadData,
    input [31:0] i_DBus_WriteData,
    output o_DBus_WaitRequest,

    //UART
    output o_UART_TX
    );

    //DBus Signals
    reg r_SelRd = 1'b0;
    reg [31:0] r_Rd = 32'b0;
    reg r_WaitRequest = 1'b0;

    wire w_Sel = (i_DBus_Address[29:ADDR_BITS_PER_BLOCK] === ADDR_BLOCK)? 1: 0;
    wire [ADDR_BITS_PER_BLOCK-1:0] w_Addr = i_DBus_Address[ADDR_BITS_PER_BLOCK-1:0];

    assign o_DBus_ReadData = r_SelRd? r_Rd: 32'bz;
    assign o_DBus_WaitRequest = r_SelRd? r_WaitRequest: 1'bz;

    //The various register addresses
    parameter p_REG_ADDR_CTRL   = 0;
    parameter p_REG_ADDR_DATA   = 1;

    //DBus addressable registers
    reg [15:0] r_Reg_ClksPerBit = 0;
    reg [7:0] r_Reg_DataWR = 0;
    reg [7:0] r_Reg_DataRD = 0;

    //UartTx Signals
    wire w_TXDone;
    reg r_TXEn = 1'b0;    
    reg r_Idle = 1'b0;

    always @(posedge i_Clk)begin
        r_SelRd <= w_Sel;
        r_TXEn <= 1'b0;
        r_WaitRequest <= 1'b0;
        
        if(!r_Idle && !r_TXEn)begin
            if(w_TXDone)begin
                r_Idle <= 1'b1;
            end
        end

        if (w_Sel) begin
            //Write transaction
            if(i_DBusWrite)begin
                case (w_Addr)
                    p_REG_ADDR_CTRL:begin
                        r_Reg_ClksPerBit[7:0]  <= i_DBus_ByteEn[0]? i_DBus_WriteData[7:0] : r_Reg_ClksPerBit[7:0];
                        r_Reg_ClksPerBit[15:8] <= i_DBus_ByteEn[1]? i_DBus_WriteData[15:8]: r_Reg_ClksPerBit[15:8];
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_DBus_ByteEn[0])begin
                            if(!r_Idle)begin
                                r_WaitRequest <= 1'b1;
                            end else begin
                                r_Reg_DataWR <= i_DBus_WriteData[7:0];
                                r_Idle <= 1'b0;
                                r_TXEn <= 1'b1;
                            end
                        end
                    end
                endcase
            end
            
            //Read transaction
            if(i_DBus_Read)begin
                case (w_Addr)
                    p_REG_ADDR_CTRL:begin
                        r_Rd <= {15'b0, r_Idle, r_Reg_ClksPerBit};
                    end
                    p_REG_ADDR_DATA:begin
                        r_Rd <= {24'b0, r_Reg_DataRD};
                    end
                    default:begin
                        r_Rd <= 0;
                    end
                endcase
            end else begin
                r_Rd <= 32'd0; 
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