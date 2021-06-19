`timescale 1ns / 1ps

module InputDecoder #(
    parameter ADDR_SEL_BITS_O0 = 5,
    parameter ADDR_SEL_O0 = 0,
    parameter ADDR_SEL_BITS_O1 = 5,
    parameter ADDR_SEL_O1 = 1,
    parameter ADDR_SEL_BITS_O2 = 5,
    parameter ADDR_SEL_O2 = 2,
    parameter ADDR_SEL_BITS_O3 = 5,
    parameter ADDR_SEL_O3 = 3
    )(
    input i_Clk,

    input [29:0]i_AV_Addr,
    input i_AV_Read,
    input i_AV_Write,
    input i_AV_WaitRequest,
    input [7:0]i_AV_BurstCount,

    output reg [3:0]o_Out_Req,
    output reg [3:0]o_Out_NewTransaction
    );
    
    initial begin
        o_Out_Req = 0;
        o_Out_NewTransaction = 0;
    end

    reg [2:0]r_OSel = 0;

    wire [30-ADDR_SEL_BITS_O0:0]w_AddrSel_O0 = i_AV_Addr[29:30-ADDR_SEL_BITS_O0];
    wire [30-ADDR_SEL_BITS_O1:0]w_AddrSel_O1 = i_AV_Addr[29:30-ADDR_SEL_BITS_O1];
    wire [30-ADDR_SEL_BITS_O2:0]w_AddrSel_O2 = i_AV_Addr[29:30-ADDR_SEL_BITS_O2];
    wire [30-ADDR_SEL_BITS_O3:0]w_AddrSel_O3 = i_AV_Addr[29:30-ADDR_SEL_BITS_O3];
    
    always @(*) begin
        if(w_AddrSel_O0 == ADDR_SEL_O0)begin
            r_OSel <= 0;
        end else if(w_AddrSel_O1 == ADDR_SEL_O1)begin
            r_OSel <= 1;
        end else if(w_AddrSel_O2 == ADDR_SEL_O2)begin
            r_OSel <= 2;
        end else if(w_AddrSel_O3 == ADDR_SEL_O3)begin
            r_OSel <= 3;
        end else begin
            r_OSel <= 0;
        end
    end

    reg r_Old_WaitRequest = 0;
    reg r_Old_Read = 0;
    reg r_Old_Write = 0;
    reg [7:0]r_BurstCounter_d, r_BurstCounter_q = 0;
    
    always @(*) begin
        r_BurstCounter_d <= r_BurstCounter_q;
        o_Out_Req <= 0;
        o_Out_NewTransaction <= 0;

        if(r_BurstCounter_q != 0) begin
            //Transaction in progress
            o_Out_Req[r_OSel] <= 1;
            
            if((!i_AV_WaitRequest && r_Old_Read) || (!i_AV_WaitRequest && r_Old_Write))begin 
                r_BurstCounter_d <= r_BurstCounter_q - 1;

                if(r_BurstCounter_q == 1)begin
                    //Transaction finished
                    o_Out_Req[r_OSel] <= 0; 

                    if(i_AV_Read || i_AV_Write)begin
                        //New transaction continuing
                        o_Out_Req[r_OSel] <= 1;
                        o_Out_NewTransaction[r_OSel] <= 1;
                        r_BurstCounter_d <= i_AV_BurstCount;
                    end
                end
            end
        end else if(i_AV_Read || i_AV_Write)begin
            //Transaction initalized
            o_Out_Req[r_OSel] <= 1;
            o_Out_NewTransaction[r_OSel] <= 1;
            r_BurstCounter_d <= i_AV_BurstCount;
        end else begin
            o_Out_Req <= 0;
        end
    end

    always @(posedge i_Clk) begin
        r_Old_WaitRequest <= i_AV_WaitRequest;
        r_Old_Read <= i_AV_Read;
        r_Old_Write <= i_AV_Write;
        r_BurstCounter_q <= r_BurstCounter_d;
    end
endmodule


