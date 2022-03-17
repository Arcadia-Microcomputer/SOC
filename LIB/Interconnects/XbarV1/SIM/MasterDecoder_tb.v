`timescale 1ns / 1ps

module MasterDecoder_tb();
    reg r_Clk = 0;
    
    //Avalon Master Bus 0 signals
    reg [29:0]r_AV_M0_Addr = 0;
    reg r_AV_M0_Read = 0;
    reg r_AV_M0_Write = 0;
    reg w_AV_M0_WaitRequest = 0;
    
    wire [1:0]w_Req;
    wire [1:0]w_Lock;
    reg [1:0]r_Gnt = 0;

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end

    initial begin
        //Master 0
        @(posedge r_Clk);
        r_AV_M0_Addr <= 30'h20000000;
        r_AV_M0_Write <= 1;
        w_AV_M0_WaitRequest <= 1;
        @(posedge r_Gnt[1]);
        @(posedge r_Clk);
        w_AV_M0_WaitRequest <= 0;
        @(posedge r_Clk);
        r_AV_M0_Write <= 0;
    end

    // Slave 0
    initial begin
      r_Gnt[0] <= 0;

      @(posedge w_Req[0]);
      #60;
      r_Gnt[0] <= 1;
      @(negedge w_Req[0]);
      r_Gnt[0] <= 0;
    end

    // Slave 1
    initial begin
      r_Gnt[1] <= 0;

      @(posedge w_Req[1]);
      #60;
      r_Gnt[1] <= 1;
      @(negedge w_Req[1]);
      r_Gnt[1] <= 0;
    end

    MasterDecoder #(
        .NUM_SLAVES(2),
        .SEL_NUM_BITS({5'd1, 5'd1}),
        .SEL_VAL({30'd1, 30'd0})
    )MasterDecoder0(
        .i_Clk(r_Clk),
        
        .o_Req(w_Req),
        .o_Lock(w_Lock),
        .i_Gnt(r_Gnt),

        .i_AVIn_Addr(r_AV_M0_Addr),
        .i_AVIn_Read(r_AV_M0_Read),
        .i_AVIn_Write(r_AV_M0_Write),
        .o_AVIn_WaitRequest(w_AV_M0_WaitRequest)
    );

endmodule