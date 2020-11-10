`timescale 1ns / 1ps

module AvalonTestBurstSlave_tb();
    reg r_Clk = 0;

    //Avalon Bus signals
    reg [29:0]r_AV_Addr = 0;
    reg [3:0]r_AV_ByteEn = 0;
    reg r_AV_Read = 0;
    wire [31:0]w_AV_ReadData;
    reg r_AV_Write = 0;
    reg [31:0]r_AV_WriteData = 0;
    wire w_AV_WaitRequest;
    reg [7:0]r_AV_BurstCount = 0;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    reg [31:0]i;

    initial begin
        //Write burst
        @(posedge r_Clk);
        r_AV_Addr <= 0;
        r_AV_ByteEn <= 4'b1111;
        r_AV_Write <= 1;
        r_AV_BurstCount <= 4;

        for(i = 0; i < 3; i = i + 1)begin
            r_AV_WriteData <= i + 1;
            @(posedge r_Clk);
            
            if(i == 1)begin
                r_AV_Write <= 0;
                #80;
                @(posedge r_Clk);
                r_AV_Write <= 1;
            end
        end
        r_AV_WriteData <= i + 1;
        @(negedge w_AV_WaitRequest);
        @(posedge r_Clk);
        r_AV_Write <= 0;
        #100;

        //Read
        @(posedge r_Clk);
        r_AV_Addr <= 0;
        r_AV_Read <= 1;
        r_AV_BurstCount <= 4;
        for(i = 0; i < 4; i = i + 1)begin
            @(posedge r_Clk);    
        end
        @(negedge w_AV_WaitRequest);
        @(posedge r_Clk); 
        r_AV_Read <= 0;
    end

    AvalonTestBurstSlave #(
        .NUM_PERIPH_SEL_BITS(5),
        .PERIPH_SEL_VAL(0),
        .WRITE_WAIT_REQ_CYCLES(2),
        .READ_WAIT_REQ_CYCLES(5)
    )AvalonTestSlave0(
        .i_Clk(r_Clk),

        //Avalon RW slave
        .i_AV_Addr(r_AV_Addr),
        .i_AV_ByteEn(r_AV_ByteEn),
        .i_AV_Read(r_AV_Read),
        .o_AV_ReadData(w_AV_ReadData),
        .i_AV_Write(r_AV_Write),
        .i_AV_WriteData(r_AV_WriteData),
        .o_AV_WaitRequest(w_AV_WaitRequest),
        .i_AV_BurstCount(r_AV_BurstCount)
    );

endmodule