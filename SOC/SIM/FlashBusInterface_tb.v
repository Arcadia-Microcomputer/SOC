`timescale 1ns / 1ps

module FlashBusInterface_tb();
    reg r_Clk = 0;
    
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

    //Flash Signals
    wire w_Flash_nCS;
    wire w_Flash_Clk;
    wire [3:0]w_Flash_IO;

    //Avalon Bus Sim
    reg r_MEM_SlaveSel = 0;
    reg [25:0]r_MEM_RegAddr = 0;

    reg r_CNTRL_SlaveSel = 0;
    reg [25:0]r_CNTRL_RegAddr = 0;

    reg [3:0]r_AV_ByteEN = 0;
    reg r_AV_Read = 0;
    reg r_AV_Write = 0;
    wire [31:0]w_AV_ReadData;
    reg [31:0]r_AV_WriteData = 0;
    wire w_AV_WaitRequest;

    //The various FlashController register addresses
    parameter p_REG_ADDR_CNTRL = 0;
    parameter p_REG_ADDR_ADDR  = 1;
    parameter p_REG_ADDR_DATA  = 2;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end
    
    reg [7:0]r_Counter = 0;
    reg [31:0]r_RDData = 0;

    initial begin
        #100;
        //Write Enable
        @(posedge r_Clk);
        r_CNTRL_SlaveSel <= 1;
        r_AV_ByteEN <= 4'b1111;
        r_AV_Write <= 1;
        r_AV_WriteData[3:0] <= COMMAND_WRITE_ENABLE;
        r_AV_WriteData[8] <= 1;
        r_CNTRL_RegAddr <= p_REG_ADDR_CNTRL;

        //Set the address
        @(posedge r_Clk);
        r_CNTRL_SlaveSel <= 1;
        r_AV_ByteEN <= 4'b1111;
        r_AV_Write <= 1;
        r_AV_WriteData <= 0;
        r_CNTRL_RegAddr <= p_REG_ADDR_ADDR;

        //Write 4 words to the fifo
        while(r_Counter < 3)begin
            @(posedge r_Clk);
            r_CNTRL_SlaveSel <= 1;
            r_AV_ByteEN <= 4'b0001;
            r_AV_Write <= 1;
            case (r_Counter)
                0:r_AV_WriteData <= 32'h00000012;
                1:r_AV_WriteData <= 32'h000000EF;
                2:r_AV_WriteData <= 32'h000000CD;
                3:r_AV_WriteData <= 32'h000000AB;
            endcase
            
            r_CNTRL_RegAddr <= p_REG_ADDR_DATA;
            r_Counter <= r_Counter + 1;
        end
        @(posedge r_Clk);
        r_AV_Write <= 0;

        //Program Page
        #400;
        @(posedge r_Clk);
        r_CNTRL_SlaveSel <= 1;
        r_AV_ByteEN <= 4'b1111;
        r_AV_Write <= 1;
        r_AV_WriteData[3:0] <= COMMAND_PROGRAM_PAGE;
        r_AV_WriteData[22:16] <= 4;
        r_AV_WriteData[8] <= 1;
        r_CNTRL_RegAddr <= p_REG_ADDR_CNTRL;
        
        @(posedge r_Clk);
        r_AV_Write <= 0;
    end

    FlashBusInterface #(
        .MEM_ADDR_SEL_BITS(4),
        .CNTRL_ADDR_SEL_BITS(4)
    )DUT(
        .i_Clk(r_Clk),
        
        .i_MEM_SlaveSel(r_MEM_SlaveSel),
        .i_MEM_RegAddr(r_MEM_RegAddr),

        .i_CNTRL_SlaveSel(r_CNTRL_SlaveSel),
        .i_CNTRL_RegAddr(r_CNTRL_RegAddr),

        .i_AV_ByteEn(r_AV_ByteEN),
        .i_AV_Read(r_AV_Read),
        .i_AV_Write(r_AV_Write),
        .o_AV_ReadData(w_AV_ReadData),
        .i_AV_WriteData(r_AV_WriteData),
        .o_AV_WaitRequest(w_AV_WaitRequest),

        .o_Flash_Clk(w_Flash_Clk),
        .o_Flash_nCS(w_Flash_nCS),
        .io_Flash_IO(w_Flash_IO)
    );

    W25Q16JV W25Q16JV_0(
        .CSn(w_Flash_nCS),
        .CLK(w_Flash_Clk),

        .DIO(w_Flash_IO[0]),
        .DO(w_Flash_IO[1]),
        .WPn(w_Flash_IO[2]),
        .HOLDn(w_Flash_IO[3])
    );
endmodule
