`timescale 1ns / 1ps

module ALU(
    input [3:0] i_OpCode,

    input [1:0] i_ForASel,
    input signed [31:0] i_ForA0,
    input signed [31:0] i_ForA1,
    input signed [31:0] i_ForA2,
    
    input [1:0] i_ForBSel,
    input signed [31:0] i_ForB0,
    input signed [31:0] i_ForB1,
    input signed [31:0] i_ForB2,

    input i_SrcBSel,
    input signed [31:0] i_SrcB1,

    output reg signed[31:0] o_Result,
    output o_Zero
    );

    assign o_Zero = (o_Result == 32'b0) ? 1'b1 : 1'b0;

    //The various ALU operations
    parameter ALU_ADD   = 4'b0000;
    parameter ALU_SUB   = 4'b1000;
    parameter ALU_AND   = 4'b0111;
    parameter ALU_OR    = 4'b0110;
    parameter ALU_XOR   = 4'b0100;
    parameter ALU_SLL   = 4'b0001;
    parameter ALU_SRL   = 4'b0101;
    parameter ALU_SRA   = 4'b1101;
    
    //Forward muxes
    wire signed[31:0]mux_ForA[2:0] = {i_ForA2, i_ForA1, i_ForA0};
    wire signed[31:0]mux_ForB[2:0] = {i_ForB2, i_ForB1, i_ForB0};

    wire signed[31:0]w_SrcA = mux_ForA[i_ForASel];
    wire signed[31:0]w_SrcB0 = mux_ForB[i_ForBSel];
    
    wire signed[31:0]w_SrcB = i_SrcBSel?i_SrcB1:w_SrcB0;

    always @(*) begin
        case (i_OpCode)
            ALU_ADD:begin
                o_Result <= w_SrcA + w_SrcB;
            end
            ALU_SUB:begin
                o_Result <= w_SrcA -  w_SrcB;
            end  
            ALU_AND:begin
                o_Result <= w_SrcA &  w_SrcB;
            end  
            ALU_OR:begin
                o_Result <= w_SrcA |  w_SrcB;
            end
            ALU_XOR:begin
                o_Result <= w_SrcA ^  w_SrcB;
            end 
            ALU_SLL:begin
                o_Result <= w_SrcA << w_SrcB[4:0];
            end  
            ALU_SRL:begin
                o_Result <= w_SrcA >> w_SrcB[4:0];
            end  
            ALU_SRA:begin
                o_Result <= w_SrcA >>> w_SrcB[4:0];
            end 
            default:begin
                o_Result <= 32'b0;
            end  
        endcase
    end

endmodule
