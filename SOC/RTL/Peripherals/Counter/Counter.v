`timescale 1ns / 1ps

module Counter #(
    parameter ADDR_SEL_BITS = 0,
    parameter ADDR_BLOCK = 0
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
    output o_AV_WaitRequest
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
    end
    assign o_AV_WaitRequest = 0;

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
        o_AV_ReadData <= 0;
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

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        if(i_AV_ByteEn[0]) {r_OverFlowClr, r_Enable} <= i_AV_WriteData[1:0];
                    end
                    p_REG_ADDR_TRIG:begin
                        if(i_AV_ByteEn[0]) r_Trigger[7:0]   <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1]) r_Trigger[15:8]  <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2]) r_Trigger[23:16] <= i_AV_WriteData[23:16];
                        if(i_AV_ByteEn[3]) r_Trigger[31:24] <= i_AV_WriteData[31:24];
                    end
                endcase
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_CTRL:begin
                        o_AV_ReadData <= {30'b0, r_OverFlow, r_Enable};
                    end
                    p_REG_ADDR_TRIG:begin
                        o_AV_ReadData <= r_Trigger;
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase
            end else begin
                o_AV_ReadData <= 32'd0; 
            end
        end
    end
endmodule