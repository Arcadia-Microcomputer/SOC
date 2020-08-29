`timescale 1ns / 1ps

module I2SBusInterface #(
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
    input i_Audio_Clk,
	output o_I2S0_SDIN,
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
    parameter p_REG_ADDR_CNTRL = 0;
    parameter p_REG_ADDR_DATAL = 1;
    parameter p_REG_ADDR_DATAR = 2;

    //I2S FIFOs
    reg [47:0]r_AReg_Fifo_DataIn = 0;
    reg r_Fifo_WrEn = 0;
    wire [47:0]w_Fifo_DataOut;
    reg r_Fifo_RdEn = 0;
    wire w_Fifo_Full;
    wire w_Fifo_AlmostFull;
    wire w_Fifo_Empty;

    //I2S Driver Signals
    reg [47:0]r_I2S_DataIn = 0;
    wire w_I2S_ReqNextData;
    reg r_OldReqNextData = 0;

    wire w_full = r_Fifo_WrEn? (w_Fifo_AlmostFull || w_Fifo_Full): w_Fifo_Full;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
        r_Fifo_WrEn <= 0;

        if (i_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                    end
                    p_REG_ADDR_DATAL:begin
                        if(i_AV_ByteEn[0]) r_AReg_Fifo_DataIn[7:0]   <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1]) r_AReg_Fifo_DataIn[15:8]  <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2]) r_AReg_Fifo_DataIn[23:16] <= i_AV_WriteData[23:16];
                    end
                    p_REG_ADDR_DATAR:begin
                        if(i_AV_ByteEn[0]) r_AReg_Fifo_DataIn[31:24] <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1]) r_AReg_Fifo_DataIn[39:32] <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2])begin
                            r_AReg_Fifo_DataIn[47:40] <= i_AV_WriteData[23:16];
                            r_Fifo_WrEn <= 1;
                        end 
                    end
                endcase 
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        o_AV_ReadData <= {31'b0, w_full};
                    end
                    p_REG_ADDR_DATAL:begin
                        o_AV_ReadData <= {8'b0, r_AReg_Fifo_DataIn[23:0]};
                    end
                    p_REG_ADDR_DATAR:begin
                        o_AV_ReadData <= {8'b0, r_AReg_Fifo_DataIn[47:24]};
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase 
            end
        end
    end

    //Take care of keeping the I2S driver fed
    always @(posedge i_Audio_Clk) begin
        r_Fifo_RdEn <= 0;
        r_OldReqNextData <= w_I2S_ReqNextData;

        if((w_I2S_ReqNextData == 1) && (r_OldReqNextData == 0))begin
            if(w_Fifo_Empty)begin
                r_I2S_DataIn <= 0;
            end else begin
                r_I2S_DataIn <= w_Fifo_DataOut;
                r_Fifo_RdEn <= 1;
            end
        end
    end

    I2S_FIFO i2sFifo (
        .wr_clk(i_Clk),
        .rd_clk(i_Audio_Clk),

        .din(r_AReg_Fifo_DataIn),
        .wr_en(r_Fifo_WrEn),

        .rd_en(r_Fifo_RdEn),
        .dout(w_Fifo_DataOut),

        .full(w_Fifo_Full),
        .almost_full(w_Fifo_AlmostFull),
        .empty(w_Fifo_Empty)
    );

    I2SDriver I2SDriver0(
        .i_MasterClk(i_Audio_Clk),

        .i_LeftData(r_I2S_DataIn[23:0]),
        .i_RightData(r_I2S_DataIn[47:24]),
        .o_ReqNextData(w_I2S_ReqNextData),

        .o_SDIN(o_I2S0_SDIN),
        .o_SCLK(o_I2S0_SCLK),
        .o_LRCK(o_I2S0_LRCK),
        .o_MCLK(o_I2S0_MCLK)
    );

endmodule