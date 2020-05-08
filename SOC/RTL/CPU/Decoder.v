`timescale 1ns / 1ps

module Decoder(
    input [31:0]i_Inst,

    output [18:0]o_Control
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

    //ALU opcodes
    parameter ALU_ADD  = 4'b0000;
    parameter ALU_SUB  = 4'b1000;
    parameter ALU_AND  = 4'b0111;
    parameter ALU_OR   = 4'b0110;
    parameter ALU_XOR  = 4'b0100;
    parameter ALU_SLL  = 4'b0001;
    parameter ALU_SRL  = 4'b0101;
    parameter ALU_SRA  = 4'b1101;

    //WB Src Mux
    parameter WB_SRC_PC_PLUS4   = 2'd0;
    parameter WB_SRC_ALU        = 2'd1;
    parameter WB_SRC_DRAM       = 2'd2;

    //Branch Adder B Src Mux
    parameter BA_SRC_PC   = 1'd0;
    parameter BA_SRC_REG1 = 1'd1;

    wire [2:0]w_func3 = {i_Inst[14:12]};
    wire [6:0]w_func7 = {i_Inst[31:25]};
    wire [6:0]w_OpCode = i_Inst[6:0];
    wire [3:0]w_AluFunc4 = {i_Inst[30], i_Inst[14:12]};
    wire [3:0]w_AluFunc3 = {1'b0, i_Inst[14:12]};

    //Control signals
    reg r_RegWe = 0;
    reg [1:0]r_WBSrc = 0;
    reg r_DBusRe = 0;
    reg r_DBusWe = 0;
    reg r_BranchAdderBSel = 1'b0;
    reg r_IsJump = 0;
    reg r_IsBranch = 0;
    reg [3:0]r_ALuOp = 0;
    reg r_AluBSel = 0;
    reg r_DBusReq = 0;
    wire w_RS2Valid = ((w_OpCode == p_InstType_R)    || (w_OpCode == p_InstType_B)     || (w_OpCode == p_InstType_S));
    wire w_RS1Valid = !((w_OpCode == p_InstType_LUI) || (w_OpCode == p_InstType_AUIPC) || (w_OpCode == p_InstType_JAL));

    assign o_Control = {r_RegWe, r_WBSrc, r_DBusRe, r_DBusWe, r_BranchAdderBSel, w_func3, r_IsJump, r_IsBranch, r_ALuOp, r_AluBSel, r_DBusReq, w_RS2Valid, w_RS1Valid};

    always @(*) begin
        r_RegWe <= 1'b0;
        r_WBSrc <= WB_SRC_ALU;
        r_DBusRe <= 1'b0;
        r_DBusWe <= 1'b0;
        r_BranchAdderBSel <= BA_SRC_PC;
        r_IsJump <= 1'b0;
        r_IsBranch <= 1'b0;
        r_ALuOp <= ALU_ADD;
        r_AluBSel <= ALU_SRCB_RS2;
        r_DBusReq <= 1'b0;
        
        case (w_OpCode)
            p_InstType_R:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_ALU;
                r_ALuOp <= w_AluFunc4;
                r_AluBSel <= ALU_SRCB_RS2;
            end
            p_InstType_I:begin 
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_ALU;
                r_AluBSel <= ALU_SRCB_IMM;

                if(w_func3 == 3'b101)begin
                    //If it is a SRLI or SRAI the 4th bit is needed
                    r_ALuOp <= w_AluFunc4;
                end else begin
                    r_ALuOp <= w_AluFunc3;
                end
            end
            p_InstType_JALR:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_PC_PLUS4;
                r_BranchAdderBSel <= BA_SRC_REG1;
                r_IsJump <= 1'b1;
            end
            p_InstType_L:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_DRAM;
                r_DBusRe <= 1'b1;
                r_ALuOp <= ALU_ADD;
                r_AluBSel <= ALU_SRCB_IMM;
                r_DBusReq <= 1'b1;
            end
            p_InstType_LUI:begin
                
            end
            p_InstType_AUIPC:begin
                
            end
            p_InstType_JAL:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_PC_PLUS4;
                r_BranchAdderBSel <= BA_SRC_PC;
                r_IsJump <= 1'b1;
            end
            p_InstType_B:begin
                r_BranchAdderBSel <= BA_SRC_PC;
                r_IsBranch <= 1'b1;
                r_ALuOp <= ALU_SUB;
                r_AluBSel <= ALU_SRCB_RS2;
            end
            p_InstType_S:begin
                r_DBusWe <= 1'b1;
                r_ALuOp <= ALU_ADD;
                r_AluBSel <= ALU_SRCB_IMM;
                r_DBusReq <= 1'b1;
            end
        endcase    
    end

endmodule
