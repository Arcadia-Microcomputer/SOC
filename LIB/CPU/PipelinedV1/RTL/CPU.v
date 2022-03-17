`timescale 1ns / 1ps

module CPU #(
    parameter INITIAL_PC_VALUE = 0
    )(
    input i_Clk,

    //Instruction Bus
    output [29:0]o_IBus_Address,
    output o_IBus_Read,
    input [31:0] i_IBus_ReadData,
    input i_IBus_WaitReq,

    //Data Bus
    output [29:0]o_DBus_Address,
    output [3:0]o_DBus_ByteEn,
    output o_DBus_Read,
    output o_DBus_Write,
    input [31:0]i_DBus_ReadData,
    output [31:0]o_DBus_WriteData,
    input i_DBus_WaitRequest
    );
    
    //----PC Stage----//
    //PC Signals
    wire [31:0]w_PC_PC;
    wire w_TakeBranch_EX2;
    
    //ICache Signals
    wire w_ICacheStall_PC;
    wire [31:0]w_Inst_IF;

    //----IF Stage----//
    //PC->IF Signals
    reg [31:0]r_PC_IF = 0;

    //----ID Stage----//
    //IF->ID Signals
    reg [31:0]r_PC_ID = 0;
    reg [31:0]r_Inst_ID = 0;

    //Decoder Signals
    localparam p_CONTROL_ID_SIZE = 20;
    wire [p_CONTROL_ID_SIZE-1:0]w_Control_ID;
    wire w_RS1Valid_ID = w_Control_ID[0];
    wire w_RS2Valid_ID = w_Control_ID[1];

    //RegFile
    wire [4:0]w_RS1Addr_ID = r_Inst_ID[19:15];
    wire [4:0]w_RS2Addr_ID = r_Inst_ID[24:20];
    wire [4:0]w_RDAddr_ID  = r_Inst_ID[11:7];
    wire [31:0]w_RS1_ID;
    wire [31:0]w_RS2_ID;

    //ImmGen Signals
    wire [31:0]w_Immediate_ID;

    //Reg Forwarding ID
    wire [31:0]w_RS1For_ID;
    wire [31:0]w_RS2For_ID;

    //----EX1 Stage----//
    //ID->EX1 Signals
    localparam p_CONTROL_EX1_SIZE = 18;
    reg [p_CONTROL_EX1_SIZE-1:0]r_Control_EX1 = 0;
    wire w_LoadUpperOp_EX1 = r_Control_EX1[0];
    wire w_AluBSel_EX1 = r_Control_EX1[1];
    wire [3:0]w_AluOp_EX1 = r_Control_EX1[5:2];
    wire w_ExeResSel_EX1 = r_Control_EX1[6];
    wire w_DBusRe_EX1 = r_Control_EX1[14];
    wire w_RegWrEn_EX1 = r_Control_EX1[17];

    reg [31:0]r_PC_EX1 = 0;

    reg [31:0]r_RS1_EX1 = 0;
    reg [31:0]w_RS2_EX1 = 0;

    reg [31:0]r_Immediate_EX1 = 0;

    reg [4:0]r_RS1Addr_EX1 = 0;
    reg [4:0]r_RS2Addr_EX1 = 0;
    reg [4:0]r_RDAddr_EX1 = 0;

    //Reg Forwarding E Signals
    wire [31:0]w_RS1For_EX1;
    wire [31:0]w_RS2For_EX1;

    //ALU Signals
    wire [31:0]w_AluResult_EX1;
    wire w_AluCarry_EX1;

    //Load Upper Signals
    wire [31:0]w_LoadUpperRes;

    //Execute Result Mux
    wire [31:0]w_ExeResult_EX1;

    //PCPlus4 Signals
    wire [31:0]w_PCPlus4_EX1;

    //----EX2 Stage----//
    //EX1->EX2 Signals
    localparam p_CONTROL_EX2_SIZE = 11;
    reg [p_CONTROL_EX2_SIZE-1:0]r_Control_EX2 = 0;
    wire w_IsBranch_EX2 = r_Control_EX2[0];
    wire w_IsJump_EX2 = r_Control_EX2[1];
    wire [2:0]w_func3_EX2 = r_Control_EX2[4:2];
    wire w_BranchAdderBSel_EX2 = r_Control_EX2[5];
    wire w_DBusWe_EX2 = r_Control_EX2[6];
    wire w_DBusRe_EX2 = r_Control_EX2[7];
    wire w_RegWrEn_EX2 = r_Control_EX2[10];

    reg [31:0]r_PCAdd4_EX2 = 0;
    reg [31:0]r_PC_EX2 = 0;
    reg [31:0]r_RS1_EX2 = 0;
    reg [31:0]r_RS2_EX2 = 0;
    reg r_AluASign_EX2 = 0;
    reg r_AluBSign_EX2 = 0;
    reg r_AluCarry_EX2 = 0;
    reg [31:0]r_ExeResult_EX2 = 0;
    reg [31:0]r_Immediate_EX2 = 0;
    reg [4:0]r_RS2Addr_EX2 = 0;
    reg [4:0]r_RS1Addr_EX2 = 0;
    reg [4:0]r_RDAddr_EX2 = 0;

    wire w_ExeResZero_EX2 = (r_ExeResult_EX2 == 32'b0)? 1'b1: 1'b0;
    wire w_ExeResNeg_EX2 = r_ExeResult_EX2[31];

    //Reg Forwarding EX2 Signals
    wire [31:0]w_RS1For_EX2;
    wire [31:0]w_RS2For_EX2;

    //DCache Signals
    wire w_DCacheStall_EX2;
    wire [31:0]w_DData_Rd_WB;

    //----WB Stage----//
    //EX2->WB Signals
    localparam p_CONTROL_WB_SIZE = 4;
    reg [p_CONTROL_WB_SIZE-1:0]r_Control_WB = 0;
    wire w_DBusRe_WB = r_Control_WB[0];
    wire [1:0]w_WBSrc_WB = r_Control_WB[2:1];
    wire w_RegWrEn_WB = r_Control_WB[3];

    reg [31:0]r_PCAdd4_WB = 0;
    reg [31:0]r_AluResult_WB = 0;
    reg [4:0]r_RDAddr_WB = 0;

    //WBSrc Signals
    reg [31:0] w_WBData_WB;

    //ForwardingUnit Signals
    wire w_RS1ForSel_ID;
    wire w_RS2ForSel_ID;
    wire w_RS1ForSel_EX1;
    wire w_RS2ForSel_EX1;
    wire w_RS1ForSel_EX2;
    wire w_RS2ForSel_EX2;

    //HazardUnit Signals
    wire w_PcEn;
    wire w_ICacheHoldOut;
    wire w_ICacheClear;
    wire w_ICacheRdEn;

    wire w_RegEn_IF;
    wire w_RegEn_ID;
    wire w_RegEn_EX1;
    wire w_RegEn_EX2;
    wire w_RegEn_WB;

    wire w_RegClr_IF;
    wire w_RegClr_ID;
    wire w_RegClr_EX1;
    wire w_RegClr_EX2;
    wire w_RegClr_WB;

    //----PC Stage----//
    PCLogic #(
        .INITIAL_PC_VALUE(INITIAL_PC_VALUE)
    )PCLogic0(
        .i_Clk(i_Clk),
        
        //Control Signals  
        .i_PcEn(w_PcEn),

        //Branch Signals
        .i_IsJump_M(w_IsJump_EX2),
        .i_IsBranch_M(w_IsBranch_EX2),
        .i_BranchType_M(w_func3_EX2),

        .i_AluASign_M(r_AluASign_EX2),
        .i_AluBSign_M(r_AluBSign_EX2),
        .i_AluCarry_M(r_AluCarry_EX2),
        .i_ResZero_M(w_ExeResZero_EX2),
        .i_ResNeg_M(w_ExeResNeg_EX2),

        .i_BranchAdderBSel_M(w_BranchAdderBSel_EX2),

        .i_Imm_M(r_Immediate_EX2),
        .i_PC_M(r_PC_EX2),
        .i_RS1_M(w_RS1For_EX2),

        .o_TakeBranch(w_TakeBranch_EX2),
        .o_Pc(w_PC_PC)
    );

    ICache ICache0(
        .i_Clk(i_Clk),

        .i_RdEn(w_ICacheRdEn),
        .i_HoldOut(w_ICacheHoldOut),
        .i_Clear(w_ICacheClear),
        .o_Stall(w_ICacheStall_PC),

        .i_CpuAddr(w_PC_PC),
        .o_CpuRd(w_Inst_IF),

        .o_IBus_Address(o_IBus_Address),
        .o_IBus_Read(o_IBus_Read),
        .i_IBus_ReadData(i_IBus_ReadData),
        .i_IBus_WaitReq(i_IBus_WaitReq)
    );
    
    //----IF Stage----//
    always @(posedge i_Clk) begin
        if(w_RegClr_IF)begin
            r_PC_IF <= 0;
        end else if(w_RegEn_IF)begin
            r_PC_IF <= w_PC_PC;
        end
    end

    //----ID Stage----//
    always @(posedge i_Clk) begin
        if(w_RegClr_ID)begin
            r_PC_ID <= 0;
            r_Inst_ID <= 0;
        end else if(w_RegEn_ID)begin
            r_PC_ID <= r_PC_IF;
            r_Inst_ID <= w_Inst_IF;
        end
    end

    Decoder Decoder0(
        .i_Inst(r_Inst_ID),

        .o_Control(w_Control_ID)
    );

    RegFile RegFile0 (
        .i_Clk(i_Clk),
        
        .i_AddrR1(w_RS1Addr_ID),
        .o_RD1(w_RS1_ID),

        .i_AddrR2(w_RS2Addr_ID),
        .o_RD2(w_RS2_ID),

        .i_WE(w_RegWrEn_WB),
        .i_WrAddr(r_RDAddr_WB),
        .i_WrData(w_WBData_WB)
    );

    ImmGen ImmGen0 (
        .i_Inst(r_Inst_ID),
        .o_Imm(w_Immediate_ID)
    );

    //Reg Forwarding Mux D
    assign w_RS1For_ID = w_RS1ForSel_ID? r_ExeResult_EX2: w_RS1_ID;
    assign w_RS2For_ID = w_RS2ForSel_ID? r_ExeResult_EX2: w_RS2_ID;

    //----Execute 1 Stage----//
    always @(posedge i_Clk) begin
        if(w_RegClr_EX1)begin
            r_Control_EX1 <= 0;
            r_PC_EX1      <= 0;
            r_RS1_EX1     <= 0;
            w_RS2_EX1     <= 0;
            r_Immediate_EX1 <= 0;
            r_RS1Addr_EX1 <= 0;
            r_RS2Addr_EX1 <= 0;
            r_RDAddr_EX1  <= 0;
        end else if(w_RegEn_EX1)begin
            r_Control_EX1 <= w_Control_ID[p_CONTROL_ID_SIZE-1:(p_CONTROL_ID_SIZE-p_CONTROL_EX1_SIZE)];
            r_PC_EX1      <= r_PC_ID;
            r_RS1_EX1     <= w_RS1For_ID;
            w_RS2_EX1     <= w_RS2For_ID;
            r_Immediate_EX1 <= w_Immediate_ID;
            r_RS1Addr_EX1 <= w_RS1Addr_ID;
            r_RS2Addr_EX1 <= w_RS2Addr_ID;
            r_RDAddr_EX1  <= w_RDAddr_ID;
        end
    end

    //Reg Forwarding Mux E
    assign w_RS1For_EX1 = w_RS1ForSel_EX1? r_ExeResult_EX2: r_RS1_EX1;
    assign w_RS2For_EX1 = w_RS2ForSel_EX1? r_ExeResult_EX2: w_RS2_EX1;
    
    ALU ALU0 (
        .i_OpCode(w_AluOp_EX1),

        .i_A(w_RS1For_EX1),
        
        .i_BSel(w_AluBSel_EX1),
        .i_B0(w_RS2For_EX1),
        .i_B1(r_Immediate_EX1),

        .o_Carry(w_AluCarry_EX1),
        .o_Result(w_AluResult_EX1)
    );
    
    LoadUpper LoadUpper0(
        .i_OpCode(w_LoadUpperOp_EX1),

        .i_PC(r_PC_EX1),
        .i_Imm(r_Immediate_EX1),

        .o_Result(w_LoadUpperRes)
    );

    //Execute result mux
    assign w_ExeResult_EX1 = w_ExeResSel_EX1? w_LoadUpperRes: w_AluResult_EX1;

    //PC + 4
    assign w_PCPlus4_EX1 = r_PC_EX1 + 4;

    //----Execute 2 Stage----//
    always @(posedge i_Clk) begin
        if(w_RegClr_EX2)begin
            r_Control_EX2     <= 0;
            r_PCAdd4_EX2      <= 0;
            r_PC_EX2          <= 0;
            r_RS2_EX2         <= 0;
            r_RS1_EX2         <= 0;
            r_AluASign_EX2    <= 0;
            r_AluBSign_EX2    <= 0;
            r_AluCarry_EX2    <= 0;
            r_ExeResult_EX2   <= 0;
            r_Immediate_EX2   <= 0;
            r_RS2Addr_EX2     <= 0;
            r_RS1Addr_EX2     <= 0;
            r_RDAddr_EX2      <= 0;
        end else if(w_RegEn_EX2)begin
            r_Control_EX2     <= r_Control_EX1[p_CONTROL_EX1_SIZE-1:(p_CONTROL_EX1_SIZE-p_CONTROL_EX2_SIZE)];
            r_PCAdd4_EX2      <= w_PCPlus4_EX1;
            r_PC_EX2          <= r_PC_EX1;
            r_RS2_EX2         <= w_RS2For_EX1;
            r_RS1_EX2         <= w_RS1For_EX1;
            r_AluASign_EX2    <= w_RS1For_EX1[31];
            r_AluBSign_EX2    <= w_RS2For_EX1[31];
            r_AluCarry_EX2    <= w_AluCarry_EX1;
            r_ExeResult_EX2   <= w_ExeResult_EX1;
            r_Immediate_EX2   <= r_Immediate_EX1;
            r_RS2Addr_EX2     <= r_RS2Addr_EX1;
            r_RS1Addr_EX2     <= r_RS1Addr_EX1;
            r_RDAddr_EX2      <= r_RDAddr_EX1;
        end
    end

    DCache DCache0(
        .i_Clk(i_Clk),
        .o_Stall(w_DCacheStall_EX2),

        //Internal CPU Data Bus
        .i_BusMode(w_func3_EX2),
        .i_CpuAddr(r_ExeResult_EX2),
        .i_CpuRe(w_DBusRe_EX2),
        .i_CpuWe(w_DBusWe_EX2),
        .o_CpuRd(w_DData_Rd_WB),
        .i_CpuWd(w_RS2For_EX2),

        //External Data Bus
        .o_DBus_Address(o_DBus_Address),
        .o_DBus_ByteEn(o_DBus_ByteEn),
        .o_DBus_Read(o_DBus_Read),
        .o_DBus_Write(o_DBus_Write),
        .i_DBus_ReadData(i_DBus_ReadData),
        .o_DBus_WriteData(o_DBus_WriteData),
        .i_DBus_WaitRequest(i_DBus_WaitRequest)
    );

    //Reg Forwarding Mux M
    assign w_RS1For_EX2 = w_RS1ForSel_EX2? w_WBData_WB: r_RS1_EX2;
    assign w_RS2For_EX2 = w_RS2ForSel_EX2? w_WBData_WB: r_RS2_EX2;

    //----Write Back Stage----//
    always @(posedge i_Clk) begin
        if(w_RegClr_WB)begin
            r_Control_WB     <= 0;
            r_PCAdd4_WB      <= 0;
            r_AluResult_WB   <= 0;
            r_RDAddr_WB      <= 0;
        end else if(w_RegEn_WB)begin
            r_Control_WB     <= r_Control_EX2[p_CONTROL_EX2_SIZE-1:(p_CONTROL_EX2_SIZE-p_CONTROL_WB_SIZE)];
            r_PCAdd4_WB      <= r_PCAdd4_EX2;
            r_AluResult_WB   <= r_ExeResult_EX2;
            r_RDAddr_WB      <= r_RDAddr_EX2;
        end
    end

    //WB Src mux
    always @(*) begin
        case (w_WBSrc_WB)
            0: w_WBData_WB <= r_PCAdd4_WB;
            1: w_WBData_WB <= r_AluResult_WB;
            2: w_WBData_WB <= w_DData_Rd_WB;
            default: w_WBData_WB <= 0;
        endcase
    end

    //----MISC----//
    ForwardingUnit ForwardingUnit0(
        .i_RS1Addr_D(w_RS1Addr_ID),
        .i_RS2Addr_D(w_RS2Addr_ID),
        .i_RS1Addr_E(r_RS1Addr_EX1),
        .i_RS2Addr_E(r_RS2Addr_EX1),
        .i_RS1Addr_M(r_RS1Addr_EX2),
        .i_RS2Addr_M(r_RS2Addr_EX2),
        .i_RDAddr_M(r_RDAddr_EX2),
        .i_RegWrEn_M(w_RegWrEn_EX2),

        .o_RS1ForSel_D(w_RS1ForSel_ID),
        .o_RS2ForSel_D(w_RS2ForSel_ID),
        .o_RS1ForSel_E(w_RS1ForSel_EX1),
        .o_RS2ForSel_E(w_RS2ForSel_EX1),
        .o_RS1ForSel_M(w_RS1ForSel_EX2),
        .o_RS2ForSel_M(w_RS2ForSel_EX2)
    );

    HazardUnit HazardUnit0 (
        .i_Clk(i_Clk),
        
        .i_RS1Valid_ID(w_RS1Valid_ID),
        .i_RS1Addr_ID(w_RS1Addr_ID),
        
        .i_RS2Valid_ID(w_RS2Valid_ID),
        .i_RS2Addr_ID(w_RS2Addr_ID),
        
        .i_RDAddr_EX1(r_RDAddr_EX1),
        .i_RDAddr_EX2(r_RDAddr_EX2),
        .i_RDAddr_WB(r_RDAddr_WB),

        .i_IsMemRead_EX1(w_DBusRe_EX1),
        .i_IsMemRead_EX2(w_DBusRe_EX2),
        .i_IsMemRead_WB(w_DBusRe_WB),

        // TODO: Add to schematic !!
        .i_RegWrEn_EX1(w_RegWrEn_EX1),
        .i_RegWrEn_EX2(w_RegWrEn_EX2),

        .i_IsJump_EX2(w_IsJump_EX2),
        .i_IsBranch_EX2(w_IsBranch_EX2),
        .i_TakeBranch_EX2(w_TakeBranch_EX2),
        
        .i_ICacheStall_PC(w_ICacheStall_PC),
        .i_DCacheStall_EX2(w_DCacheStall_EX2),

        .o_PcEn(w_PcEn),
        .o_ICacheRdEn(w_ICacheRdEn),
        .o_ICacheHoldOut(w_ICacheHoldOut),
        .o_ICacheClear(w_ICacheClear),

        .o_RegEn_IF(w_RegEn_IF),
        .o_RegEn_ID(w_RegEn_ID),
        .o_RegEn_EX1(w_RegEn_EX1),
        .o_RegEn_EX2(w_RegEn_EX2),
        .o_RegEn_WB(w_RegEn_WB),

        .o_RegClr_IF(w_RegClr_IF),
        .o_RegClr_ID(w_RegClr_ID),
        .o_RegClr_EX1(w_RegClr_EX1),
        .o_RegClr_EX2(w_RegClr_EX2),
        .o_RegClr_WB(w_RegClr_WB)
    );

endmodule
