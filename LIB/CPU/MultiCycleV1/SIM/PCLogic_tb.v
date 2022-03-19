`timescale 1ns / 1ps

module PCLogic_tb();
  reg r_Clk = 0;
  reg r_Rst = 0;

  reg r_En = 0;
  reg r_TakeBranch = 0;
  reg r_BranchSrc = 0;
  reg [31:0] r_Imm = 0;
  reg [31:0] r_RS1 = 0;

  wire [31:0] w_PC;

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

    // Test PC default increment
    r_En <= 1;
    @(posedge r_Clk);
    @(posedge r_Clk);
    @(posedge r_Clk);
    r_En <= 0;
    @(posedge r_Clk);

    // Branch test (PC SRC)
    r_En <= 1;
    r_TakeBranch <= 1;
    r_BranchSrc <= 0;
    r_Imm <= 'h8;
    @(posedge r_Clk);
    r_En <= 0;
    r_TakeBranch <= 0;
    @(posedge r_Clk);

    // Branch test (RS1 SRC)
    r_En <= 1;
    r_TakeBranch <= 1;
    r_BranchSrc <= 1;
    r_Imm <= 'h8;
    r_RS1 <= 'h8;
    @(posedge r_Clk);
    r_En <= 0;
    r_TakeBranch <= 0;
    @(posedge r_Clk);

  end

  PCLogic DUT(
    .i_Clk(r_Clk),
    .i_Rst(r_Rst),

    .i_En(r_En),
    .i_TakeBranch(r_TakeBranch),
    .i_BranchSrc(r_BranchSrc),
    .i_Imm(r_Imm),
    .i_RS1(r_RS1),

    .o_PC(w_PC)
  );

endmodule