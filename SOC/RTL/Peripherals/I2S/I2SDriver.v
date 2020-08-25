module I2SDriver (
    input i_MasterClk,
    
    input [23:0]i_LeftData,
    input [23:0]i_RightData,
    output reg o_ReqNextData,

    output reg o_SDIN,
    output o_SCLK,
    output reg o_LRCK,
    output o_MCLK
    );

    localparam SCLK_DIV = 4;
    localparam LRCK_DIV = 256;

    initial begin
        o_SDIN = 0;
    end

    wire w_SCLK;
    wire w_LRCK;

    //Clock forward the MCLK
    ODDR2 #(
        .DDR_ALIGNMENT("NONE"),
        .INIT(1'b0),
        .SRTYPE("SYNC")
    ) ODDR2_MCLK (
        .Q(o_MCLK),
        .C0(i_MasterClk),
        .C1(~i_MasterClk),
        .D0(1'b1),
        .D1(1'b0)
    );

    //LRCK Divider
    Power2Div #(
		.POWER_OF_TWO_DIV(LRCK_DIV/SCLK_DIV)
	)LRCK_Power2Div(
		.i_Clk(w_SCLK),
		.o_DivClk(w_LRCK)
	);

    //SCLK Divider
    Power2Div #(
		.POWER_OF_TWO_DIV(SCLK_DIV)
	)SCLK_Power2Div(
		.i_Clk(i_MasterClk),
		.o_DivClk(w_SCLK)
	);

    ODDR2 #(
        .DDR_ALIGNMENT("NONE"),
        .INIT(1'b0),
        .SRTYPE("SYNC")
    ) ODDR2_SCLK (
        .Q(o_SCLK),
        .C0(w_SCLK),
        .C1(~w_SCLK),
        .D0(1'b0),
        .D1(1'b1)
    );

    localparam STATE_SIZE = 1;
    localparam IDLE = 0,
               CLOCK_OUT_DATA = 1;
    reg [STATE_SIZE-1:0] FSM_state = IDLE;

    reg r_OldLRCK = 0;
    reg [4:0]r_BitCounter = 0;
    
    always @(posedge w_SCLK)begin
        o_LRCK <= w_LRCK;
        r_OldLRCK <= w_LRCK;
        o_ReqNextData <= 0;
        
        case (FSM_state)
            IDLE:begin
                if(r_OldLRCK != w_LRCK)begin
                    FSM_state <= CLOCK_OUT_DATA;
                    r_BitCounter <= 23;
                end
            end
            CLOCK_OUT_DATA:begin
                if(r_BitCounter == 0)begin
                   FSM_state <= IDLE; 

                   if(w_LRCK)begin
                       //Finished shifting out the left/right data so request new data
                       o_ReqNextData <= 1;
                   end
                end else begin
					r_BitCounter <= r_BitCounter - 1;
				end

                if(w_LRCK)begin
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