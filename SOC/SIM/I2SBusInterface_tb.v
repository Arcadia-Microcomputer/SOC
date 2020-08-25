`timescale 1ns / 1ps

module I2SBusInterface_tb();
    reg r_Clk = 0;
    reg r_Audio_Clk = 0;

    //I2S Signals
    wire w_SDIN;
    wire w_SCLK;
    wire w_LRCK;
    wire w_MCLK;

    //Avalon Bus Sim
    reg r_SlaveSel = 0;
    reg [(29-4):0]r_RegAddr = 0;

    reg [3:0]r_AV_ByteEN = 0;
    reg r_AV_Read = 0;
    reg r_AV_Write = 0;
    wire [31:0]w_AV_ReadData;
    reg [31:0]r_AV_WriteData = 0;
    wire w_AV_WaitRequest;

    //The various I2S pheriph register addresses
    parameter p_REG_ADDR_DATA  = 0;
    parameter p_REG_ADDR_CNTRL = 1;

    //Generate the main clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    //Generate the audio clock
    initial begin
        #10;
        forever #59 r_Audio_Clk = ~r_Audio_Clk;
    end

    reg [7:0]r_TestData = 0;
    reg r_FifoFullCheck = 0;

    initial begin
        #100;
        r_AV_ByteEN <= 4'b1111;
        while (1) begin
            r_FifoFullCheck <= 1;
            r_AV_Write <= 0;

            @(posedge r_Clk);
            while(r_FifoFullCheck)begin
                //Read the CNTRL reg
                @(posedge r_Clk);
                r_SlaveSel <= 1;
                r_AV_Read <= 1;
                r_RegAddr <= p_REG_ADDR_CNTRL;

                @(posedge r_Clk);
                r_AV_Read <= 0;

                //Check to see if the fifo full flag is set
                @(posedge r_Clk);
                r_FifoFullCheck <= w_AV_ReadData[0];

                @(posedge r_Clk);
            end
            
            //Write I2S data
            @(posedge r_Clk);
            r_SlaveSel <= 1;
            r_AV_Write <= 1;
            r_RegAddr <= p_REG_ADDR_DATA;
            r_AV_WriteData <= {8'b0, r_TestData, 8'b0, r_TestData};
            r_TestData <= r_TestData + 1;

            @(posedge r_Clk);
        end
        

    end

    I2SBusInterface #(
        .ADDR_SEL_BITS(4)
    )DUT(
        .i_Clk(r_Clk),

        .i_SlaveSel(r_SlaveSel),
        .i_RegAddr(r_RegAddr),

        .i_AV_ByteEn(r_AV_ByteEN),
        .i_AV_Read(r_AV_Read),
        .i_AV_Write(r_AV_Write),
        .o_AV_ReadData(w_AV_ReadData),
        .i_AV_WriteData(r_AV_WriteData),
        .o_AV_WaitRequest(w_AV_WaitRequest),

        .i_Audio_Clk(r_Audio_Clk),
        .o_I2S0_SDIN(w_SDIN),
        .o_I2S0_SCLK(w_SCLK),
        .o_I2S0_LRCK(w_LRCK),
        .o_I2S0_MCLK(w_MCLK)
    );

endmodule
