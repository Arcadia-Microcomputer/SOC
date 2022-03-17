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

    //Avalon Bus (MEM)
    reg [29:0]r_AV_MEM_Addr = 32'h0;
    reg r_AV_MEM_Read = 0;
    wire [31:0]w_AV_MEM_ReadData;
    wire w_AV_MEM_WaitRequest;

    //Avalon Bus (CONTROL)
    reg [29:0]r_AV_CNTRL_Addr = 32'h80000000;
    reg [3:0]r_AV_CNTRL_ByteEN = 0;
    reg r_AV_CNTRL_Read = 0;
    reg r_AV_CNTRL_Write = 0;
    wire [31:0]w_AV_CNTRL_ReadData;
    reg [31:0]r_AV_CNTRL_WriteData = 0;
    wire w_AV_CNTRL_WaitRequest;

    //The various FlashController register addresses
    parameter p_REG_ADDR_CNTRL = 0;
    parameter p_REG_ADDR_ADDR  = 1;
    parameter p_REG_ADDR_DATA  = 2;

    reg [3:0]r_Counter = 0;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        #100;
        //Write Enable
        @(posedge r_Clk);
        r_AV_CNTRL_ByteEN <= 4'b1111;
        r_AV_CNTRL_Write <= 1;
        r_AV_CNTRL_WriteData[3:0] <= COMMAND_WRITE_ENABLE;
        r_AV_CNTRL_WriteData[8] <= 1;
        r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_CNTRL;

        @(posedge r_Clk);
        r_AV_CNTRL_Write <= 0;

        #1000;
        //Set address (SR1)
        @(posedge r_Clk);
        r_AV_CNTRL_ByteEN <= 4'b1111;
        r_AV_CNTRL_Write <= 1;
        r_AV_CNTRL_WriteData[31:0] <= 1;
        r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_ADDR;

        //Read status reg
        @(posedge r_Clk);
        r_AV_CNTRL_ByteEN <= 4'b1111;
        r_AV_CNTRL_Write <= 1;
        r_AV_CNTRL_WriteData[3:0] <= COMMAND_READ_SR;
        r_AV_CNTRL_WriteData[8] <= 1;
        r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_CNTRL;

        @(posedge r_Clk);
        r_AV_CNTRL_Write <= 0;

        // #100;
        // //Write Enable
        // @(posedge r_Clk);
        // r_AV_CNTRL_ByteEN <= 4'b1111;
        // r_AV_CNTRL_Write <= 1;
        // r_AV_CNTRL_WriteData[3:0] <= COMMAND_WRITE_ENABLE;
        // r_AV_CNTRL_WriteData[8] <= 1;
        // r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_CNTRL;

        // @(posedge r_Clk);
        // r_AV_CNTRL_Write <= 0;
        // #400;

        // //Chip Erase
        // @(posedge r_Clk);
        // r_AV_CNTRL_ByteEN <= 4'b1111;
        // r_AV_CNTRL_Write <= 1;
        // r_AV_CNTRL_WriteData[3:0] <= COMMAND_CHIP_ERASE;
        // r_AV_CNTRL_WriteData[8] <= 1;
        // r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_CNTRL;

        // @(posedge r_Clk);
        // r_AV_CNTRL_Write <= 0;

        // #100;
        // //Write Enable
        // @(posedge r_Clk);
        // r_AV_CNTRL_ByteEN <= 4'b1111;
        // r_AV_CNTRL_Write <= 1;
        // r_AV_CNTRL_WriteData[3:0] <= COMMAND_WRITE_ENABLE;
        // r_AV_CNTRL_WriteData[8] <= 1;
        // r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_CNTRL;

        // //Set the address
        // @(posedge r_Clk);
        // r_AV_CNTRL_ByteEN <= 4'b1111;
        // r_AV_CNTRL_Write <= 1;
        // r_AV_CNTRL_WriteData <= 0;
        // r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_ADDR;

        // //Write 4 words to the fifo
        // while(r_Counter < 3)begin
        //     @(posedge r_Clk);
        //     r_AV_CNTRL_ByteEN <= 4'b0001;
        //     r_AV_CNTRL_Write <= 1;
        //     r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_DATA;

        //     case (r_Counter)
        //         0:r_AV_CNTRL_WriteData <= 32'h00000001;
        //         1:r_AV_CNTRL_WriteData <= 32'h00000002;
        //         2:r_AV_CNTRL_WriteData <= 32'h00000003;
        //         3:r_AV_CNTRL_WriteData <= 32'h00000004;
        //     endcase
            
        //     r_Counter <= r_Counter + 1;
        // end
        // @(posedge r_Clk);
        // r_AV_CNTRL_Write <= 0;

        // //Program Page
        // #400;
        // @(posedge r_Clk);
        // r_AV_CNTRL_ByteEN <= 4'b1111;
        // r_AV_CNTRL_Write <= 1;
        // r_AV_CNTRL_WriteData[3:0] <= COMMAND_PROGRAM_PAGE;
        // r_AV_CNTRL_WriteData[22:16] <= 4;
        // r_AV_CNTRL_WriteData[8] <= 1;
        // r_AV_CNTRL_Addr <= 32'h20000000 + p_REG_ADDR_CNTRL;
        
        // @(posedge r_Clk);
        // r_AV_CNTRL_Write <= 0;
    end

    initial begin
        // #50;
        // @(posedge r_Clk);
        // r_AV_MEM_Addr <= 0;
        // r_AV_MEM_Read <= 1;
        // @(negedge w_AV_MEM_WaitRequest);
        // @(posedge r_Clk);
        // r_AV_MEM_Read <= 0;
    end

    FlashBusInterface #(
        .MEM_PERIPH_SEL_BITS(1),
        .MEM_PERIPH_SEL_VAL(0),
        .CNTRL_ADDR_SEL_BITS(1),
        .CNTRL_PERIPH_SEL_VAL(1)
    )DUT(
        .i_Clk(r_Clk),
        
        .i_AV_MEM_Addr(r_AV_MEM_Addr),
        .i_AV_MEM_Read(r_AV_MEM_Read),
        .o_AV_MEM_ReadData(w_AV_MEM_ReadData),
        .o_AV_MEM_WaitRequest(w_AV_MEM_WaitRequest),

        .i_AV_CNTRL_Addr(r_AV_CNTRL_Addr),
        .i_AV_CNTRL_ByteEn(r_AV_CNTRL_ByteEN),
        .i_AV_CNTRL_Read(r_AV_CNTRL_Read),
        .i_AV_CNTRL_Write(r_AV_CNTRL_Write),
        .o_AV_CNTRL_ReadData(w_AV_CNTRL_ReadData),
        .i_AV_CNTRL_WriteData(r_AV_CNTRL_WriteData),
        .o_AV_CNTRL_WaitRequest(w_AV_CNTRL_WaitRequest),

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
