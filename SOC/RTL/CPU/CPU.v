`timescale 1ns / 1ps

module CPU(
    input i_Clk,

    //DBus Master// 
    output o_DBus_Req_E,
    input i_DBus_Gnt_M,

    output [29:0]o_DBus_Address,
    output [3:0]o_DBus_ByteEn,
    output o_DBus_Read,
    output o_DBus_Write,
    input [31:0]i_DBus_ReadData,
    output [31:0]o_DBus_WriteData,
    input i_DBus_WaitRequest
    );

    //Instruction Fetch Stage//
    //PC Signals
    wire [31:0]w_PC_F;
    wire w_TakeBranch;

    PC PC0 (
        .i_Clk(i_Clk),
        
        //Control Signals  
        .i_PcEn(w_PcEn),

        //Branch Signals
        .i_IsJump_M(w_IsJump_M),
        .i_IsBranch_M(w_IsBranch_M),
        .i_BranchType_M(w_func3_M),

        .i_AluASign_M(w_AluASign_M),
        .i_AluBSign_M(w_AluBSign_M),
        .i_AluCarry_M(w_AluCarry_M),
        .i_AluResZero_M(w_AluResZero_M),
        .i_AluResNeg_M(w_AluResNeg_M),

        .i_BranchAdderBSel_M(w_BranchAdderBSel_M),

        .w_Imm_M(w_Immediate_M),
        .w_PC_M(w_PC_M),
        .w_RS1_M(w_RS1For_M),

        .o_TakeBranch(w_TakeBranch),
        .o_Pc(w_PC_F)
    );

    //IRAM Signals
    wire [31:0]w_Inst_D;

    IRAM #(
        .DEPTH(64)
    )IRAM0(
        .i_Clk(i_Clk),

        .i_RdEn(w_IRamRdEn),
        .i_OZero(w_IRamOZero),

        .i_Addr(w_PC_F[31:2]),
        .o_Inst(w_Inst_D)
    );

    //Instruction Decode Stage//
    //-IF_ID Signals
    wire [31:0]w_PC_D;

    StageReg #(
        .WIDTH(32)
    ) IF_ID (
        .i_Clk(i_Clk),

        .i_En(w_RegEn_D),
        .i_Clear(w_RegClr_D),

        .i_In({w_PC_F}),
        .o_Out({w_PC_D})
    );

    //Decoder Signals
    parameter p_CONTROL_D_SIZE = 19;
    wire [p_CONTROL_D_SIZE-1:0]w_Control_D;
    wire w_RS1Valid_D = w_Control_D[0];
    wire w_RS2Valid_D = w_Control_D[1];

    Decoder Decoder0(
        .i_Inst(w_Inst_D),

        .o_Control(w_Control_D)
    );

    //RegFile
    wire [4:0]w_RS1Addr_D = w_Inst_D[19:15];
    wire [4:0]w_RS2Addr_D = w_Inst_D[24:20];
    wire [4:0]w_RDAddr_D  = w_Inst_D[11:7];
    wire [31:0]w_RS1_D;
    wire [31:0]w_RS2_D;

    RegFile RegFile0 (
        .i_Clk(i_Clk),
        
        .i_AddrR1(w_RS1Addr_D),
        .o_RD1(w_RS1_D),

        .i_AddrR2(w_RS2Addr_D),
        .o_RD2(w_RS2_D),

        .i_WE(w_RegWrEn_W),
        .i_WrAddr(w_RDAddr_W),
        .i_WrData(w_WBData_W)
    );

    //ImmGen Signals
    wire [31:0]w_Immediate_D;
    ImmGen ImmGen0 (
        .i_Inst(w_Inst_D),
        .o_Imm(w_Immediate_D)
    );

    //Reg Forwarding D
    wire [31:0]w_RS1For_D = w_RS1ForSel_D? w_AluResult_M: w_RS1_D;
    wire [31:0]w_RS2For_D = w_RS2ForSel_D? w_AluResult_M: w_RS2_D;

    //Execute Stage//
    //ID_IE Signals
    parameter p_CONTROL_E_SIZE = 17;
    wire [p_CONTROL_E_SIZE-1:0]w_Control_E;
    assign o_DBus_Req_E = w_Control_E[0];   
    wire w_AluBSel_E = w_Control_E[1];
    wire [3:0]w_AluOp_E = w_Control_E[5:2];
    wire w_DRamRe_E = w_Control_E[13];

    wire [31:0]w_PC_E;

    wire [31:0]w_RS1_E;
    wire [31:0]w_RS2_E;

    wire [31:0]w_Immediate_E;

    wire [4:0]w_RS1Addr_E;
    wire [4:0]w_RS2Addr_E;
    wire [4:0]w_RDAddr_E;

    StageReg #(
        .WIDTH(160)
    ) ID_IE (
        .i_Clk(i_Clk),

        .i_En(w_RegEn_E),
        .i_Clear(w_RegClr_E),

        .i_In({w_Control_D[p_CONTROL_D_SIZE-1:(p_CONTROL_D_SIZE-p_CONTROL_E_SIZE)], w_PC_D, w_RS1For_D, w_RS2For_D, w_Immediate_D, w_RS2Addr_D, w_RS1Addr_D, w_RDAddr_D}),
        .o_Out({w_Control_E, w_PC_E, w_RS1_E, w_RS2_E, w_Immediate_E, w_RS2Addr_E, w_RS1Addr_E, w_RDAddr_E})
    );

    //Reg Forwarding E Signals
    wire [31:0]w_RS1For_E = w_RS1ForSel_E? w_AluResult_M: w_RS1_E;
    wire [31:0]w_RS2For_E = w_RS2ForSel_E? w_AluResult_M: w_RS2_E;

    //ALU Signals
    wire [31:0] w_AluResult_E;
    wire w_AluCarry_E;
    ALU ALU0 (
        .i_OpCode(w_AluOp_E),

        .i_A(w_RS1For_E),
        
        .i_BSel(w_AluBSel_E),
        .i_B0(w_RS2For_E),
        .i_B1(w_Immediate_E),

        .o_Carry(w_AluCarry_E),
        .o_Result(w_AluResult_E)
    );

    //PCPlus4 Signals
    wire [31:0]w_PCPlus4_E = w_PC_E + 4;

    //Memory Stage//
    //IE_MEM Signals
    parameter p_CONTROL_M_SIZE = 11;
    wire [p_CONTROL_M_SIZE-1:0]w_Control_M;
    wire w_IsBranch_M = w_Control_M[0];
    wire w_IsJump_M = w_Control_M[1];
    wire [2:0]w_func3_M = w_Control_M[4:2];
    wire w_BranchAdderBSel_M = w_Control_M[5];
    wire w_DRamWe_M = w_Control_M[6];
    wire w_DRamRe_M = w_Control_M[7];
    wire w_RegWrEn_M = w_Control_M[10];

    wire [31:0]w_PCAdd4_M;
    wire [31:0]w_PC_M;
    wire [31:0]w_RS1_M;
    wire [31:0]w_RS2_M;
    wire w_AluASign_M;
    wire w_AluBSign_M;
    wire w_AluCarry_M;
    wire [31:0]w_AluResult_M;
    wire [31:0]w_Immediate_M;
    wire [4:0]w_RS2Addr_M;
    wire [4:0]w_RS1Addr_M;
    wire [4:0]w_RDAddr_M;

    wire w_AluResZero_M = (w_AluResult_M == 32'b0)? 1'b1: 1'b0;
    wire w_AluResNeg_M = w_AluResult_M[31];

    StageReg #(
        .WIDTH(221)
    ) IE_MEM (
        .i_Clk(i_Clk),

        .i_En(w_RegEn_M),
        .i_Clear(w_RegClr_M),

        .i_In({w_Control_E[p_CONTROL_E_SIZE-1:(p_CONTROL_E_SIZE-p_CONTROL_M_SIZE)], w_PCPlus4_E, w_PC_E, w_RS2For_E, w_RS1For_E, w_RS1For_E[31], w_RS2For_E[31], w_AluCarry_E, w_AluResult_E, w_Immediate_E, w_RS2Addr_E, w_RS1Addr_E, w_RDAddr_E}),
        .o_Out({w_Control_M, w_PCAdd4_M, w_PC_M, w_RS2_M, w_RS1_M, w_AluASign_M, w_AluBSign_M, w_AluCarry_M, w_AluResult_M, w_Immediate_M, w_RS2Addr_M, w_RS1Addr_M, w_RDAddr_M})
    );

    //DBUS Signals
    wire [31:0]w_DRAM_Rd_W;
    DBUS_MASTER DBUS_MASTER0(
        .i_Clk(i_Clk),
        .i_DBusTranslatorEn(w_DBusTranslatorEn_M),

        //DBus
        .i_DBus_Gnt(i_DBus_Gnt_M),
        .o_DBus_Address(o_DBus_Address),
        .o_DBus_ByteEn(o_DBus_ByteEn),
        .o_DBus_Read(o_DBus_Read),
        .o_DBus_Write(o_DBus_Write),
        .i_DBus_ReadData(i_DBus_ReadData),
        .o_DBus_WriteData(o_DBus_WriteData),

        //Internal CPU DBus
        .i_BusMode(w_func3_M),
        .i_CpuAddr(w_AluResult_M),
        .i_CpuRe(w_DRamRe_M),
        .i_CpuWe(w_DRamWe_M),
        .o_CpuRd(w_DRAM_Rd_W),
        .i_CpuWd(w_RS2For_M)
    );

    //Reg Forwarding M Signals
    wire [31:0]w_RS1For_M = w_RS1ForSel_M? w_AluResult_M: w_RS1_M;
    wire [31:0]w_RS2For_M = w_RS2ForSel_M? w_AluResult_M: w_RS2_M;

    //Write Back Stage//
    //MEM_WB Signals
    parameter p_CONTROL_W_SIZE = 4;
    wire [p_CONTROL_W_SIZE-1:0]w_Control_W;
    wire w_DRamRe_W = w_Control_M[0];
    wire [1:0]w_WBSrc_W = w_Control_W[2:1];
    wire w_RegWrEn_W = w_Control_W[3];

    wire [31:0]w_PCAdd4_W;
    wire [31:0]w_AluResult_W;
    wire [4:0]w_RDAddr_W;

    StageReg #(
        .WIDTH(73)
    ) MEM_WB (
        .i_Clk(i_Clk),

        .i_En(w_RegEn_W),
        .i_Clear(w_RegClr_W),

        .i_In({w_Control_M[p_CONTROL_M_SIZE-1:(p_CONTROL_M_SIZE-p_CONTROL_W_SIZE)], w_PCAdd4_M,  w_AluResult_M, w_RDAddr_M}),
        .o_Out({w_Control_W, w_PCAdd4_W, w_AluResult_W, w_RDAddr_W})
    );

    //WBSrc Signals
    reg [31:0] w_WBData_W;
    always @(*) begin
        case (w_WBSrc_W)
            0: w_WBData_W <= w_PCAdd4_W;
            1: w_WBData_W <= w_AluResult_W;
            2: w_WBData_W <= w_DRAM_Rd_W;
            default: w_WBData_W <= 0;
        endcase
    end

    //MISC//
    //ForwardingUnit Signals
    wire w_RS1ForSel_D;
    wire w_RS2ForSel_D;
    wire w_RS1ForSel_E;
    wire w_RS2ForSel_E;
    wire w_RS1ForSel_M;
    wire w_RS2ForSel_M;

    ForwardingUnit ForwardingUnit0(
        .i_RS1Addr_D(w_RS1Addr_D),
        .i_RS2Addr_D(w_RS2Addr_D),
        .i_RS1Addr_E(w_RS1Addr_E),
        .i_RS2Addr_E(w_RS2Addr_E),
        .i_RS1Addr_M(w_RS1Addr_M),
        .i_RS2Addr_M(w_RS2Addr_M),
        .i_RDAddr_M(w_RDAddr_M),
        .i_RegWrEn_M(w_RegWrEn_M),

        .o_RS1ForSel_D(w_RS1ForSel_D),
        .o_RS2ForSel_D(w_RS2ForSel_D),
        .o_RS1ForSel_E(w_RS1ForSel_E),
        .o_RS2ForSel_E(w_RS2ForSel_E),
        .o_RS1ForSel_M(w_RS1ForSel_M),
        .o_RS2ForSel_M(w_RS2ForSel_M)
    );

    //HazardUnit Signals
    wire w_PcEn;
    wire w_IRamOZero;
    wire w_IRamRdEn;
    wire w_DBusTranslatorEn_M;

    wire w_RegEn_D;
    wire w_RegEn_E;
    wire w_RegEn_M;
    wire w_RegEn_W;

    wire w_RegClr_D;
    wire w_RegClr_E;
    wire w_RegClr_M;
    wire w_RegClr_W;

    HazardUnit HazardUnit0 (
        .i_Clk(i_Clk),
        
        .i_RS1Valid_D(w_RS1Valid_D),
        .i_RS1Addr_D(w_RS1Addr_D),
        
        .i_RS2Valid_D(w_RS2Valid_D),
        .i_RS2Addr_D(w_RS2Addr_D),
        
        .i_RDAddr_E(w_RDAddr_E),
        .i_RDAddr_M(w_RDAddr_M),
        .i_RDAddr_W(w_RDAddr_W),

        .i_DBusGnt_M(i_DBus_Gnt_M),
        .i_DBusWaitReq_W(i_DBus_WaitRequest),

        .i_IsMemRead_E(w_DRamRe_E),
        .i_IsMemRead_M(w_DRamRe_M),
        .i_IsMemRead_W(w_DRamRe_W),

        .i_IsJump_M(w_IsJump_M),
        .i_IsBranch_M(w_IsBranch_M),
        .i_TakeBranch_M(w_TakeBranch),
        
        .o_PcEn(w_PcEn),
        .o_IRamRdEn(w_IRamRdEn),
        .o_IRamOZero(w_IRamOZero),
        .o_DBusTranslatorEn(w_DBusTranslatorEn_M),

        .o_RegEn_D(w_RegEn_D),
        .o_RegEn_E(w_RegEn_E),
        .o_RegEn_M(w_RegEn_M),
        .o_RegEn_W(w_RegEn_W),

        .o_RegClr_D(w_RegClr_D),
        .o_RegClr_E(w_RegClr_E),
        .o_RegClr_M(w_RegClr_M),
        .o_RegClr_W(w_RegClr_W)
    );

endmodule
