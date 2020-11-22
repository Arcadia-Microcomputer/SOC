`timescale 1ns / 1ps

module CPU #(
    parameter INITIAL_PC_VALUE = 0
    )(
    input i_Clk,

    //IBus Master
    output [29:0]o_IBus_Address,
    output o_IBus_Read,
    input [31:0] i_IBus_ReadData,
    input i_IBus_WaitReq,

    //DBus Master// 
    output [29:0]o_DBus_Address,
    output [3:0]o_DBus_ByteEn,
    output o_DBus_Read,
    output o_DBus_Write,
    input [31:0]i_DBus_ReadData,
    output [31:0]o_DBus_WriteData,
    input i_DBus_WaitRequest
    );
    
    //PC Signals
    wire [31:0]w_PC_F;
    wire w_TakeBranch;

    //IBusMaster Signals
    wire [31:0]w_Inst_D;

    //IF_ID Signals
    reg [31:0]r_PC_D = 0;

    //Decoder Signals
    localparam p_CONTROL_D_SIZE = 20;
    wire [p_CONTROL_D_SIZE-1:0]w_Control_D;
    wire w_RS1Valid_D = w_Control_D[0];
    wire w_RS2Valid_D = w_Control_D[1];

    //RegFile
    wire [4:0]w_RS1Addr_D = w_Inst_D[19:15];
    wire [4:0]w_RS2Addr_D = w_Inst_D[24:20];
    wire [4:0]w_RDAddr_D  = w_Inst_D[11:7];
    wire [31:0]w_RS1_D;
    wire [31:0]w_RS2_D;

    //ImmGen Signals
    wire [31:0]w_Immediate_D;

    //Reg Forwarding D
    wire [31:0]w_RS1For_D;
    wire [31:0]w_RS2For_D;

    //ID_IE Signals
    localparam p_CONTROL_E_SIZE = 18;
    reg [p_CONTROL_E_SIZE-1:0]r_Control_E = 0;
    wire w_LoadUpperOp_E = r_Control_E[0];
    wire w_AluBSel_E = r_Control_E[1];
    wire [3:0]w_AluOp_E = r_Control_E[5:2];
    wire w_ExeResSel_E = r_Control_E[6];
    wire w_DBusRe_E = r_Control_E[14];

    reg [31:0]r_PC_E = 0;

    reg [31:0]r_RS1_E = 0;
    reg [31:0]w_RS2_E = 0;

    reg [31:0]r_Immediate_E = 0;

    reg [4:0]r_RS1Addr_E = 0;
    reg [4:0]r_RS2Addr_E = 0;
    reg [4:0]r_RDAddr_E = 0;

    //Reg Forwarding E Signals
    wire [31:0]w_RS1For_E;
    wire [31:0]w_RS2For_E;

    //ALU Signals
    wire [31:0]w_AluResult_E;
    wire w_AluCarry_E;

    //Load Upper Signals
    wire [31:0]w_LoadUpperRes;

    //Execute Result Mux
    wire [31:0]w_ExeResult_E;

    //PCPlus4 Signals
    wire [31:0]w_PCPlus4_E;

    //IE_MEM Signals
    localparam p_CONTROL_M_SIZE = 11;
    reg [p_CONTROL_M_SIZE-1:0]r_Control_M = 0;
    wire w_IsBranch_M = r_Control_M[0];
    wire w_IsJump_M = r_Control_M[1];
    wire [2:0]w_func3_M = r_Control_M[4:2];
    wire w_BranchAdderBSel_M = r_Control_M[5];
    wire w_DBusWe_M = r_Control_M[6];
    wire w_DBusRe_M = r_Control_M[7];
    wire w_RegWrEn_M = r_Control_M[10];

    reg [31:0]r_PCAdd4_M = 0;
    reg [31:0]r_PC_M = 0;
    reg [31:0]r_RS1_M = 0;
    reg [31:0]r_RS2_M = 0;
    reg r_AluASign_M = 0;
    reg r_AluBSign_M = 0;
    reg r_AluCarry_M = 0;
    reg [31:0]r_ExeResult_M = 0;
    reg [31:0]r_Immediate_M = 0;
    reg [4:0]r_RS2Addr_M = 0;
    reg [4:0]r_RS1Addr_M = 0;
    reg [4:0]r_RDAddr_M = 0;

    wire w_ExeResZero_M = (r_ExeResult_M == 32'b0)? 1'b1: 1'b0;
    wire w_ExeResNeg_M = r_ExeResult_M[31];

    //DBUS Signals
    wire [31:0]w_DBus_Rd_W;

    //Reg Forwarding M Signals
    wire [31:0]w_RS1For_M;
    wire [31:0]w_RS2For_M;

    //MEM_WB Signals
    localparam p_CONTROL_W_SIZE = 4;
    reg [p_CONTROL_W_SIZE-1:0]r_Control_W = 0;
    wire w_DBusRe_W = r_Control_W[0];
    wire [1:0]w_WBSrc_W = r_Control_W[2:1];
    wire w_RegWrEn_W = r_Control_W[3];

    reg [31:0]r_PCAdd4_W = 0;
    reg [31:0]r_AluResult_W = 0;
    reg [4:0]r_RDAddr_W = 0;

    //WBSrc Signals
    reg [31:0] w_WBData_W;

    //ForwardingUnit Signals
    wire w_RS1ForSel_D;
    wire w_RS2ForSel_D;
    wire w_RS1ForSel_E;
    wire w_RS2ForSel_E;
    wire w_RS1ForSel_M;
    wire w_RS2ForSel_M;

    //HazardUnit Signals
    wire w_PcEn;
    wire w_IBusOZero;
    wire w_IBusRdEn;
    wire w_DBusTranslatorEn_M;

    wire w_RegEn_D;
    wire w_RegEn_E;
    wire w_RegEn_M;
    wire w_RegEn_W;

    wire w_RegClr_D;
    wire w_RegClr_E;
    wire w_RegClr_M;
    wire w_RegClr_W;

    //--Fetch Stage--//
    PC #(
        .INITIAL_PC_VALUE(INITIAL_PC_VALUE)
    )PC0 (
        .i_Clk(i_Clk),
        
        //Control Signals  
        .i_PcEn(w_PcEn),

        //Branch Signals
        .i_IsJump_M(w_IsJump_M),
        .i_IsBranch_M(w_IsBranch_M),
        .i_BranchType_M(w_func3_M),

        .i_AluASign_M(r_AluASign_M),
        .i_AluBSign_M(r_AluBSign_M),
        .i_AluCarry_M(r_AluCarry_M),
        .i_ResZero_M(w_ExeResZero_M),
        .i_ResNeg_M(w_ExeResNeg_M),

        .i_BranchAdderBSel_M(w_BranchAdderBSel_M),

        .i_Imm_M(r_Immediate_M),
        .i_PC_M(r_PC_M),
        .i_RS1_M(w_RS1For_M),

        .o_TakeBranch(w_TakeBranch),
        .o_Pc(w_PC_F)
    );

    IBusMaster IBusMaster0(
        .i_Clk(i_Clk),

        .i_RdEn(w_IBusRdEn),
        .i_OZero(w_IBusOZero),

        .o_IBus_Address(o_IBus_Address),
        .o_IBus_Read(o_IBus_Read),
        .i_IBus_ReadData(i_IBus_ReadData),
        .i_IBus_WaitReq(i_IBus_WaitReq),

        .i_CpuAddr(w_PC_F),
        .o_CpuRd(w_Inst_D)
    );

    //--Decode Stage--//
    always @(posedge i_Clk) begin
        if(w_RegClr_D)begin
            r_PC_D <= 0;
        end else if(w_RegEn_D)begin
            r_PC_D <= w_PC_F;
        end
    end

    Decoder Decoder0(
        .i_Inst(w_Inst_D),

        .o_Control(w_Control_D)
    );

    RegFile RegFile0 (
        .i_Clk(i_Clk),
        
        .i_AddrR1(w_RS1Addr_D),
        .o_RD1(w_RS1_D),

        .i_AddrR2(w_RS2Addr_D),
        .o_RD2(w_RS2_D),

        .i_WE(w_RegWrEn_W),
        .i_WrAddr(r_RDAddr_W),
        .i_WrData(w_WBData_W)
    );

    ImmGen ImmGen0 (
        .i_Inst(w_Inst_D),
        .o_Imm(w_Immediate_D)
    );

    //Reg Forwarding Mux D
    assign w_RS1For_D = w_RS1ForSel_D? r_ExeResult_M: w_RS1_D;
    assign w_RS2For_D = w_RS2ForSel_D? r_ExeResult_M: w_RS2_D;

    //--Execute Stage--//
    always @(posedge i_Clk) begin
        if(w_RegClr_E)begin
            r_Control_E <= 0;
            r_PC_E      <= 0;
            r_RS1_E     <= 0;
            w_RS2_E     <= 0;
            r_Immediate_E <= 0;
            r_RS1Addr_E <= 0;
            r_RS2Addr_E <= 0;
            r_RDAddr_E  <= 0;
        end else if(w_RegEn_E)begin
            r_Control_E <= w_Control_D[p_CONTROL_D_SIZE-1:(p_CONTROL_D_SIZE-p_CONTROL_E_SIZE)];
            r_PC_E      <= r_PC_D;
            r_RS1_E     <= w_RS1For_D;
            w_RS2_E     <= w_RS2For_D;
            r_Immediate_E <= w_Immediate_D;
            r_RS2Addr_E <= w_RS2Addr_D;
            r_RS1Addr_E <= w_RS1Addr_D;
            r_RDAddr_E  <= w_RDAddr_D;
        end
    end

    //Reg Forwarding Mux E
    assign w_RS1For_E = w_RS1ForSel_E? r_ExeResult_M: r_RS1_E;
    assign w_RS2For_E = w_RS2ForSel_E? r_ExeResult_M: w_RS2_E;
    
    ALU ALU0 (
        .i_OpCode(w_AluOp_E),

        .i_A(w_RS1For_E),
        
        .i_BSel(w_AluBSel_E),
        .i_B0(w_RS2For_E),
        .i_B1(r_Immediate_E),

        .o_Carry(w_AluCarry_E),
        .o_Result(w_AluResult_E)
    );
    
    LoadUpper LoadUpper0(
        .i_OpCode(w_LoadUpperOp_E),

        .i_PC(r_PC_E),
        .i_Imm(r_Immediate_E),

        .o_Result(w_LoadUpperRes)
    );

    //Execute result mux
    assign w_ExeResult_E = w_ExeResSel_E? w_LoadUpperRes: w_AluResult_E;

    //PC + 4
    assign w_PCPlus4_E = r_PC_E + 4;

    //--Memory Stage--//
    always @(posedge i_Clk) begin
        if(w_RegClr_M)begin
            r_Control_M     <= 0;
            r_PCAdd4_M      <= 0;
            r_PC_M          <= 0;
            r_RS2_M         <= 0;
            r_RS1_M         <= 0;
            r_AluASign_M    <= 0;
            r_AluBSign_M    <= 0;
            r_AluCarry_M    <= 0;
            r_ExeResult_M   <= 0;
            r_Immediate_M   <= 0;
            r_RS2Addr_M     <= 0;
            r_RS1Addr_M     <= 0;
            r_RDAddr_M      <= 0;
        end else if(w_RegEn_M)begin
            r_Control_M     <= r_Control_E[p_CONTROL_E_SIZE-1:(p_CONTROL_E_SIZE-p_CONTROL_M_SIZE)];
            r_PCAdd4_M      <= w_PCPlus4_E;
            r_PC_M          <= r_PC_E;
            r_RS2_M         <= w_RS2For_E;
            r_RS1_M         <= w_RS1For_E;
            r_AluASign_M    <= w_RS1For_E[31];
            r_AluBSign_M    <= w_RS2For_E[31];
            r_AluCarry_M    <= w_AluCarry_E;
            r_ExeResult_M   <= w_ExeResult_E;
            r_Immediate_M   <= r_Immediate_E;
            r_RS2Addr_M     <= r_RS2Addr_E;
            r_RS1Addr_M     <= r_RS1Addr_E;
            r_RDAddr_M      <= r_RDAddr_E;
        end
    end

    DBusMaster DBusMaster0(
        .i_Clk(i_Clk),
        .i_DBusTranslatorEn(w_DBusTranslatorEn_M),

        //DBus
        .o_DBus_Address(o_DBus_Address),
        .o_DBus_ByteEn(o_DBus_ByteEn),
        .o_DBus_Read(o_DBus_Read),
        .o_DBus_Write(o_DBus_Write),
        .i_DBus_ReadData(i_DBus_ReadData),
        .o_DBus_WriteData(o_DBus_WriteData),

        //Internal CPU DBus
        .i_BusMode(w_func3_M),
        .i_CpuAddr(r_ExeResult_M),
        .i_CpuRe(w_DBusRe_M),
        .i_CpuWe(w_DBusWe_M),
        .o_CpuRd(w_DBus_Rd_W),
        .i_CpuWd(w_RS2For_M)
    );

    //Reg Forwarding Mux M
    assign w_RS1For_M = w_RS1ForSel_M? r_ExeResult_M: r_RS1_M;
    assign w_RS2For_M = w_RS2ForSel_M? r_ExeResult_M: r_RS2_M;

    //--Write Back Stage--//
    always @(posedge i_Clk) begin
        if(w_RegClr_W)begin
            r_Control_W     <= 0;
            r_PCAdd4_W      <= 0;
            r_AluResult_W   <= 0;
            r_RDAddr_W      <= 0;
        end else if(w_RegEn_W)begin
            r_Control_W     <= r_Control_M[p_CONTROL_M_SIZE-1:(p_CONTROL_M_SIZE-p_CONTROL_W_SIZE)];
            r_PCAdd4_W      <= r_PCAdd4_M;
            r_AluResult_W   <= r_ExeResult_M;
            r_RDAddr_W      <= r_RDAddr_M;
        end
    end

    //WB Src mux
    always @(*) begin
        case (w_WBSrc_W)
            0: w_WBData_W <= r_PCAdd4_W;
            1: w_WBData_W <= r_AluResult_W;
            2: w_WBData_W <= w_DBus_Rd_W;
            default: w_WBData_W <= 0;
        endcase
    end

    //--MISC--//
    ForwardingUnit ForwardingUnit0(
        .i_RS1Addr_D(w_RS1Addr_D),
        .i_RS2Addr_D(w_RS2Addr_D),
        .i_RS1Addr_E(r_RS1Addr_E),
        .i_RS2Addr_E(r_RS2Addr_E),
        .i_RS1Addr_M(r_RS1Addr_M),
        .i_RS2Addr_M(r_RS2Addr_M),
        .i_RDAddr_M(r_RDAddr_M),
        .i_RegWrEn_M(w_RegWrEn_M),

        .o_RS1ForSel_D(w_RS1ForSel_D),
        .o_RS2ForSel_D(w_RS2ForSel_D),
        .o_RS1ForSel_E(w_RS1ForSel_E),
        .o_RS2ForSel_E(w_RS2ForSel_E),
        .o_RS1ForSel_M(w_RS1ForSel_M),
        .o_RS2ForSel_M(w_RS2ForSel_M)
    );

    HazardUnit HazardUnit0 (
        .i_Clk(i_Clk),
        
        .i_RS1Valid_D(w_RS1Valid_D),
        .i_RS1Addr_D(w_RS1Addr_D),
        
        .i_RS2Valid_D(w_RS2Valid_D),
        .i_RS2Addr_D(w_RS2Addr_D),
        
        .i_RDAddr_E(r_RDAddr_E),
        .i_RDAddr_M(r_RDAddr_M),
        .i_RDAddr_W(r_RDAddr_W),
        
        .i_IBusWaitReq_F(i_IBus_WaitReq),
        .i_DBusWaitReq_M(i_DBus_WaitRequest),

        .i_IsMemRead_E(w_DBusRe_E),
        .i_IsMemRead_M(w_DBusRe_M),
        .i_IsMemRead_W(w_DBusRe_W),

        .i_IsJump_M(w_IsJump_M),
        .i_IsBranch_M(w_IsBranch_M),
        .i_TakeBranch_M(w_TakeBranch),
        
        .o_PcEn(w_PcEn),
        .o_IBusRdEn(w_IBusRdEn),
        .o_IBusOZero(w_IBusOZero),
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
