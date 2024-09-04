module fsm (input logic clk, rst, M, t0, rst_manual, 
				output logic error, en_cont, rst_timer);
	
	logic [1:0] state, next_state;
	
	//actual state
	
	always_ff @(posedge clk or posedge rst)
		if (rst) state =2'b00;
		else
			state<=next_state;
	
	//next state
	
	always_comb
		case(state)
			2'b00: if(M) next_state <= 2'b01; else next_state = 2'b10;
			2'b01: next_state <= 2'b00;
			2'b10: if(t0) next_state <= 2'b11; else next_state = 2'b00;
			2'b11: if(rst_manual) next_state <= 2'b00; else next_state = 2'b11;
			default next_state =2'b00;
		endcase
		
	//outputs
	assign error = (state==2'b11);
	assign en_cont = (state==2'b01);
	assign rst_timer = (state==2'b01);

endmodule