`timescale 1ns / 1ps

module Timer #(
    parameter ADDR_SEL_BITS = 0,
    parameter ADDR_BLOCK = 0
    )(
    input i_Clk,

    //Avalon RW slave
    input i_AV_SlaveSel,
    input [29-ADDR_SEL_BITS:0]i_AV_RegAddr,
    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    input i_AV_Write,
    output reg [31:0]o_AV_ReadData,
    input [31:0]i_AV_WriteData,
    output o_AV_WaitRequest
    );

    //DBus Signals
    initial begin
        o_AV_ReadData <= 0;
    end
    assign o_AV_WaitRequest = 0;

    //The various register addresses
    parameter p_REG_ADDR_CNTRL   = 0;
    parameter p_REG_ADDR_TIMER   = 1;
    parameter p_REG_ADDR_TRIG    = 2;
    
    //DBus addressable registers
    reg [31:0] r_AReg_Trigger = 0;
    reg r_AReg_Enable = 0;
    reg r_AReg_Reset = 0;
    reg r_AReg_OverFlowClr = 0;
    reg r_AReg_EnablePreScalerN = 0;
    reg r_AReg_EnablePreScalerM = 0;
    reg [2:0]r_AReg_PreScalerN = 0;
    reg [15:0]r_AReg_PreScalerM = 0;

    //Timer Signals
    reg [7:0] r_CounterN = 0;
    reg [15:0] r_CounterM = 0;
    reg [15:0] r_OldCounterM = 0;
    reg [31:0] r_Timer = 0;
    reg r_OverFlow = 0;

    reg r_TickOutN = 0;
    reg r_TickOutM = 0;

    always @(posedge i_Clk)begin
        o_AV_ReadData <= 0;
        r_AReg_Reset <= 0;
        r_AReg_OverFlowClr <= 0;

        if (i_AV_SlaveSel) begin
            //Write transaction
            if(i_AV_Write)begin
                case (i_AV_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        if(i_AV_ByteEn[0]) {r_AReg_EnablePreScalerM, r_AReg_EnablePreScalerN, r_AReg_OverFlowClr, r_AReg_Reset, r_AReg_Enable} <= i_AV_WriteData[4:0];
                        if(i_AV_ByteEn[1]) r_AReg_PreScalerN <= i_AV_WriteData[10:8];
                        if(i_AV_ByteEn[2]) r_AReg_PreScalerM[7:0] <= i_AV_WriteData[23:16];
                        if(i_AV_ByteEn[3]) r_AReg_PreScalerM[15:8] <= i_AV_WriteData[31:24];
                    end
                    p_REG_ADDR_TIMER:begin
                    end
                    p_REG_ADDR_TRIG:begin
                        if(i_AV_ByteEn[0]) r_AReg_Trigger[7:0]   <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1]) r_AReg_Trigger[15:8]  <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2]) r_AReg_Trigger[23:16] <= i_AV_WriteData[23:16];
                        if(i_AV_ByteEn[3]) r_AReg_Trigger[31:24] <= i_AV_WriteData[31:24];
                    end
                endcase
            end
            
            //Read transaction
            if(i_AV_Read)begin
                case (i_AV_RegAddr)
                    p_REG_ADDR_CNTRL:begin
                        o_AV_ReadData[0] <= r_AReg_Enable;
                        o_AV_ReadData[2] <= r_OverFlow;
                        o_AV_ReadData[3] <= r_AReg_EnablePreScalerN;
                        o_AV_ReadData[4] <= r_AReg_EnablePreScalerM;
                        o_AV_ReadData[10:8]<= r_AReg_PreScalerN;
                        o_AV_ReadData[31:16]<= r_AReg_PreScalerM;
                    end
                    p_REG_ADDR_TIMER:begin
                        o_AV_ReadData <= r_Timer;
                    end
                    p_REG_ADDR_TRIG:begin
                        o_AV_ReadData <= r_AReg_Trigger;
                    end
                    default:begin
                        o_AV_ReadData <= 0;
                    end
                endcase
            end
        end
    end

    always @(*) begin
        if(r_AReg_Enable)begin
            //PreScaler N tick generator
            if(r_AReg_EnablePreScalerN)begin
                if(r_CounterN[r_AReg_PreScalerN] == 1)begin
                    r_TickOutN = 1;
                end else begin
                    r_TickOutN = 0;
                end
            end else begin
                r_TickOutN = 1;
            end

            //PreScaler M tick generator
            if(r_AReg_EnablePreScalerM)begin
                if((r_CounterM == r_AReg_PreScalerM) && (r_CounterM != r_OldCounterM))begin
                    r_TickOutM = 1;
                end else begin
                    r_TickOutM = 0;
                end
            end else begin
                r_TickOutM = r_TickOutN;
            end
        end
        
    end

    always @(posedge i_Clk) begin
        r_OldCounterM <= r_CounterM;

        if(r_AReg_Enable)begin
            if(r_AReg_Reset)begin
                r_CounterN <= 0;
                r_CounterM <= 0;
                r_Timer <= 0;
            end else begin

                //PreScaler N
                if(r_AReg_EnablePreScalerN)begin
                    if(r_CounterN[r_AReg_PreScalerN] == 1)begin
                        r_CounterN <= 0;
                    end else begin
                        r_CounterN <= r_CounterN + 1;
                    end
                end

                //PreScaler M
                if(r_AReg_EnablePreScalerM)begin
                    if(r_TickOutN)begin
                        if(r_CounterM == r_AReg_PreScalerM)begin
                            r_CounterM <= 0;
                        end else begin
                            r_CounterM <= r_CounterM + 1;
                        end
                    end
                end

                //Timer
                if(r_TickOutM)begin
                    if(r_Timer == r_AReg_Trigger)begin
                        r_Timer <= 1'b0;

                        if(!r_AReg_OverFlowClr)begin
                            r_OverFlow <= 1'b1;
                        end
                    end else begin
                        r_Timer <= r_Timer + 1'b1;
                    end 
                end
                
                if(r_AReg_OverFlowClr)begin
                    r_OverFlow <= 1'b0;
                end
            end 
        end
    end
endmodule