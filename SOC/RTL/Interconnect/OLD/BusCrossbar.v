`timescale 1ns / 1ps

module BusCrossBar#(
    parameter NUM_MASTERS = 2,
    parameter NUM_SLAVES = 2,
    parameter SEL_NUM_BITS = {5'd1, 5'd1},
    parameter SEL_VAL = {30'd1, 30'd0}
    )(
    input i_Clk,

    //Avalon master inputs
    input [(30*(NUM_MASTERS))-1:0] i_AVIn_Addr,
    input [(4*(NUM_MASTERS))-1:0] i_AVIn_ByteEn,
    input [(1*(NUM_MASTERS)-1):0] i_AVIn_Read,
    input [(1*(NUM_MASTERS))-1:0] i_AVIn_Write,
    output reg [(32*(NUM_MASTERS)-1):0] o_AVIn_ReadData,
    input [(32*(NUM_MASTERS)-1):0] i_AVIn_WriteData,
    output reg [(1*(NUM_MASTERS))-1:0] o_AVIn_WaitRequest,

    //Avalon slave outputs
    output [(30*(NUM_SLAVES))-1:0] o_AVOut_Addr,
    output [(4*(NUM_SLAVES))-1:0] o_AVOut_ByteEn,
    output [(1*(NUM_SLAVES)-1):0] o_AVOut_Read,
    output [(1*(NUM_SLAVES))-1:0] o_AVOut_Write,
    input [(32*(NUM_SLAVES)-1):0] i_AVOut_ReadData,
    output [(32*(NUM_SLAVES)-1):0] o_AVOut_WriteData,
    input [(1*(NUM_SLAVES))-1:0] i_AVOut_WaitRequest
    );

    wire [(32*(NUM_SLAVES)-1):0] w_AVIn_ReadData [NUM_MASTERS-1:0];
    wire [(1*(NUM_SLAVES)-1):0] w_AVIn_WaitRequest [NUM_MASTERS-1:0];

    genvar i;
    for (i = 0; i < NUM_SLAVES; i = i + 1) begin : masterInterconnects
        BusInterconnect #(
            .NUM_INPUTS(NUM_MASTERS),
            .SEL_NUM_BITS(SEL_NUM_BITS[5*i +: 5]),
            .SEL_VAL(SEL_VAL[30*i +: 30])
        )BusInterconnect0(
            .i_Clk(i_Clk),

            //Inputs
            .i_AVIn_Addr(i_AVIn_Addr),
            .i_AVIn_ByteEn(i_AVIn_ByteEn),
            .i_AVIn_Read(i_AVIn_Read),
            .i_AVIn_Write(i_AVIn_Write),
            .o_AVIn_ReadData(w_AVIn_ReadData[i]),
            .i_AVIn_WriteData(i_AVIn_WriteData),
            .o_AVIn_WaitRequest(w_AVIn_WaitRequest[i]),

            //Outputs
            .o_AVOut_Addr(o_AVOut_Addr[30*i +: 30]),
            .o_AVOut_ByteEn(o_AVOut_ByteEn[4*i +: 4]),
            .o_AVOut_Read(o_AVOut_Read[1*i +: 1]),
            .o_AVOut_Write(o_AVOut_Write[1*i +: 1]),
            .i_AVOut_ReadData(i_AVOut_ReadData[32*i +: 32]),
            .o_AVOut_WriteData(o_AVOut_WriteData[32*i +: 32]),
            .i_AVOut_WaitRequest(i_AVOut_WaitRequest[1*i +: 1])
        );
    end

    // Slave to Master link back (MUST BE SELF IMPLEMENTED BASED ON NUMBER OF MASTERS AND SLAVES)
    always @(*) begin
        o_AVIn_WaitRequest[0] <= w_AVIn_WaitRequest[0][0] | w_AVIn_WaitRequest[1][0];
        o_AVIn_WaitRequest[1] <= w_AVIn_WaitRequest[0][1] | w_AVIn_WaitRequest[1][1];
    end
    always @(posedge i_Clk) begin
        o_AVIn_ReadData[32*0 +: 32] <= w_AVIn_ReadData[0][31:0] | w_AVIn_ReadData[1][31:0];
        o_AVIn_ReadData[32*1 +: 32] <= w_AVIn_ReadData[0][63:32] | w_AVIn_ReadData[1][63:32];
    end

endmodule