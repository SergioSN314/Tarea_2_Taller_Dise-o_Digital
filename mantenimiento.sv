module mantenimiento ( input logic clk, rst, M, rst_manual, 
							 output logic [7:0] status);
	
	logic t0, error, en_cont, rst_timer;
	logic out_mantenimiento, out_ciclos, out_mux;
	
	fsm control( clk, rst, M, t0, rst_manual, error, en_cont, rst_timer);
	counter #(8) mant ( clk, rst, en_cont,   out_mantenimiento);
	counter #(8) ciclos ( clk, rst|rst_timer, 1'b1,  out_ciclos);
	mux_2_to_1 #(8) mux21( out_mantenimiento, 8'hFF,  error,  out_mux);
	
	comparator #(8) cmp( out_ciclos, 8'd200,  t0);
	
	register #(8) state_reg( clk, rst, out_mux, status);
	
endmodule