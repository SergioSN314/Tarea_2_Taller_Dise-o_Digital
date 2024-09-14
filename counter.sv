module counter #(parameter N=8)(input logic clk, rst, en,  output logic [N-1:0] q);

always_ff @(negedge clk or posedge rst) begin
	if (rst) q= 8'h0;
	else
		if (en) q=q+1'b1;
	end
		


endmodule