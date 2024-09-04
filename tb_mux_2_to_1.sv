module tb_mux_2_to_1();

    // Parámetros
    parameter N = 8;

    // Señales
    logic [N-1:0] A, B;
    logic sel;
    logic [N-1:0] C;

    // Instanciar el módulo `mux_2_to_1`
    mux_2_to_1 #(N) DUT (
        .A(A),
        .B(B),
        .sel(sel),
        .C(C)
    );

    // Estímulos
    initial begin
        // Inicialización de señales
        A = 8'hAA;
        B = 8'h55;
        sel = 0;

        // Probar sel = 0 (C debería ser igual a A)
        #10;
        sel = 0;
        $display("sel = 0, C = %h (esperado: %h)", C, A);

        // Probar sel = 1 (C debería ser igual a B)
        #10;
        sel = 1;
        $display("sel = 1, C = %h (esperado: %h)", C, B);

        // Cambiar entradas y probar nuevamente
        #10;
        A = 8'hF0;
        B = 8'h0F;
        sel = 0;
        $display("sel = 0, C = %h (esperado: %h)", C, A);

        #10;
        sel = 1;
        $display("sel = 1, C = %h (esperado: %h)", C, B);

        // Finalizar simulación
        #20;
        $finish;
    end

    // Monitoreo
    initial begin
        $monitor("Time: %0t | A: %h | B: %h | sel: %b | C: %h", 
                 $time, A, B, sel, C);
    end

endmodule
