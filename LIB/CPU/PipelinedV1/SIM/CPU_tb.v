`timescale 1ns / 1ps

module CPU_tb();
    reg r_Clk = 0;

    //CPU Instuction Bus
    wire [29:0]w_AV_IBus_Addr;
    wire w_AV_IBus_Read;
    wire [31:0]w_AV_IBus_ReadData;
    reg r_AV_IBus_WaitRequest = 0;
    wire [7:0]w_AV_IBus_BurstCount = 1;

    //CPU Data Bus
    wire [29:0]w_AV_DBus_Addr;
    wire [3:0]w_AV_DBus_ByteEn;
    wire w_AV_DBus_Read;
    wire [31:0]w_AV_DBus_ReadData;
    wire w_AV_DBus_Write;
    wire [31:0]w_AV_DBus_WriteData;
    reg r_AV_DBus_WaitRequest = 0;

    //Instruction rom
    parameter IR_DEPTH = 32;
    reg [31:0]Ram[IR_DEPTH - 1:0];
    reg [31:0]r_ID_ReadData = 0;

    integer i;
    integer numRamUsed;
    initial begin
Ram[0] = 32'hb0000137;
Ram[1] = 32'h00500213;
Ram[2] = 32'h00000293;
Ram[3] = 32'h00210023;
Ram[4] = 32'h00128293;
Ram[5] = 32'hfe521ce3;
Ram[6] = 32'h00002183;
Ram[7] = 32'h00310023;
Ram[8] = 32'h0000006f;
numRamUsed = 9;
        for(i = numRamUsed; i < IR_DEPTH; i = i + 1)begin
            Ram[i] = 0;
        end
    end

    // Data RAM
    parameter DR_DEPTH = 16;
    reg [31:0]r_DRam[DR_DEPTH - 1:0];
    reg [31:0]r_DR_ReadData = 0;

    initial begin
        r_DRam[0] = 8;
        for(i = 1; i < DR_DEPTH; i = i + 1)begin
            r_DRam[i] = 0;
        end
    end

    //Generate the clock
    initial begin
        #10;
        forever #10 r_Clk = ~r_Clk;
    end
    
    CPU #(
        .INITIAL_PC_VALUE(32'h0000000)
    )DUT_CPU(
        .i_Clk(r_Clk),

        //IBus Master
        .o_IBus_Address(w_AV_IBus_Addr),
        .o_IBus_Read(w_AV_IBus_Read),
        .i_IBus_ReadData(w_AV_IBus_ReadData),
        .i_IBus_WaitReq(r_AV_IBus_WaitRequest),

        //DBus Master        
        .o_DBus_Address(w_AV_DBus_Addr),
        .o_DBus_ByteEn(w_AV_DBus_ByteEn),
        .o_DBus_Read(w_AV_DBus_Read),
        .o_DBus_Write(w_AV_DBus_Write),
        .i_DBus_ReadData(w_AV_DBus_ReadData),
        .o_DBus_WriteData(w_AV_DBus_WriteData),
        .i_DBus_WaitRequest(r_AV_DBus_WaitRequest)
    );

    reg [3:0]r_counter = 0;
    wire [3:0]w_counter_plus;
    assign w_counter_plus = r_counter + 1;

    reg r_Old_AV_IBus_WaitRequest = 0;
    reg r_Old_AV_DBus_WaitRequest = 0;

    reg r_Old_AV_IBus_Read = 0;
    reg r_Old_AV_DBus_Read = 0;

    always @(*) begin
        r_AV_IBus_WaitRequest <= 0;
        r_AV_DBus_WaitRequest <= 0;

        //I Rom wait req
        if(w_AV_IBus_Addr[29] == 0)begin
            if(w_AV_IBus_Read)begin
                r_AV_IBus_WaitRequest <= 0; //r_counter[1];
            end
        end

        //D Ram Wait req
        if(w_AV_DBus_Addr[29] == 1)begin
            if(w_AV_DBus_Read || w_AV_DBus_Write)begin
                r_AV_DBus_WaitRequest <= 0; //r_counter[2];
            end
        end
    end

    assign w_AV_IBus_ReadData = (r_Old_AV_IBus_WaitRequest && !(r_Old_AV_IBus_WaitRequest && !r_AV_IBus_WaitRequest)) |
                                (!r_Old_AV_IBus_Read && !r_AV_IBus_WaitRequest) ? 32'b0: r_ID_ReadData;

    assign w_AV_DBus_ReadData = (r_Old_AV_DBus_WaitRequest && !(r_Old_AV_DBus_WaitRequest && !r_AV_DBus_WaitRequest)) |
                                (!r_Old_AV_DBus_Read && !r_AV_DBus_WaitRequest)? 32'b0: r_DR_ReadData;

    always @(posedge r_Clk) begin
        r_Old_AV_IBus_WaitRequest <= r_AV_IBus_WaitRequest;
        r_Old_AV_DBus_WaitRequest <= r_AV_DBus_WaitRequest;

        r_Old_AV_IBus_Read <= w_AV_IBus_Read;
        r_Old_AV_DBus_Read <= w_AV_DBus_Read;

        r_DR_ReadData <= 0;
        r_ID_ReadData <= 0;

        r_counter <= r_counter + 1;

        // Instruction rom
        if(w_AV_IBus_Addr[29] == 0)begin
            if(w_AV_IBus_Read)begin
                r_ID_ReadData <= Ram[w_AV_IBus_Addr[$clog2(IR_DEPTH)-1:0]];
            end 
        end
        
        // Data ram
        if(w_AV_DBus_Addr[29] == 0)begin
            if(w_AV_DBus_Read)begin
                r_DR_ReadData <= r_DRam[w_AV_DBus_Addr[$clog2(DR_DEPTH)-1:0]];
            end else if(w_AV_DBus_Write && !r_AV_DBus_WaitRequest) begin
                if(w_AV_DBus_ByteEn[0]) r_DRam[w_AV_DBus_Addr[$clog2(DR_DEPTH)-1:0]][7:0]   <= w_AV_DBus_WriteData[7:0];
                if(w_AV_DBus_ByteEn[1]) r_DRam[w_AV_DBus_Addr[$clog2(DR_DEPTH)-1:0]][15:8]  <= w_AV_DBus_WriteData[15:8];
                if(w_AV_DBus_ByteEn[2]) r_DRam[w_AV_DBus_Addr[$clog2(DR_DEPTH)-1:0]][23:16] <= w_AV_DBus_WriteData[23:16];
                if(w_AV_DBus_ByteEn[3]) r_DRam[w_AV_DBus_Addr[$clog2(DR_DEPTH)-1:0]][31:24] <= w_AV_DBus_WriteData[31:24];
            end
        end
        
    end

endmodule
