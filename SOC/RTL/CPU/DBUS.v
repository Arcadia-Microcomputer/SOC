`timescale 1ns / 1ps

module DBUS(
    input i_Clk,
    
    //DBUS
    output [29:0]o_DBusAddr,
    output o_DBusRe,
    output o_DBusWe,
    output reg [3:0] o_DBusByteEn,
    input [31:0] i_DBusRd,
    output reg [31:0] i_DBusWd,

    //CPU
    input [2:0] i_BusMode,
    input [31:0] i_CpuAddr,
    input i_CpuRe,
    input i_CpuWe,
    output reg [31:0] o_CpuRd,
    input [31:0] i_CpuWd
    );
    assign o_DBusAddr = i_CpuAddr[31:2];
    assign o_DBusRe = i_CpuRe;
    assign o_DBusWe = i_CpuWe;
    
    initial begin
        o_DBusByteEn <= 4'b0;
        i_DBusWd <= 32'b0;
        o_CpuRd <= 32'b0;
    end

    wire w_Signed = !i_BusMode[2];

    reg [2:0] r_BusModeRd = 3'b0;
    reg [1:0] r_AddrRd = 2'b0;
    wire w_SignedRd = !r_BusModeRd[2];


    parameter p_BUS_BYTE_ACCESS         = 2'b00;
    parameter p_BUS_HALF_WORD_ACCESS    = 2'b01;
    parameter p_BUS_WORD_ACCESS         = 2'b10;

    always @(posedge i_Clk)begin
        r_BusModeRd <= i_BusMode;
        r_AddrRd <= i_CpuAddr[1:0];
    end

    always @(*) begin
        case (r_BusModeRd[1:0])
            p_BUS_BYTE_ACCESS:begin
                //Take care of sign extension for the signed/unsigned byte loads
                o_CpuRd[31:8] <= {{24{w_SignedRd & i_DBusRd[7]}}};
                
                case (r_AddrRd)
                    0:begin
                        o_CpuRd[7:0] <= i_DBusRd[7:0];
                    end
                    1:begin
                        o_CpuRd[7:0] <= i_DBusRd[15:8];
                    end
                    2:begin
                        o_CpuRd[7:0] <= i_DBusRd[23:16];
                    end
                    3:begin
                        o_CpuRd[7:0] <= i_DBusRd[31:24];
                    end 
                endcase
            end
            p_BUS_HALF_WORD_ACCESS:begin
                //Take care of sign extension for the signed/unsigned half word loads
                o_CpuRd[31:16] <= {{16{w_SignedRd & i_DBusRd[15]}}};

                case (r_AddrRd)
                    0:begin
                        o_CpuRd[15:0] <= i_DBusRd[15:0];
                    end
                    1:begin
                        o_CpuRd[15:0] <= i_DBusRd[23:8];
                    end
                    2:begin
                        o_CpuRd[15:0] <= i_DBusRd[31:16];
                    end
                    default:begin
                        o_CpuRd <= 32'b0;
                    end
                endcase
            end
            p_BUS_WORD_ACCESS:begin
                o_CpuRd <= i_DBusRd;
            end
            default:begin
                o_CpuRd <= 32'b0;
            end
        endcase

        case (i_BusMode[1:0])
            p_BUS_BYTE_ACCESS:begin
                o_DBusByteEn <= 1'b1 << i_CpuAddr[1:0];
                
                case (i_CpuAddr[1:0])
                    0:begin
                        i_DBusWd <= {24'b0, i_CpuWd[7:0]};
                    end
                    1:begin
                        i_DBusWd <=  {16'b0, i_CpuWd[7:0], 8'b0};
                    end
                    2:begin
                        i_DBusWd <= {8'b0, i_CpuWd[7:0], 16'b0};
                    end
                    3:begin
                        i_DBusWd <=  {i_CpuWd[7:0], 24'b0};
                    end 
                endcase
            end
            p_BUS_HALF_WORD_ACCESS:begin
                case (i_CpuAddr[1:0])
                    0:begin
                        i_DBusWd <= {16'b0, i_CpuWd[15:0]};
                        o_DBusByteEn <= 4'b0011;
                    end
                    1:begin
                        i_DBusWd <= {8'b0, i_CpuWd[15:0], 8'b0};
                        o_DBusByteEn <= 4'b0110;
                    end
                    2:begin
                        i_DBusWd <= {16'b0, i_CpuWd[15:0]};
                        o_DBusByteEn <= 4'b1100;
                    end
                    default:begin
                        i_DBusWd <= 32'b0;
                        o_DBusByteEn <= 32'b0;
                    end
                endcase
            end
            p_BUS_WORD_ACCESS:begin
                i_DBusWd <= i_CpuWd;
                o_DBusByteEn <= 4'b1111;
            end
            default:begin
                i_DBusWd <= 32'b0;
                o_DBusByteEn <= 4'b0;
            end
        endcase
    end

endmodule