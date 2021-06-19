`timescale 1ns / 1ps

module InputDecoder_tb();
    reg r_Clk = 0;

    reg [29:0]r_AV_Addr = 0;
    reg r_AV_Read = 0;
    reg r_AV_Write = 0;
    reg r_AV_WaitRequest = 0;
    reg [7:0]r_AV_BurstCount = 0;

    wire [4:0]w_Req;
    wire [4:0]w_NewTransaction;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        //Transaction 1
        @(posedge r_Clk);
        r_AV_Addr <= 0;
        r_AV_Read <= 1;
        r_AV_WaitRequest <= 1;
        r_AV_BurstCount <= 2;
        @(posedge r_Clk);
        r_AV_WaitRequest <= 0;
        @(posedge r_Clk);
        @(posedge r_Clk);
        r_AV_Read <= 0;
        
        //Transaction 2
        r_AV_Write <= 1;
        r_AV_BurstCount <= 2;
        @(posedge r_Clk);
        @(posedge r_Clk);
        r_AV_Write <= 0;
    end
    
    InputDecoder #(
        .ADDR_SEL_BITS_O0(5),
        .ADDR_SEL_O0(0),
        .ADDR_SEL_BITS_O1(5),
        .ADDR_SEL_O1(1),
        .ADDR_SEL_BITS_O2(5),
        .ADDR_SEL_O2(2),
        .ADDR_SEL_BITS_O3(5),
        .ADDR_SEL_O3(3),
        .ADDR_SEL_BITS_O4(5),
        .ADDR_SEL_O4(4)
    )DUT(
        .i_Clk(r_Clk),

        .i_AV_Addr(r_AV_Addr),
        .i_AV_Read(r_AV_Read),
        .i_AV_Write(r_AV_Write),
        .i_AV_WaitRequest(r_AV_WaitRequest),
        .i_AV_BurstCount(r_AV_BurstCount),

        .o_Out_Req(w_Req),
        .o_Out_NewTransaction(w_NewTransaction)
    );
endmodule