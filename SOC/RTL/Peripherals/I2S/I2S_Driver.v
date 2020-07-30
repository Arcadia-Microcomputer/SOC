module I2S_Driver (
    input i_MasterClk,
    
    input [23:0]i_LeftData,
    input [23:0]i_RightData,
    output reg o_ReqNextData,

    output reg o_SDIN,
    output o_SCLK,
    output o_LRCK,
    output o_MCLK
    );

    //Clock forward the MCLK
    ODDR2 #(
        .DDR_ALIGNMENT("NONE"),
        .INIT(1'b0),
        .SRTYPE("SYNC")
    ) ODDR2_inst (
        .Q(o_MCLK),
        .C0(i_MasterClk),
        .C1(~i_MasterClk),
        .D0(1'b1),
        .D1(1'b0)
    );

    //LRCK Divider
    Power2Div #(
		.POWER_OF_2_DIV(256)
	)LRCK_Power2Div(
		.i_Clk(i_MasterClk),
		.o_DivClk(o_LRCK)
	);

    //SCLK Divider
    Power2Div #(
		.POWER_OF_2_DIV(4)
	)SCLK_Power2Div(
		.i_Clk(i_MasterClk),
		.o_DivClk(o_SCLK)
	);

    localparam STATE_SIZE = 1;
    localparam IDLE = 0,
               CLOCK_OUT_DATA = 1;
    reg [STATE_SIZE-2:0] FSM_state = IDLE;

    reg r_OldLRCK = 0;
    reg [4:0]r_BitCounter = 0;
    
    always @(negedge o_SCLK)begin
        r_OldLRCK <= o_LRCK;
        o_ReqNextData <= 0;

        case (FSM_state)
            IDLE:begin
                if(r_OldLRCK != o_LRCK)begin
                    FSM_state <= CLOCK_OUT_DATA;
                    r_BitCounter <= 23;
                end
            end
            CLOCK_OUT_DATA:begin
                r_BitCounter <= r_BitCounter - 1;

                if(r_BitCounter == 0)begin
                   FSM_state <= IDLE; 

                   if(o_LRCK)begin
                       //Finished shifting out the left/right data so request new data
                       o_ReqNextData <= 1;
                   end
                end

                if(o_LRCK)begin
                    //Shift out the right channel data
                    o_SDIN <= i_RightData[r_BitCounter];
                end else begin
                    //Shift out the left channel data
                    o_SDIN <= i_LeftData[r_BitCounter];
                end
            end
        endcase
    end

endmodule