module fsm (
    input  clk, rst, M, t_0, rst_manual,
    output   error, en_count, rst_timer
);

    logic [1:0] state, next_state;

    // Actual state
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= 2'b00;
        else
            state <= next_state;
    end

    // Next state logic
    always_comb begin
        case (state)
            2'b00: if (M) next_state = 2'b01; 
                   else   next_state = 2'b10;

            2'b01: next_state = 2'b00;

            2'b10: if (t_0) next_state = 2'b11; 
                   else     next_state = 2'b00;

            2'b11: if (rst_manual) next_state = 2'b00; 
                   else             next_state = 2'b11;

            default: next_state = 2'b00;
        endcase
    end

    // Outputs
    assign error = (state == 2'b11);
    assign en_count = (state == 2'b01);
    assign rst_timer = (state == 2'b01);

endmodule
