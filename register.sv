module register #(parameter N=8)( input logic  clk, rst, input logic [N-1:0] D, output logic [N-1:0] Q);

always_ff @(posedge clk or posedge rst)
	if (rst) Q= 8'h00;
	else
		Q<=D;
		
endmodule