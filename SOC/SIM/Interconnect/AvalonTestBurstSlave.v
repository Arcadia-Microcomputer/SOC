`timescale 1ns / 1ps

module AvalonTestBurstSlave #(
    parameter NUM_PERIPH_SEL_BITS = 5,
    parameter PERIPH_SEL_VAL = 0,
    parameter WRITE_WAIT_REQ_CYCLES = 0,
    parameter READ_WAIT_REQ_CYCLES = 0
    )(
    input i_Clk,

    //Avalon RW slave
    input [29:0]i_AV_Addr,
    input [3:0]i_AV_ByteEn,
    input i_AV_Read,
    output reg [31:0]o_AV_ReadData,
    input i_AV_Write,
    input [31:0]i_AV_WriteData,
    output reg o_AV_WaitRequest,
    input [7:0]i_AV_BurstCount
    );
    initial begin
        o_AV_ReadData = 0;
        o_AV_WaitRequest = 0;
    end

    //DBUS Signals
    assign w_SlaveSel = (i_AV_Addr[29:30-NUM_PERIPH_SEL_BITS] == PERIPH_SEL_VAL)? 1 : 0;
	wire [29-NUM_PERIPH_SEL_BITS:0]w_InRegAddr = i_AV_Addr[29-NUM_PERIPH_SEL_BITS:0];
    wire [29-NUM_PERIPH_SEL_BITS:0]w_CurrentRegAddr = (r_BurstCounter == 0)? w_InRegAddr: r_BurstAddr;
    
    reg [29-NUM_PERIPH_SEL_BITS:0]r_BurstAddr = 0;
    reg [7:0]r_BurstCounter = 0;
    reg [7:0]r_Old_BurstCounter = 0;

    //Addresable registers
    reg [31:0]r_AReg_One = 0;
    reg [31:0]r_AReg_Two = 0;
    reg [31:0]r_AReg_Three = 0;
    reg [31:0]r_AReg_Four = 0;

    reg [$clog2(WRITE_WAIT_REQ_CYCLES):0]r_Write_WaitReqCounter = 0;
    reg [$clog2(READ_WAIT_REQ_CYCLES):0]r_Read_WaitReqCounter = 0;

    always @(*) begin
        o_AV_WaitRequest <= 0;

        if(w_SlaveSel)begin
            if(i_AV_Write)begin
                 case (w_CurrentRegAddr)
                    3:begin
                        if(r_Write_WaitReqCounter != WRITE_WAIT_REQ_CYCLES)begin
                            o_AV_WaitRequest <= 1;
                        end else begin
                            o_AV_WaitRequest <= 0;
                        end 
                    end
                endcase
            end

            if(i_AV_Read)begin
                case (w_CurrentRegAddr)
                    3:begin
                        if(r_Read_WaitReqCounter != READ_WAIT_REQ_CYCLES)begin
                            o_AV_WaitRequest <= 1;
                        end else begin
                            o_AV_WaitRequest <= 0;
                        end 
                    end
                endcase
            end
        end
    end

    always @(posedge i_Clk) begin
        r_Old_BurstCounter <= r_BurstCounter;

        if(w_SlaveSel)begin
            if(i_AV_Write)begin
                if(r_BurstCounter == 0)begin
                    //No transaction currently in progress
                    r_BurstCounter <= i_AV_BurstCount;

                    if(w_InRegAddr == 3)begin
                        r_BurstAddr <= w_InRegAddr; 
                    end else begin
                        r_BurstAddr <= w_InRegAddr + 1;  
                    end
                end else begin
                    //Transaction currently in progress
                    if(!o_AV_WaitRequest)begin
                        r_BurstCounter <= r_BurstCounter - 1;
                        r_BurstAddr <= r_BurstAddr + 1;
                    end 
                end

                case (w_CurrentRegAddr[1:0])
                    0:begin
                        if(i_AV_ByteEn[0])r_AReg_One[7:0]   <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1])r_AReg_One[15:8]  <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2])r_AReg_One[23:16] <= i_AV_WriteData[23:16];
                        if(i_AV_ByteEn[3])r_AReg_One[31:24] <= i_AV_WriteData[31:24]; 
                    end
                    1:begin
                        if(i_AV_ByteEn[0])r_AReg_Two[7:0]   <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1])r_AReg_Two[15:8]  <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2])r_AReg_Two[23:16] <= i_AV_WriteData[23:16];
                        if(i_AV_ByteEn[3])r_AReg_Two[31:24] <= i_AV_WriteData[31:24];    
                    end
                    2:begin
                        if(i_AV_ByteEn[0])r_AReg_Three[7:0]   <= i_AV_WriteData[7:0];
                        if(i_AV_ByteEn[1])r_AReg_Three[15:8]  <= i_AV_WriteData[15:8];
                        if(i_AV_ByteEn[2])r_AReg_Three[23:16] <= i_AV_WriteData[23:16];
                        if(i_AV_ByteEn[3])r_AReg_Three[31:24] <= i_AV_WriteData[31:24]; 
                    end
                    3:begin
                        if(r_Write_WaitReqCounter == WRITE_WAIT_REQ_CYCLES)begin
                            r_Write_WaitReqCounter <= 0; 

                            if(i_AV_ByteEn[0])r_AReg_Four[7:0]   <= i_AV_WriteData[7:0];
                            if(i_AV_ByteEn[1])r_AReg_Four[15:8]  <= i_AV_WriteData[15:8];
                            if(i_AV_ByteEn[2])r_AReg_Four[23:16] <= i_AV_WriteData[23:16];
                            if(i_AV_ByteEn[3])r_AReg_Four[31:24] <= i_AV_WriteData[31:24]; 
                        end else begin
                            r_Write_WaitReqCounter <= r_Write_WaitReqCounter + 1;
                        end
                    end
                endcase  
            end

            if(i_AV_Read)begin
                if(r_BurstCounter == 0)begin
                    //No transaction currently in progress
                    r_BurstCounter <= i_AV_BurstCount;

                    if(w_InRegAddr == 3)begin
                        r_BurstAddr <= w_InRegAddr; 
                    end else begin
                        r_BurstAddr <= w_InRegAddr + 1;  
                    end
                end else begin
                    //Transaction currently in progress       
                    if(!o_AV_WaitRequest)begin
                        r_BurstCounter <= r_BurstCounter - 1;
                        r_BurstAddr <= r_BurstAddr + 1;
                    end
                end

                case (w_CurrentRegAddr[1:0])
                    0: o_AV_ReadData <= r_AReg_One; 
                    1: o_AV_ReadData <= r_AReg_Two; 
                    2: o_AV_ReadData <= r_AReg_Three; 
                    3: begin
                        if(r_Read_WaitReqCounter == READ_WAIT_REQ_CYCLES)begin
                            r_Read_WaitReqCounter <= 0;
                            o_AV_ReadData <= r_AReg_Four; 
                        end else begin
                            r_Read_WaitReqCounter <= r_Read_WaitReqCounter + 1;
                        end
                    end
                endcase
            end
        end else begin
            o_AV_ReadData <= 0;
        end
    end
endmodule


