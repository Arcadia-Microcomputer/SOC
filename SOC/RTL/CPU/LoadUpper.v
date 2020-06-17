`timescale 1ns / 1ps

module LoadUpper(
    input i_OpCode,

    input [31:0]i_PC,
    input [31:0]i_Imm,

    output reg [31:0]o_Result
    );

    //The various LoadUpper operations
    parameter LU_LUI    = 1'd0;
    parameter LU_AUIPC  = 1'd1;
    
    initial begin
        o_Result <= 0;    
    end

    always @(*) begin
        
        case (i_OpCode)
            LU_LUI:begin
                o_Result <= i_Imm;
            end
            LU_AUIPC:begin
                o_Result <= i_PC + i_Imm;
            end  
            default:begin
                o_Result <= 32'b0;
            end  
        endcase
    end

endmodule