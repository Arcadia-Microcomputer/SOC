`timescale 1ns / 1ps

module UartBusInterface_tb();
    reg r_Clk = 0;

    //The various register addresses
    parameter p_REG_ADDR_CTRL   = 0;
    parameter p_REG_ADDR_DATA   = 1;

    //Avalon Bus signals
    reg [29:0]r_AV_Addr = 0;
    reg [3:0]r_AV_ByteEn = 0;
    reg r_AV_Read = 0;
    wire [31:0]w_AV_ReadData;
    reg r_AV_Write = 0;
    reg [31:0]r_AV_WriteData = 0;
    wire w_AV_WaitRequest;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        @(posedge r_Clk);
        r_AV_Addr <= p_REG_ADDR_CTRL;
        r_AV_ByteEn <= 4'b1111;
        r_AV_Write <= 1;
        r_AV_WriteData <= {14'b0, 1'b1, 1'b1, 16'd10};
        @(posedge r_Clk);
        r_AV_Addr <= p_REG_ADDR_DATA;
        r_AV_WriteData <= 32'd72;
        @(posedge r_Clk);
        r_AV_Write <= 0;
    end

    UartBusInterface #(
        .NUM_PERIPH_SEL_BITS(5),
        .PERIPH_SEL(0)
    )UartBusInterface0(
        .i_Clk(r_Clk),

        //Avalon RW slave
        .i_AV_Addr(r_AV_Addr),
        .i_AV_ByteEn(r_AV_ByteEn),
        .i_AV_Read(r_AV_Read),
        .o_AV_ReadData(w_AV_ReadData),
        .i_AV_Write(r_AV_Write),
        .i_AV_WriteData(r_AV_WriteData),
        .o_AV_WaitRequest(w_AV_WaitRequest),
        .i_AV_BurstCount(1)
    );

endmodule