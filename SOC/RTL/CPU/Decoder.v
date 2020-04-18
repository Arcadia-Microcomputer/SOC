`timescale 1ns / 1ps

module Decoder(
    input [31:0]i_Inst,

    output [16:0]o_Control
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

    //ALU Result Src Mux
    parameter ALU_RES_SRC_MATHU  = 1'b0;
    parameter ALU_RESSRC_BSHIFT = 1'b1;

    // FUNC3 INST R type opcodes
    parameter INST_SUB_ADD  = 3'b000;
    parameter INST_AND      = 3'b111;
    parameter INST_OR       = 3'b110;
    parameter INST_XOR      = 3'b100;
    parameter INST_SLL      = 3'b001;
    parameter INST_SRL_SRA  = 3'b101;
    
    //BIT30 INST R type opcodes
    parameter INST_ADD  = 1'b0;
    parameter INST_SUB  = 1'b1;
    parameter INST_SRL  = 1'b0;
    parameter INST_SRA  = 1'b1;

    //The Math Unit opcodes
    parameter MATHU_ADD   = 3'b000;
    parameter MATHU_SUB   = 3'b001;
    parameter MATHU_AND   = 3'b010;
    parameter MATHU_OR    = 3'b011;
    parameter MATHU_XOR   = 3'b100;

    //Barrel Shift opcodes
    parameter BSHIFT_SLL = 2'b00;
    parameter BSHIFT_SRL = 2'b01;
    parameter BSHIFT_SRA = 2'b10;

    //WB Src Mux
    parameter WB_SRC_ALU = 1'b0;
    parameter WB_SRC_DRAM = 1'b1;

    wire [2:0]w_func3 = {i_Inst[14:12]};
    wire [6:0]w_func7 = {i_Inst[31:25]};
    wire [6:0]w_OpCode = i_Inst[6:0];
    
    //Control signals
    reg r_RegWe = 0;
    reg r_WBSrc = 0;
    reg r_DBusRe = 0;
    reg r_DBusWe = 0;
    reg r_IsBranch = 0;
    reg r_AluResSrc = 0;
    reg [1:0]r_BShiftOp = 0;
    reg [2:0]r_MathUOp = 0;
    reg r_AluBSel = 0;
    wire w_RS2Valid = ((w_OpCode == p_InstType_R)    || (w_OpCode == p_InstType_B)     || (w_OpCode == p_InstType_S));
    wire w_RS1Valid = !((w_OpCode == p_InstType_LUI) || (w_OpCode == p_InstType_AUIPC) || (w_OpCode == p_InstType_JAL));

    assign o_Control = {r_RegWe, r_WBSrc, w_func3, r_DBusRe, r_DBusWe, r_IsBranch, r_AluResSrc, r_BShiftOp, r_MathUOp, r_AluBSel, w_RS2Valid, w_RS1Valid};

    always @(*) begin
        r_RegWe <= 1'b0;
        r_WBSrc <= WB_SRC_ALU;
        r_DBusRe <= 1'b0;
        r_DBusWe <= 1'b0;
        r_IsBranch <= 1'b0;
        r_AluResSrc <= ALU_RES_SRC_MATHU;
        r_BShiftOp <= BSHIFT_SLL;
        r_MathUOp <= MATHU_ADD;
        r_AluBSel <= ALU_SRCB_RS2;

        case (w_OpCode)
            p_InstType_R:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_ALU;
                r_AluBSel <= ALU_SRCB_RS2;
                
                case (w_func3)
                    INST_SUB_ADD:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;

                        case (i_Inst[30])
                            INST_ADD:begin
                                r_MathUOp <= MATHU_ADD;
                            end
                            INST_SUB:begin
                                r_MathUOp <= MATHU_SUB;
                            end
                        endcase
                    end
                    INST_AND:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;
                        r_MathUOp <= MATHU_AND;
                    end
                    INST_OR:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;
                        r_MathUOp <= MATHU_OR;
                    end
                    INST_XOR:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;
                        r_MathUOp <= MATHU_XOR;
                    end
                    INST_SLL:begin
                        r_AluResSrc <= ALU_RESSRC_BSHIFT;
                        r_BShiftOp <= BSHIFT_SLL;
                    end
                    INST_SRL:begin
                        r_AluResSrc <= ALU_RESSRC_BSHIFT;
                        r_BShiftOp <= BSHIFT_SRL;
                    end
                    INST_SRL_SRA:begin
                        r_AluResSrc <= ALU_RESSRC_BSHIFT;

                        case (i_Inst[30])
                            INST_SRL:begin
                                r_BShiftOp <= BSHIFT_SRL;
                            end
                            INST_SRA:begin
                                r_BShiftOp <= BSHIFT_SRA;
                            end
                        endcase
                    end
                endcase
            end
            p_InstType_I:begin 
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_ALU;
                r_AluBSel <= ALU_SRCB_IMM;

                 case (w_func3)
                    INST_SUB_ADD:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;

                        case (i_Inst[30])
                            INST_ADD:begin
                                r_MathUOp <= MATHU_ADD;
                            end
                            INST_SUB:begin
                                r_MathUOp <= MATHU_SUB;
                            end
                        endcase
                    end
                    INST_AND:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;
                        r_MathUOp <= MATHU_AND;
                    end
                    INST_OR:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;
                        r_MathUOp <= MATHU_OR;
                    end
                    INST_XOR:begin
                        r_AluResSrc <= ALU_RES_SRC_MATHU;
                        r_MathUOp <= MATHU_XOR;
                    end
                    INST_SLL:begin
                        r_AluResSrc <= ALU_RESSRC_BSHIFT;
                        r_BShiftOp <= BSHIFT_SLL;
                    end
                    INST_SRL:begin
                        r_AluResSrc <= ALU_RESSRC_BSHIFT;
                        r_BShiftOp <= BSHIFT_SRL;
                    end
                    INST_SRL_SRA:begin
                        r_AluResSrc <= ALU_RESSRC_BSHIFT;

                        case (i_Inst[30])
                            INST_SRL:begin
                                r_BShiftOp <= BSHIFT_SRL;
                            end
                            INST_SRA:begin
                                r_BShiftOp <= BSHIFT_SRA;
                            end
                        endcase
                    end
                endcase
            end
            p_InstType_JALR:begin
                
            end
            p_InstType_L:begin
                r_RegWe <= 1'b1;
                r_WBSrc <= WB_SRC_DRAM;
                r_DBusRe <= 1'b1;

                r_AluResSrc <= ALU_RES_SRC_MATHU;
                r_MathUOp <= MATHU_ADD;
                r_AluBSel <= ALU_SRCB_IMM;
            end
            p_InstType_LUI:begin
                
            end
            p_InstType_AUIPC:begin
                
            end
            p_InstType_JAL:begin
                
            end
            p_InstType_B:begin
                r_IsBranch <= 1'b1;

                r_AluResSrc <= ALU_RES_SRC_MATHU;
                r_MathUOp <= MATHU_SUB;
                r_AluBSel <= ALU_SRCB_RS2;
            end
            p_InstType_S:begin
                r_DBusWe <= 1'b1;

                r_AluResSrc <= ALU_RES_SRC_MATHU;
                r_MathUOp <= MATHU_ADD;
                r_AluBSel <= ALU_SRCB_IMM;
            end
        endcase    
    end

endmodule
