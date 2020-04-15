`timescale 1ns / 1ps

module Decoder(
    input [31:0]i_Inst,

    output [12:0]o_Control
    );

    //Instruction Opcodes 
    parameter p_InstType_R      = 7'b0110011;
    parameter p_InstType_I      = 7'b0010011;
    parameter p_InstType_JALR   = 7'b1100111;
    parameter p_InstType_L      = 7'b0000011;
    parameter p_InstType_LUI    = 7'b0110111;
    parameter p_InstType_AUIPC  = 7'b0010111;
    parameter p_InstType_JAL    = 7'b1101111;
    parameter p_InstType_B      = 7'b1100011;
    parameter p_InstType_S      = 7'b0100011;

    //ALU Src B Mux
    parameter ALU_SRCB_RS2 = 1'b0;
    parameter ALU_SRCB_IMM = 1'b1;

    //The ALU opcodes
    parameter ALU_ADD   = 4'b0000;
    parameter ALU_SUB   = 4'b1000;
    parameter ALU_AND   = 4'b0111;
    parameter ALU_OR    = 4'b0110;
    parameter ALU_XOR   = 4'b0100;
    parameter ALU_SLL   = 4'b0001;
    parameter ALU_SRL   = 4'b0101;
    parameter ALU_SRA   = 4'b1101;
    
    //WB Src Mux
    parameter WB_SRC_ALU = 1'b0;
    parameter WB_SRC_DRAM = 1'b1;

    wire [2:0]w_func3 = {i_Inst[14:12]};
    wire [6:0]w_func7 = {i_Inst[31:25]};
    wire [6:0]w_OpCode = i_Inst[6:0];

    wire [3:0]w_ALUFunc4 = {w_func7[5], w_func3};
    wire [3:0]w_ALUFunc3 = {1'b0, w_func3};
    
    //Control signals
    reg r_RegWe = 0;
    reg r_WBSrc = 0;
    reg r_DBUS_Re = 0;
    reg r_DBUS_We = 0;
    reg r_IsBranch = 0;
    reg [3:0]r_ALUOp = 0;
    reg r_ALU_BSel = 0;
    
    assign o_Control = {r_RegWe, r_WBSrc, w_func3, r_DBUS_Re, r_DBUS_We, r_IsBranch, r_ALUOp, r_ALU_BSel};

    always @(*) begin
        r_RegWe <= 1'b0;
        r_WBSrc <= WB_SRC_ALU;
        r_DBUS_Re <= 1'b0;
        r_DBUS_We <= 1'b0;
        r_IsBranch <= 1'b0;
        r_ALUOp <= ALU_ADD;
        r_ALU_BSel <= ALU_SRCB_RS2;

        case (w_OpCode)
            p_InstType_R:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_ALU;
                r_ALUOp <= w_ALUFunc4;
                r_ALU_BSel <= ALU_SRCB_RS2;
                
            end
            p_InstType_I:begin 
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_ALU;
                r_ALU_BSel <= ALU_SRCB_IMM;

                //If it's a immediate shift right, bit 30 is needed to make up the alu op code
                if(w_func3 == 3'b101)begin
                    r_ALUOp <= w_ALUFunc4;
                end else begin
                    r_ALUOp <= w_ALUFunc3;
                end
            end
            p_InstType_JALR:begin
                
            end
            p_InstType_L:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_DRAM;
                r_DBUS_Re <= 1'b1;
                r_ALUOp <= ALU_ADD;
                r_ALU_BSel <= ALU_SRCB_IMM;
            end
            p_InstType_LUI:begin
                
            end
            p_InstType_AUIPC:begin
                
            end
            p_InstType_JAL:begin
                r_ALUOp <= ALU_SUB;
                r_ALU_BSel <= ALU_SRCB_RS2;
            end
            p_InstType_B:begin
                r_IsBranch <= 1'b1;
                r_ALUOp <= ALU_SUB;
                r_ALU_BSel <= ALU_SRCB_RS2;
            end
            p_InstType_S:begin
                r_DBUS_We <= 1'b1;
                r_ALU_BSel <= ALU_SRCB_IMM;
                r_ALUOp <= ALU_ADD;
                r_DBUS_We <= 1'b1;
            end
        endcase    
    end

endmodule
