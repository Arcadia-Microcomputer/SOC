`timescale 1ns / 1ps

module FlashBusInterface #(
    parameter MEM_ADDR_SEL_BITS = 0,
    parameter CNTRL_ADDR_SEL_BITS = 0
    )(
    input i_Clk,

    //Avalon RW slave
    input i_MEM_SlaveSel,
    input [29-MEM_ADDR_SEL_BITS:0]i_MEM_RegAddr,

    input i_CNTRL_SlaveSel,
    input [29-CNTRL_ADDR_SEL_BITS:0]i_CNTRL_RegAddr,

    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    input i_AV_Write,
    output reg [31:0]o_AV_ReadData,
    input [31:0]i_AV_WriteData,
    output reg o_AV_WaitRequest,

    //Flash Interface
    output o_Flash_Clk,
	output o_Flash_nCS,
	inout [3:0]io_Flash_IO
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
    end

    //The various register addresses
    parameter p_REG_ADDR_CNTRL = 0;
    parameter p_REG_ADDR_ADDR  = 1;
    parameter p_REG_ADDR_DATA  = 2;

    //Command interface commands
    parameter COMMAND_WRITE_ENABLE      = 0;
    parameter COMMAND_SECTOR_ERASE_4KB  = 1;
    parameter COMMAND_BLOCK_ERASE_64KB  = 2;
    parameter COMMAND_CHIP_ERASE        = 3;
    parameter COMMAND_PROGRAM_PAGE      = 4;
    parameter COMMAND_READ              = 5;
    parameter COMMAND_READ_SR           = 6;
    parameter COMMAND_WRITE_SR          = 7;

    //Flash Controller
	reg r_FLASH_CMDEn = 0;
    reg [2:0]r_FLASH_CMD = 0;
    reg [23:0]r_FLASH_Addr = 0;
    reg [7:0]r_FLASH_WriteData = 0;
    wire [7:0]w_FLASH_ReadData;
    wire w_FLASH_ReqNextData;
    wire w_FLASH_NewDataAvailableNextClk;
    reg r_FLASH_AckReq = 0;
    wire w_FLASH_CMDBusy;

    //Write Fifo Signals
    reg [7:0]r_WRFifo_Din = 0;
    reg r_WRFifo_WREn = 0;
    reg r_WRFifo_RDEn = 0;
    wire [7:0]w_WRFifo_DOut;
    wire w_WRFifo_Full;
    wire w_WRFifo_Empty;

    //Read FSM
    localparam FSM_STATE_SIZE = 1;
    localparam FSM_WAIT = 0,
               FSM_TX = 1;
    reg [FSM_STATE_SIZE-1:0] FSM_state = FSM_WAIT;

    reg r_ReadByteCounter = 0;
    
    //Addressable Registers
    reg [23:0]r_Address = 0;
    reg [3:0]r_CMD = 0;

    reg r_isWriteTransaction = 0;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        o_AV_WaitRequest <= 0;
        r_WRFifo_WREn <= 0;
        r_WRFifo_RDEn <= 0;
        r_FLASH_CMDEn <= 0;

        if (i_MEM_SlaveSel) begin
            //Read transaction
            if(i_AV_Read)begin
                //Check to see if in the memory mapped read section
                if(i_MEM_RegAddr[29-MEM_ADDR_SEL_BITS:22] == 0)begin
                    r_FLASH_Addr <= {i_MEM_RegAddr[21:0], 4'b0};
                    r_FLASH_CMD <= COMMAND_READ;
                end
            end
        end

        if (i_CNTRL_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_CNTRL_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        if(i_AV_ByteEn[0])begin
                            r_CMD <= i_AV_WriteData[3:0];
                        end
                        if(i_AV_ByteEn[1])begin
                            if(!w_FLASH_CMDBusy)begin
                                r_FLASH_Addr <= r_Address;

                                if(i_AV_ByteEn[0])begin
                                    r_FLASH_CMD <= i_AV_WriteData[3:0];
                                    if((i_AV_WriteData[3:0] == COMMAND_PROGRAM_PAGE) && !w_WRFifo_Empty)begin
                                        r_isWriteTransaction <= 1;
                                        r_WRFifo_RDEn <= 1; 
                                    end
                                end else begin
                                    r_FLASH_CMD <= r_CMD;
                                    if((r_CMD == COMMAND_PROGRAM_PAGE) && !w_WRFifo_Empty)begin
                                        r_isWriteTransaction <= 1;
                                        r_WRFifo_RDEn <= 1; 
                                    end
                                end

                                r_FLASH_CMDEn <= i_AV_WriteData[8];
                            end
                        end
                    end
                    p_REG_ADDR_ADDR:begin
                        r_Address[7:0]   <= i_AV_ByteEn[0]? i_AV_WriteData[7:0]  : r_FLASH_Addr[7:0];
                        r_Address[15:8]  <= i_AV_ByteEn[1]? i_AV_WriteData[15:8] : r_FLASH_Addr[15:8];
                        r_Address[23:16] <= i_AV_ByteEn[2]? i_AV_WriteData[23:16]: r_FLASH_Addr[23:16];
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_AV_ByteEn[0])begin
                            r_WRFifo_WREn <= 1;
                            r_WRFifo_Din <= i_AV_WriteData[7:0];
                        end
                    end
                endcase 
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_CNTRL_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        o_AV_ReadData <= {20'b0, w_WRFifo_Empty, w_WRFifo_Full, w_FLASH_CMDBusy, r_FLASH_CMDEn, 4'b0, r_CMD};
                    end
                    p_REG_ADDR_ADDR:begin
                        o_AV_ReadData <= {8'b0, r_Address};
                    end
                    p_REG_ADDR_DATA:begin
                        o_AV_ReadData <= {24'b0, w_FLASH_ReadData};
                    end
                endcase 
            end
        end

        if(r_isWriteTransaction)begin
            r_FLASH_AckReq <= 1;
            r_FLASH_WriteData <= w_WRFifo_DOut;

            //Check to see if the flash controler wants new data to write 
            if(w_FLASH_ReqNextData)begin
                if(!w_WRFifo_Empty)begin
                    r_WRFifo_RDEn <= 1;
                end else begin
                    //If the write FIFO is empty, end the transaction
                    r_isWriteTransaction <= 0;
                    r_FLASH_AckReq <= 0;
                end
            end
        end
    end

    FlashControler FlashControler0(
        .i_Clk(i_Clk),

        .i_CMDEn(r_FLASH_CMDEn),
        .i_CMD(r_FLASH_CMD),
        .i_Addr(r_FLASH_Addr),
        .i_WriteData(r_FLASH_WriteData),
        .o_ReadData(w_FLASH_ReadData),
        .o_ReqNextData(w_FLASH_ReqNextData),
        .o_NewDataAvailableNextClk(w_FLASH_NewDataAvailableNextClk),
        .i_AckReq(r_FLASH_AckReq),
        .o_CMDBusy(w_FLASH_CMDBusy),

        .o_Flash_Clk(o_Flash_Clk),
        .o_Flash_nCS(o_Flash_nCS),
        .io_Flash_IO(io_Flash_IO)
    );

    FlashWriteFIFO FlashWriteFIFO0 (
        .clk(i_Clk),
        .din(r_WRFifo_Din),
        .wr_en(r_WRFifo_WREn),
        .rd_en(r_WRFifo_RDEn),
        .dout(w_WRFifo_DOut),
        .full(w_WRFifo_Full),
        .empty(w_WRFifo_Empty)
    );
endmodule