`timescale 1ns / 1ps

module FlashControler(
    input i_Clk,

    //Control Interface
    input i_CMDEn,
    input [2:0]i_CMD,
    input [23:0]i_Addr,
    input [7:0]i_WriteData,
    output reg [7:0]o_ReadData,
    output reg o_ReqNextData,
    output reg o_NewDataAvailableNextClk,
    input i_AckReq,
    output o_CMDBusy,

    //Flash IO
    output o_Flash_Clk,
    output reg o_Flash_nCS,
    inout [3:0]io_Flash_IO
    );
    
    initial begin
        o_ReadData = 0;
        o_NewDataAvailableNextClk = 0;
        o_ReqNextData = 0;
        o_Flash_nCS = 1;
    end

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

    //Flash commands
    parameter FLASH_WRITE_ENABLE             = 8'h06;
    parameter FLASH_VOLATILE_SR_WRITE_ENABLE = 8'h50;
    parameter FLASH_WRITE_DISABLE            = 8'h04;
    parameter FLASH_READ_DATA                = 8'h03;
    parameter FLASH_PAGE_PROGRAM             = 8'h02;
    parameter FLASH_SECTOR_ERASE_4KB         = 8'h20;
    parameter FLASH_BLOCK_ERASE_32KB         = 8'h52;
    parameter FLASH_BLOCK_ERASE_64KB         = 8'hD8;
    parameter FLASH_CHIP_ERASE               = 8'hC7;
    parameter FLASH_READ_STATUS_REG_1        = 8'h05;
    parameter FLASH_WRITE_STATUS_REG_1       = 8'h01;
    parameter FLASH_READ_STATUS_REG_2        = 8'h35;
    parameter FLASH_WRITE_STATUS_REG_2       = 8'h31;
    parameter FLASH_READ_STATUS_REG_3        = 8'h15;
    parameter FLASH_WRITE_STATUS_REG_3      = 8'h11;

    reg [3:0]r_Flash_IO_SelectOutput = 0;
    reg [3:0]r_Flash_O = 0;
    assign io_Flash_IO[3] = r_Flash_IO_SelectOutput[3]? r_Flash_O[3]: 1'b1;
    assign io_Flash_IO[2] = r_Flash_IO_SelectOutput[2]? r_Flash_O[2]: 1'b1;
    assign io_Flash_IO[1] = r_Flash_IO_SelectOutput[1]? r_Flash_O[1]: 1'b1;
    assign io_Flash_IO[0] = r_Flash_IO_SelectOutput[0]? r_Flash_O[0]: 1'b1;

    //Command interface state machine
    localparam FSM_STATE_SIZE = 2;
    localparam FSM_WAIT = 0,
               FSM_TX = 1,
               FSM_RX = 2;
    reg [FSM_STATE_SIZE-1:0] FSM_state = FSM_WAIT;

    reg r_SendAddress = 0;
    reg [7:0]r_TmpByte = 0;
    reg [2:0]r_BitCounter = 0;
    reg [1:0]r_AddressByteCounter = 0;
    reg r_NumBytesHostDependant = 0;
    reg r_EnClk = 0;
    reg r_ReceiveTrue = 0;
    reg [2:0]r_WaitRead = 0;
    reg r_ClearCMDBusy = 0;

    ODDR2 #(
        .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
        .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
        .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
    ) ODDR2_FlashClkOut (
        .R(1'b0),
        .Q(o_Flash_Clk),        // 1-bit DDR output data
        .C0(i_Clk),    // 1-bit clock input
        .C1(!i_Clk),   // 1-bit clock input
        .CE(r_EnClk),    // 1-bit clock enable input
        .D0(1'b0),  // 1-bit data input (associated with C0)
        .D1(1'b1)   // 1-bit data input (associated with C1)
    );

    reg r_CMDBusy = 0;
    assign o_CMDBusy = i_CMDEn? 1'b1: r_CMDBusy;

    always @(posedge i_Clk) begin
        case (FSM_state)
            FSM_WAIT:begin
                o_Flash_nCS <= 1;
                r_EnClk <= 0;
                r_Flash_IO_SelectOutput <= 0;
                o_NewDataAvailableNextClk <= 0;
                r_CMDBusy <= 0;

                //Check to see if there is a new command to execute
                if(i_CMDEn)begin
                    o_Flash_nCS <= 0;
                    FSM_state <= FSM_TX;
                    r_NumBytesHostDependant <= 0;
                    r_ReceiveTrue <= 0;
                    r_CMDBusy <= 1;
                    
                    case (i_CMD)
                        COMMAND_WRITE_ENABLE:begin
                            r_TmpByte <= FLASH_WRITE_ENABLE;

                            //Set the nWP Pin to 1
                            r_Flash_IO_SelectOutput[2] <= 1;
                            r_Flash_O[2] <= 1;
                        end
                        COMMAND_VOL_SR_WRITE_ENABLE:begin
                            r_TmpByte <= FLASH_VOLATILE_SR_WRITE_ENABLE;

                            //Set the nWP Pin to 1
                            r_Flash_IO_SelectOutput[2] <= 1;
                            r_Flash_O[2] <= 1;
                        end
                        COMMAND_SECTOR_ERASE_4KB:begin
                            r_TmpByte <= FLASH_SECTOR_ERASE_4KB;

                            //Send the given address after the command byte is sent
                            r_SendAddress <= 1;
                        end
                        COMMAND_BLOCK_ERASE_64KB:begin
                            r_TmpByte <= FLASH_BLOCK_ERASE_64KB;

                            //Send the given address after the command byte is sent
                            r_SendAddress <= 1;
                        end
                        COMMAND_CHIP_ERASE:begin
                            r_TmpByte <= FLASH_CHIP_ERASE;
                        end
                        COMMAND_PROGRAM_PAGE:begin
                            //Idicating it depends on how many bytes the host wants to write
                            r_NumBytesHostDependant <= 1;

                            //Send the given address after the command byte is sent
                            r_SendAddress <= 1;
                            r_TmpByte <= FLASH_PAGE_PROGRAM;
                        end
                        COMMAND_READ:begin
                            //Idicating it depends on how many bytes the host wants to read
                            r_NumBytesHostDependant <= 1;

                            //Send the given address after the command byte is sent
                            r_SendAddress <= 1;
                            r_TmpByte <= FLASH_READ_DATA;

                            r_ReceiveTrue <= 1;
                            r_WaitRead <= 1;
                        end
                        COMMAND_READ_SR:begin
                            case (i_Addr)
                                1:r_TmpByte <= FLASH_READ_STATUS_REG_1;
                                2:r_TmpByte <= FLASH_READ_STATUS_REG_2;
                                3:r_TmpByte <= FLASH_READ_STATUS_REG_3;
                            endcase
                            r_ReceiveTrue <= 1;
                            r_WaitRead <= 1;
                        end
                        COMMAND_WRITE_SR:begin
                            case (i_Addr)
                                1:r_TmpByte <= FLASH_WRITE_STATUS_REG_1;
                                2:r_TmpByte <= FLASH_WRITE_STATUS_REG_2;
                                3:r_TmpByte <= FLASH_WRITE_STATUS_REG_3;
                            endcase

                            r_NumBytesHostDependant <= 1;
                        end
                    endcase 
                end
            end
            FSM_TX:begin
                r_EnClk <= 1;
                o_ReqNextData <= 0;

                //Set the DO pin to an output
                r_Flash_IO_SelectOutput[0] <= 1;

                //Output the byte MSB first
                r_Flash_O[0] <= r_TmpByte[7-r_BitCounter];

                r_BitCounter <= r_BitCounter + 1;
                
                //Take care of generating the request new data signal 
                if((r_BitCounter == 1) && !r_SendAddress && !r_ReceiveTrue && r_NumBytesHostDependant)begin
                    o_ReqNextData <= 1;
                end

                //Check to see if at the end of sending a byte
                if(r_BitCounter == 7)begin
                    r_BitCounter <= 0;

                    //Check to see if the address needs sending
                    if(r_SendAddress)begin
                    
                        r_AddressByteCounter <= r_AddressByteCounter + 1;
                        
                        case (r_AddressByteCounter)
                            0:r_TmpByte <= i_Addr[23:16];
                            1:r_TmpByte <= i_Addr[15:8];
                            2:r_TmpByte <= i_Addr[7:0];
                        endcase

                        //Check to see if the address has been sent
                        if(r_AddressByteCounter == 3)begin
                            r_SendAddress <= 0;
                            r_AddressByteCounter <= 0;

                            //Check to see if data needs sendng
                            if(r_NumBytesHostDependant && i_AckReq && !r_ReceiveTrue)begin
                                r_TmpByte <= i_WriteData;
                            end else begin
                                //TX section is done so jump to the next state
                                if(r_ReceiveTrue)begin
                                    FSM_state <= FSM_RX;
                                end else begin
                                    FSM_state <= FSM_WAIT;
                                end
                            end
                        end
                    end else if(r_NumBytesHostDependant && i_AckReq && !r_ReceiveTrue)begin 
                        //Send the next byte
                        r_TmpByte <= i_WriteData;
                    end else begin
                        //TX section is done so jump to the next state
                        if(r_ReceiveTrue)begin
                            FSM_state <= FSM_RX;
                        end else begin
                            FSM_state <= FSM_WAIT;
                        end
                    end
                end
            end
            FSM_RX:begin
                r_EnClk <= 1;
                o_NewDataAvailableNextClk <= 0;
                r_Flash_IO_SelectOutput[0] <= 0;

                //Take care of generating the new data available signal 
                if((r_BitCounter == 6) && r_NumBytesHostDependant)begin
                    o_NewDataAvailableNextClk <= 1;
                end

                //Wait for the specified number of cycles before starting to read
                if(r_WaitRead != 0)begin
                    r_WaitRead <= r_WaitRead - 1;
                end else begin
                    //Read in the byte, msb first
                    r_TmpByte[7-r_BitCounter] <= io_Flash_IO[1];
                    r_BitCounter <= r_BitCounter + 1;

                    //If a full byte has been received
                    if(r_BitCounter == 7)begin
                        r_BitCounter <= 0;

                        o_ReadData <= {r_TmpByte[7:1], io_Flash_IO[1]};

                        //Check to see if more data needs receiving
                        if(!(i_AckReq && r_NumBytesHostDependant))begin
                            r_EnClk <= 0;
                            FSM_state <= FSM_WAIT;
                        end
                    end 
                end
            end
        endcase
    end

endmodule
