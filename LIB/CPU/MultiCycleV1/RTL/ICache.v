`timescale 1ns / 1ps

module ICache(
  input i_Clk,
  input i_Rst,

  // CPU Interface
  input i_RdEn,
  input [31:0] i_Addr,
  output o_Stall,
  output reg [31:0] o_RdData,

  // Bus Master [R]
  output reg [31:0] o_IBus_Address,
  output reg o_IBus_Read,
  input [31:0] i_IBus_ReadData,
  input i_IBus_WaitReq
  );

  initial begin
    o_RdData <= 0;
    o_IBus_Address <= 0;
    o_IBus_Read <= 0;
  end

  assign o_Stall = (i_RdEn | r_RdStall) & i_IBus_WaitReq;

  reg r_RdStall = 0;
  reg r_OldRdEn = 0;

  always @(*) begin
    o_IBus_Address <= i_Addr;

    // Read must stay asserted for whole read transaction
    o_IBus_Read <= i_RdEn | r_RdStall;

    if ((r_OldRdEn | r_RdStall) & !i_IBus_WaitReq) begin
      o_RdData <= i_IBus_ReadData;
    end else begin
      o_RdData <= 0;
    end
  end

  always @(posedge i_Clk) begin
    if(i_Rst) begin
      r_RdStall <= 0;
      r_OldRdEn <= 0;
    end else begin
      r_RdStall = (i_RdEn | r_RdStall) & i_IBus_WaitReq;
      r_OldRdEn <= i_RdEn;
    end
  end

endmodule