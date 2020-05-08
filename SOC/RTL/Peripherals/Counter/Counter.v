`timescale 1ns / 1ps

module Counter #(
    parameter ADDR_BITS_PER_BLOCK = 6,
    parameter ADDR_BLOCK = 0
    )(
    input i_Clk,

    //DBus slave
    input [29:0]i_DBus_Address,
    input [3:0]i_DBus_ByteEn,
    input i_DBus_Read,
    input i_DBusWrite,
    output [31:0]o_DBus_ReadData,
    input [31:0]i_DBus_WriteData,
    output o_DBus_WaitRequest
    );

    //DBus Signals
    reg r_SelRd = 1'b0;
    reg [31:0] r_Rd = 32'b0;

    wire w_Sel = (i_DBus_Address[29:ADDR_BITS_PER_BLOCK] === ADDR_BLOCK)? 1: 0;
    wire [ADDR_BITS_PER_BLOCK-1:0] w_Addr = i_DBus_Address[ADDR_BITS_PER_BLOCK-1:0];

    assign o_DBus_ReadData = r_SelRd? r_Rd: 32'bz;
    assign o_DBus_WaitRequest = r_SelRd? 1'b0: 1'bz;

    //The various register addresses
    parameter p_REG_ADDR_CTRL   = 0;
    parameter p_REG_ADDR_TRIG   = 1;
    
    //DBus addressable registers
    reg [31:0] r_Trigger = 0;
    reg r_Enable = 1'b0;
    reg r_OverFlowClr = 1'b0;

    //Counter Signals
    reg [31:0] r_Counter = 32'b0;
    reg r_OverFlow = 1'b0;
    
    always @(posedge i_Clk)begin
        //DBus Signals
        r_SelRd <= w_Sel;

        r_OverFlowClr <= 1'b0;

        //Counter Signals
        if(r_Enable)begin
           if(r_Counter == r_Trigger)begin
                r_Counter <= 1'b0;
                r_OverFlow <= 1'b1;
            end else begin
                r_Counter <= r_Counter + 1'b1;

                if(r_OverFlowClr)begin
                    r_OverFlow <= 1'b0;
                end
            end 
        end

        if (w_Sel) begin
            //Write transaction
            if(i_DBusWrite)begin
                case (w_Addr)
                    p_REG_ADDR_CTRL:begin
                        {r_OverFlowClr, r_Enable} <= i_DBus_ByteEn[0]? i_DBus_WriteData[1:0]: r_OverFlowClr;
                    end
                    p_REG_ADDR_TRIG:begin
                        r_Trigger[7:0]   <= i_DBus_ByteEn[0]? i_DBus_WriteData[7:0]  : r_Trigger[7:0];
                        r_Trigger[15:8]  <= i_DBus_ByteEn[1]? i_DBus_WriteData[15:8] : r_Trigger[15:8];
                        r_Trigger[23:16] <= i_DBus_ByteEn[0]? i_DBus_WriteData[23:16]: r_Trigger[23:16];
                        r_Trigger[31:24] <= i_DBus_ByteEn[1]? i_DBus_WriteData[31:24]: r_Trigger[31:24];
                    end
                endcase
            end
            
            //Read transaction
            if(i_DBus_Read)begin
                case (w_Addr)
                    p_REG_ADDR_CTRL:begin
                        r_Rd <= {30'b0, r_OverFlow, r_Enable};
                    end
                    p_REG_ADDR_TRIG:begin
                        r_Rd <= r_Trigger;
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
endmodule