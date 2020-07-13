`timescale 1ns / 1ps

module DBusMaster(
    input i_Clk,
    input i_DBusTranslatorEn,

    //DBUS
    input i_DBus_Gnt,
    output [29:0]o_DBus_Address,
    output [3:0] o_DBus_ByteEn,
    output o_DBus_Read,
    output o_DBus_Write,
    input [31:0] i_DBus_ReadData,
    output [31:0] o_DBus_WriteData,

    //CPU
    input [2:0] i_BusMode,
    input [31:0] i_CpuAddr,
    input i_CpuRe,
    input i_CpuWe,
    output reg [31:0] o_CpuRd,
    input [31:0] i_CpuWd
    );

    initial begin
        o_CpuRd <= 32'b0;
    end

    assign o_DBus_Address = i_DBus_Gnt? r_DBus_Address: 29'bz;
    assign o_DBus_ByteEn =  i_DBus_Gnt? r_DBus_ByteEn: 4'bz;
    assign o_DBus_Read =  i_DBus_Gnt? r_DBusRe: 1'bz;
    assign o_DBus_Write = i_DBus_Gnt? r_DBusWe: 1'bz;
    assign o_DBus_WriteData =  i_DBus_Gnt? r_DBus_WriteData: 32'bz;

    reg [29:0]r_DBus_Address = 30'b0;
    reg [3:0]r_DBus_ByteEn = 4'b1111;
    reg r_DBusRe = 1'b0;
    reg r_DBusWe = 1'b0;
    reg [31:0] r_DBus_WriteData = 32'b0;

    reg [29:0]r_Old_DBus_Address = 32'b0;
    reg [3:0]r_Old_DBus_ByteEn = 4'b1111;
    reg r_Old_DBusRe = 1'b0;
    reg r_Old_DBusWe = 1'b0;
    reg [31:0] r_Old_DBus_WriteData = 32'b0;

    reg [2:0] r_BusModeRd = 3'b0;
    reg [1:0] r_AddrRd = 2'b0;

    //Whether the bus write transaction is signed or now
    wire w_Signed = !i_BusMode[2];

     //Whether the bus read transaction is signed or now
    wire w_SignedRd = !r_BusModeRd[2];
   

    parameter p_BUS_BYTE_ACCESS         = 2'b00;
    parameter p_BUS_HALF_WORD_ACCESS    = 2'b01;
    parameter p_BUS_WORD_ACCESS         = 2'b10;

    always @(posedge i_Clk)begin
        if(i_DBusTranslatorEn)begin
            r_BusModeRd <= i_BusMode;
            r_AddrRd <= i_CpuAddr[1:0]; 

            r_Old_DBus_Address <= r_DBus_Address;
            r_Old_DBus_ByteEn <= r_DBus_ByteEn;
            r_Old_DBusRe <= r_DBusRe;
            r_Old_DBusWe <= r_DBusWe;
            r_Old_DBus_WriteData <= r_DBus_WriteData;
        end
    end

    always @(*) begin
        if(i_DBusTranslatorEn)begin
            r_DBus_Address <= i_CpuAddr[31:2];
            r_DBusRe <= i_CpuRe;
            r_DBusWe <= i_CpuWe;

            //Bus Read//
            case (r_BusModeRd[1:0])
                p_BUS_BYTE_ACCESS:begin
                    //Take care of sign extension for the signed/unsigned byte loads
                    o_CpuRd[31:8] <= {{24{w_SignedRd & i_DBus_ReadData[7]}}};
                    
                    case (r_AddrRd)
                        0:begin
                            o_CpuRd[7:0] <= i_DBus_ReadData[7:0];
                        end
                        1:begin
                            o_CpuRd[7:0] <= i_DBus_ReadData[15:8];
                        end
                        2:begin
                            o_CpuRd[7:0] <= i_DBus_ReadData[23:16];
                        end
                        3:begin
                            o_CpuRd[7:0] <= i_DBus_ReadData[31:24];
                        end 
                    endcase
                end
                p_BUS_HALF_WORD_ACCESS:begin
                    //Take care of sign extension for the signed/unsigned half word loads
                    o_CpuRd[31:16] <= {{16{w_SignedRd & i_DBus_ReadData[15]}}};

                    case (r_AddrRd)
                        0:begin
                            o_CpuRd[15:0] <= i_DBus_ReadData[15:0];
                        end
                        1:begin
                            o_CpuRd[15:0] <= i_DBus_ReadData[23:8];
                        end
                        2:begin
                            o_CpuRd[15:0] <= i_DBus_ReadData[31:16];
                        end
                        default:begin
                            o_CpuRd <= 32'b0;
                        end
                    endcase
                end
                p_BUS_WORD_ACCESS:begin
                    o_CpuRd <= i_DBus_ReadData;
                end
                default:begin
                    o_CpuRd <= 32'b0;
                end
            endcase

            //Bus Write//
            case (i_BusMode[1:0])
                p_BUS_BYTE_ACCESS:begin
                    r_DBus_ByteEn <= 1'b1 << i_CpuAddr[1:0];
                    
                    case (i_CpuAddr[1:0])
                        0:begin
                            r_DBus_WriteData <= {24'b0, i_CpuWd[7:0]};
                        end
                        1:begin
                            r_DBus_WriteData <=  {16'b0, i_CpuWd[7:0], 8'b0};
                        end
                        2:begin
                            r_DBus_WriteData <= {8'b0, i_CpuWd[7:0], 16'b0};
                        end
                        3:begin
                            r_DBus_WriteData <=  {i_CpuWd[7:0], 24'b0};
                        end 
                    endcase
                end
                p_BUS_HALF_WORD_ACCESS:begin
                    case (i_CpuAddr[1:0])
                        0:begin
                            r_DBus_WriteData <= {16'b0, i_CpuWd[15:0]};
                            r_DBus_ByteEn <= 4'b0011;
                        end
                        1:begin
                            r_DBus_WriteData <= {8'b0, i_CpuWd[15:0], 8'b0};
                            r_DBus_ByteEn <= 4'b0110;
                        end
                        2:begin
                            r_DBus_WriteData <= {16'b0, i_CpuWd[15:0]};
                            r_DBus_ByteEn <= 4'b1100;
                        end
                        default:begin
                            r_DBus_WriteData <= 32'h0;
                            r_DBus_ByteEn <= 32'b0;
                        end
                    endcase
                end
                p_BUS_WORD_ACCESS:begin
                    r_DBus_WriteData <= i_CpuWd;
                    r_DBus_ByteEn <= 4'b1111;
                end
                default:begin
                    r_DBus_WriteData <= 32'b0;
                    r_DBus_ByteEn <= 4'b0;
                end
            endcase
        end else begin
            r_DBus_Address <= r_Old_DBus_Address;
            r_DBus_ByteEn <= r_Old_DBus_ByteEn;
            r_DBusRe <= r_Old_DBusRe;
            r_DBusWe <= r_Old_DBusWe;
            r_DBus_WriteData <= r_Old_DBus_WriteData;
            o_CpuRd <= 0;
        end
    end

endmodule