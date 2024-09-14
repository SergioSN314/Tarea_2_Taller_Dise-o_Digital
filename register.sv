module register #(parameter N=8)( input  logic clk, rst, input logic [N-1:0] D, output logic [N-1:0] Q);

always_ff @(negedge clk or posedge rst) begin
	if (rst) Q= 8'h00;
	else
		Q=D;
	end
		
endmodule