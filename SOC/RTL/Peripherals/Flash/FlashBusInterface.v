`timescale 1ns / 1ps

module FlashBusInterface #(
    parameter MEM_PERIPH_SEL_BITS = 5,
    parameter MEM_PERIPH_SEL_VAL = 0,
    parameter CNTRL_ADDR_SEL_BITS = 5,
    parameter CNTRL_PERIPH_SEL_VAL = 1
    )(
    input i_Clk,

    //Avalon R slave (MEM)
    input [29:0]i_AV_MEM_Addr,
    input i_AV_MEM_Read,
    output reg [31:0]o_AV_MEM_ReadData,
    output o_AV_MEM_WaitRequest,

    //Avalon RW slave (CONTROL)
    input [29:0]i_AV_CNTRL_Addr,
    input [3:0]i_AV_CNTRL_ByteEn,
    input i_AV_CNTRL_Read,
    input i_AV_CNTRL_Write,
    output reg [31:0]o_AV_CNTRL_ReadData,
    input [31:0]i_AV_CNTRL_WriteData,
    output reg o_AV_CNTRL_WaitRequest,

    //Flash Interface
    output o_Flash_Clk,
	output o_Flash_nCS,
	inout [3:0]io_Flash_IO
    );

    initial begin
        o_AV_MEM_ReadData <= 0;

        o_AV_CNTRL_ReadData <= 0;
        o_AV_CNTRL_WaitRequest <= 0;
    end

    //DBUS Signals
    assign w_MEM_SlaveSel = (i_AV_MEM_Addr[29:30-MEM_PERIPH_SEL_BITS] == MEM_PERIPH_SEL_VAL)? 1 : 0;
	wire [29-MEM_PERIPH_SEL_BITS:0]w_MEM_RegAddr = i_AV_MEM_Addr[29-MEM_PERIPH_SEL_BITS:0];

    assign w_CNTRL_SlaveSel = (i_AV_CNTRL_Addr[29:30-CNTRL_ADDR_SEL_BITS] == CNTRL_PERIPH_SEL_VAL)? 1 : 0;
	wire [29-CNTRL_ADDR_SEL_BITS:0]w_CNTRL_RegAddr = i_AV_CNTRL_Addr[29-CNTRL_ADDR_SEL_BITS:0];

    reg r_AV_MEM_WaitRequest = 0;
    assign o_AV_MEM_WaitRequest = w_MEM_SlaveSel? r_AV_MEM_WaitRequest: 0;

    //The various register addresses
    parameter p_REG_ADDR_CNTRL = 0;
    parameter p_REG_ADDR_ADDR  = 1;
    parameter p_REG_ADDR_DATA  = 2;

    //Command interface commands
    parameter COMMAND_WRITE_ENABLE          = 0;
    parameter COMMAND_VOL_SR_WRITE_ENABLE   = 1;
    parameter COMMAND_SECTOR_ERASE_4KB      = 2;
    parameter COMMAND_BLOCK_ERASE_64KB      = 3;
    parameter COMMAND_CHIP_ERASE            = 4;
    parameter COMMAND_PROGRAM_PAGE          = 5;
    parameter COMMAND_READ                  = 6;
    parameter COMMAND_READ_SR               = 7;
    parameter COMMAND_WRITE_SR              = 8;

    //Flash Controller
    reg [23:0]r_FLASH_Addr = 0;
    wire [7:0]w_FLASH_ReadData;
    wire w_FLASH_ReqNextData;
    wire w_FLASH_NewDataAvailableNextClk;
    reg r_FLASH_AckReq = 0;
    wire w_FLASH_CMDBusy;

    //Write Fifo Signals
    reg [7:0]r_WRFifo_WrData = 0;
    reg r_WRFifo_WrEn = 0;
    reg r_WRFifo_RdEn = 0;
    wire [7:0]w_WRFifo_RdData;
    wire w_WRFifo_Full;
    wire w_WRFifo_Empty;
    
    //Addressable Registers
    reg [23:0]r_AReg_Addr = 0;
    reg [3:0]r_AReg_CMD = 0;
    reg [6:0]r_AReg_Count = 0;
    reg r_AReg_CMDEn = 0;
    
    //Memory Mapped Read FSM
    localparam FSM_READ_STATE_SIZE = 2;
    localparam FSM_READ_WAIT = 0,
               FSM_READ_RD = 1,
               FSM_READ_COMPLETE = 2;
    reg [FSM_READ_STATE_SIZE-1:0] FSM_READ_state = 0;

    //Memory Mapped Read Registers
    reg r_MM_isReadTransaction = 0;
    reg [3:0]r_MM_ReadByteCounter = 0;
    reg [31:0]r_MM_ReadData = 0;
    reg [23:0]r_MM_Addr = 0;
    reg r_MM_CMDEn = 0;

    //Write transaction registers
    reg r_isWriteTransaction = 0;

    always @(posedge i_Clk)begin
        o_AV_MEM_ReadData <= 0;
        r_AV_MEM_WaitRequest <= 1;

        o_AV_CNTRL_ReadData <= 0;
        o_AV_CNTRL_WaitRequest <= 0;

        r_MM_CMDEn <= 0;

        r_WRFifo_WrEn <= 0;
        r_WRFifo_RdEn <= 0;
        r_AReg_CMDEn <= 0;

        // (MEM) FSM to read data from flash
        if(r_MM_isReadTransaction)begin
            case (FSM_READ_state)
                FSM_READ_WAIT:begin
                    if(w_FLASH_NewDataAvailableNextClk)begin
                        r_MM_ReadByteCounter <= r_MM_ReadByteCounter - 1;
                        FSM_READ_state <= FSM_READ_RD;
                    end
                end
                FSM_READ_RD:begin
                    if(r_MM_ReadByteCounter == 1)begin
                        r_FLASH_AckReq <= 0;
                    end

                    case (r_MM_ReadByteCounter[1:0])
                        3:r_MM_ReadData[7:0] <= w_FLASH_ReadData;
                        2:r_MM_ReadData[15:8] <= w_FLASH_ReadData;
                        1:r_MM_ReadData[23:16] <= w_FLASH_ReadData;
                        0:r_MM_ReadData[31:24] <= w_FLASH_ReadData;
                    endcase

                    if(r_MM_ReadByteCounter == 0)begin
                        r_AV_MEM_WaitRequest <= 0;
                        FSM_READ_state <= FSM_READ_COMPLETE;
                    end else begin
                        FSM_READ_state <= FSM_READ_WAIT;
                    end
                end
                FSM_READ_COMPLETE:begin
                    o_AV_MEM_ReadData[31:0] <= r_MM_ReadData;
                    
                    r_MM_isReadTransaction <= 0;
                    FSM_READ_state <= FSM_READ_WAIT;
                end
            endcase
        end else begin
            //Read transaction
            if(i_AV_MEM_Read)begin
                r_MM_isReadTransaction <= 1;
                r_MM_ReadByteCounter <= 4;
                r_MM_ReadData <= 0;
                r_MM_Addr <= {w_MEM_RegAddr[21:0], 2'b0};
                r_MM_CMDEn <= 1;
                r_FLASH_AckReq <= 1;
            end
        end

        if (w_CNTRL_SlaveSel) begin
            //Write transaction
            if(i_AV_CNTRL_Write)begin
                case (w_CNTRL_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        if(i_AV_CNTRL_ByteEn[0])begin
                            r_AReg_CMD <= i_AV_CNTRL_WriteData[3:0];
                        end

                        if(i_AV_CNTRL_ByteEn[1])begin
                            r_AReg_CMDEn <= i_AV_CNTRL_WriteData[8];
                            r_FLASH_Addr <= r_AReg_Addr;

                            //Check to see if a write command needs to be issued
                            if(i_AV_CNTRL_ByteEn[0])begin
                                //Command is getting updated as well so use latest data
                                if(i_AV_CNTRL_WriteData[8] && (i_AV_CNTRL_WriteData[3:0] == COMMAND_PROGRAM_PAGE))begin
                                    r_isWriteTransaction <= 1;
                                    r_WRFifo_RdEn <= 1; 
                                end
                            end else begin
                                //Command isn't getting updated so use stored command
                                if(i_AV_CNTRL_WriteData[8] && (r_AReg_CMD == COMMAND_PROGRAM_PAGE))begin
                                    r_isWriteTransaction <= 1;
                                    r_WRFifo_RdEn <= 1; 
                                end
                            end
                        end

                        if(i_AV_CNTRL_ByteEn[2])begin
                            r_AReg_Count <= i_AV_CNTRL_WriteData[22:16];
                        end
                    end
                    p_REG_ADDR_ADDR:begin
                        if(i_AV_CNTRL_ByteEn[0]) r_AReg_Addr[7:0]   <= i_AV_CNTRL_WriteData[7:0];
                        if(i_AV_CNTRL_ByteEn[1]) r_AReg_Addr[15:8]  <= i_AV_CNTRL_WriteData[15:8];
                        if(i_AV_CNTRL_ByteEn[2]) r_AReg_Addr[23:16] <= i_AV_CNTRL_WriteData[23:16];
                    end
                    p_REG_ADDR_DATA:begin
                        if(i_AV_CNTRL_ByteEn[0])begin
                            r_WRFifo_WrEn <= 1;
                            r_WRFifo_WrData <= i_AV_CNTRL_WriteData[7:0];
                        end
                    end
                endcase 
            end
            
            //Read transaction
            if(i_AV_CNTRL_Read)begin
                case (w_CNTRL_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        o_AV_CNTRL_ReadData <= {9'b0, r_AReg_Count, 4'b0, w_WRFifo_Empty, w_WRFifo_Full, w_FLASH_CMDBusy, r_AReg_CMDEn, 4'b0, r_AReg_CMD};
                    end
                    p_REG_ADDR_ADDR:begin
                        o_AV_CNTRL_ReadData <= {8'b0, r_AReg_Addr};
                    end
                    p_REG_ADDR_DATA:begin
                        o_AV_CNTRL_ReadData <= {24'b0, w_FLASH_ReadData};
                    end
                    default:begin
                        o_AV_CNTRL_ReadData <= 0;
                    end
                endcase 
            end
        end

        if(r_isWriteTransaction)begin
            r_FLASH_AckReq <= 1;

            //Check to see if the flash controller wants new data to write
            //Have 2 cycles to deal with the request 
            if(w_FLASH_ReqNextData)begin
                if((r_AReg_Count == 1) || w_WRFifo_Empty)begin
                    //If the specified number of bytes are written, end transaction
                    r_isWriteTransaction <= 0;
                    r_FLASH_AckReq <= 0;
                end else begin
                    r_WRFifo_RdEn <= 1;
                    r_AReg_Count <= r_AReg_Count - 1;
                end
            end
        end
    end

    FlashControler FlashControler0(
        .i_Clk(i_Clk),

        .i_CMDEn(r_MM_isReadTransaction? r_MM_CMDEn :r_AReg_CMDEn),
        .i_CMD(r_MM_isReadTransaction? COMMAND_READ : r_AReg_CMD),
        .i_Addr(r_MM_isReadTransaction? r_MM_Addr : r_FLASH_Addr),

        .i_WriteData(w_WRFifo_RdData),
        .o_ReadData(w_FLASH_ReadData),
        .o_ReqNextData(w_FLASH_ReqNextData),
        .o_NewDataAvailableNextClk(w_FLASH_NewDataAvailableNextClk),
        .i_AckReq(r_FLASH_AckReq),
        .o_CMDBusy(w_FLASH_CMDBusy),

        .o_Flash_Clk(o_Flash_Clk),
        .o_Flash_nCS(o_Flash_nCS),
        .io_Flash_IO(io_Flash_IO)
    );

    FIFO #(
        .FWFT("FALSE"),
        .WIDTH(8),
        .DEPTH(64)
    )WrFIFO (
        .i_Clk(i_Clk),

        .i_WrEn(r_WRFifo_WrEn),
        .i_WrData(r_WRFifo_WrData),

        .i_RdEn(r_WRFifo_RdEn),
        .o_RdData(w_WRFifo_RdData),

        .o_Full(w_WRFifo_Full),
        .o_Empty(w_WRFifo_Empty)
    );
endmodule