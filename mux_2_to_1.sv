module mux_2_to_1 #(parameter N=8)(input logic [N-1:0] A, B, input logic sel, output logic [N-1:0] C);

assign C=sel ? B :A;

endmodule 