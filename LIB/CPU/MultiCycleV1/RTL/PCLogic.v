`timescale 1ns / 1ps

module PCLogic(
  input i_Clk,
  input i_Rst,

  input i_En,
  input i_TakeBranch,
  input i_BranchSrc,
  input [31:0] i_Imm,
  input [31:0] i_RS1,

  output reg [31:0] o_PC
  );

  initial begin
    o_PC <= 0;
  end

  always @(posedge i_Clk) begin
    if(i_Rst) begin
      o_PC <= 0;
    end else if (i_En) begin
      if(i_TakeBranch)begin
        o_PC = i_Imm + (i_BranchSrc ? i_RS1: o_PC);
      end else begin
        o_PC = o_PC + 4;
      end
    end
  end

endmodule