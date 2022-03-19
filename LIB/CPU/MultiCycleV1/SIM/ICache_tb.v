`timescale 1ns / 1ps

module iCache_tb();
  reg r_Clk = 0;
  reg r_Rst = 0;

  // DUT signals
  reg r_RdEn = 0;
  reg [31:0] r_Addr = 0;

  wire w_Stall;
  wire [31:0] w_RdData;

  // IBus signals
  wire [31:0] w_IBus_Address;
  wire w_IBus_Read;
  reg [31:0]r_IBus_ReadData = 'hFFFFFFFF;
  reg r_IBus_WaitReq = 0;

  //Generate the clock
  initial begin
      #10;
      forever #10 r_Clk = ~r_Clk;
  end

  initial begin
    // Reset generation
    #20;
    @(posedge r_Clk);
    r_Rst = 1;
    #30;
    @(posedge r_Clk);
    r_Rst = 0;
    @(posedge r_Clk);

    // Test read (No wait req)
    @(posedge r_Clk);
    r_RdEn = 1;
    r_Addr = 4;
    @(posedge r_Clk);
    r_RdEn = 0;

    #50;

    // Test read (Wait req)  
    @(posedge r_Clk);
    r_RdEn = 1;
    r_Addr = 8;
    @(posedge r_Clk);
    r_RdEn = 0;
    
  end

  ICache DUT(
    .i_Clk(r_Clk),
    .i_Rst(r_Rst),

    .i_RdEn(r_RdEn),
    .i_Addr(r_Addr),
    .o_Stall(w_Stall),
    .o_RdData(w_RdData),

    .o_IBus_Address(w_IBus_Address),
    .o_IBus_Read(w_IBus_Read),
    .i_IBus_ReadData(r_IBus_ReadData),
    .i_IBus_WaitReq(r_IBus_WaitReq)
  );

  initial begin
    // First read (No stall)
    @(posedge w_IBus_Read);
    r_IBus_WaitReq <= 0;
    @(posedge r_Clk);
    r_IBus_ReadData <= w_IBus_Address;
    @(posedge r_Clk);
    r_IBus_ReadData <= 'hFFFFFFFF;

    // Second read (3 cycle stall)
    @(posedge w_IBus_Read);
    r_IBus_WaitReq <= 1;
    @(posedge r_Clk);
    @(posedge r_Clk);
    r_IBus_WaitReq <= 0;
    r_IBus_ReadData <= w_IBus_Address;
    
    @(posedge r_Clk);
    r_IBus_ReadData <= 'hFFFFFFFF;

  end

endmodule