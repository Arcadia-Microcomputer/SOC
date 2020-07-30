`timescale 1ns / 1ps

module GPIOBusInterface #(
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

    //I2S0 Output
	output reg o_I2S0_SDIN,
    output o_I2S0_SCLK,
    output o_I2S0_LRCK,
    output o_I2S0_MCLK
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
    end

    //The various register addresses
    parameter p_REG_ADDR_  = 0;


    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    :begin
                    end
                endcase 
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    :begin
                    
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase 
            end
        end
    end

endmodule