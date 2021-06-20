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

    // MasterDecoder's arbiter signals
    wire [NUM_SLAVES-1:0] w_Req [NUM_MASTERS-1:0];
    wire [NUM_SLAVES-1:0] w_Lock [NUM_MASTERS-1:0];
    wire [NUM_SLAVES-1:0] w_Gnt [NUM_MASTERS-1:0];
    
    // Link back signals from slave to master
    wire [(32*(NUM_SLAVES)-1):0] w_AV_ReadData [NUM_SLAVES-1:0];
    wire [(1*(NUM_SLAVES))-1:0] w_AV_WaitRequest [NUM_SLAVES-1:0];

    // MasterDecoder for each master
    // Generates the slave arbiter req and lock signals
    genvar i;
    for (i = 0; i < NUM_MASTERS; i = i + 1) begin : masterDecoders
        MasterDecoder #(
            .NUM_SLAVES(NUM_SLAVES),
            .SEL_NUM_BITS(SEL_NUM_BITS),
            .SEL_VAL(SEL_VAL)
        )MasterDecoderX(
            .i_Clk(i_Clk),
            
            .o_Req(w_Req[i]),
            .o_Lock(w_Lock[i]),
            .i_Gnt(w_Gnt[i]),

            .i_AVIn_Addr(i_AVIn_Addr[30*i +: 30]),
            .i_AVIn_Read(i_AVIn_Read[i]),
            .i_AVIn_Write(i_AVIn_Write[i]),
            .o_AVIn_WaitRequest(o_AVIn_WaitRequest[i])
        );
    end

    // SlaveInterconnect for each slave
    // Does the bus muxing based on req and lock signals from the MasterDecoders
    for (i = 0; i < NUM_SLAVES; i = i + 1) begin : slaveInterconnects
        SlaveInterconnect #(
            .NUM_MASTERS(NUM_MASTERS)
        )SlaveInterconnectX(
            .i_Clk(i_Clk),

            // (MUST BE SELF IMPLEMENTED)
            .i_Req({w_Req[1][i], w_Req[0][i]}),
            .i_Lock({w_Lock[1][i], w_Lock[0][i]}),
            .o_Gnt({w_Gnt[1][i], w_Gnt[0][i]}),

            // Master signals
            .i_AVIn_Addr(i_AVIn_Addr),
            .i_AVIn_ByteEn(i_AVIn_ByteEn),
            .i_AVIn_Read(i_AVIn_Read),
            .i_AVIn_Write(i_AVIn_Write),
            .o_AVIn_ReadData(w_AV_ReadData[i]),
            .i_AVIn_WriteData(i_AVIn_WriteData),
            .o_AVIn_WaitRequest(w_AV_WaitRequest[i]),

            // Slave signals
            .o_AVOut_Addr(o_AVOut_Addr[30*i +: 30]),
            .o_AVOut_ByteEn(o_AVOut_ByteEn[4*i +: 4]),
            .o_AVOut_Read(o_AVOut_Read[i]),
            .o_AVOut_Write(o_AVOut_Write[i]),
            .i_AVOut_ReadData(i_AVOut_ReadData[32*i +: 32]),
            .o_AVOut_WriteData(o_AVOut_WriteData[32*i +: 32]),
            .i_AVOut_WaitRequest(i_AVOut_WaitRequest[i])
        );
    end

    // Slave to Master loop back
    for (i = 0; i < NUM_MASTERS; i = i + 1) begin : loopBack
        always @(*) begin
            o_AVIn_ReadData[32*i +: 32] <= 0;
            o_AVIn_WaitRequest[i] <= 1;

            if (w_Gnt[i][0]) begin
                o_AVIn_ReadData[32*i +: 32] <= w_AV_ReadData[0][32*i +: 32];
                o_AVIn_WaitRequest[i] <= w_AV_WaitRequest[0][i];
            end else if (w_Gnt[i][1]) begin
                o_AVIn_ReadData[32*i +: 32] <= w_AV_ReadData[1][32*i +: 32];
                o_AVIn_WaitRequest[i] <= w_AV_WaitRequest[1][i];
            end
        end
        
    end

endmodule