module mantenimiento (input  clk, rst, M, rst_manual, output  [7:0] status);

	logic t_0, error, en_count, rst_timer;
	logic [7:0] out_mantenimiento, out_ciclos, out_mux;
	
	fsm control(clk, rst, M, t_0, rst_manual, error, en_count, rst_timer);

	counter mant(clk, rst, en_count, out_mantenimiento);
	
	counter ciclos(clk, rst | rst_timer, 1'b1, out_ciclos);
	
	mux_2_to_1 mux21 (out_mantenimiento, 8'hFF, error, out_mux);
	
	comparator cmp (out_ciclos, 8'd200, t_0);
	
	register state_reg (clk, rst, out_mux , status);
	
endmodule