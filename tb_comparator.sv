module tb_comparator;

    // Parámetros
    parameter N = 8;

    // Señales
    logic [N-1:0] A, B;
    logic equal;

    // Instanciar el módulo `comparator`
    comparator #(N) DUT (
        .A(A),
        .B(B),
        .equal(equal)
    );

    // Estímulos
    initial begin
        // Test 1: A == B
        A = 8'hAA;
        B = 8'hAA;
        #5;  // Esperar a que se propaguen las señales
        $display("Test 1: A = %h, B = %h, equal = %b (esperado: 1)", A, B, equal);

        // Test 2: A > B
        A = 8'hFF;
        B = 8'h0F;
        #5;  // Esperar a que se propaguen las señales
        $display("Test 2: A = %h, B = %h, equal = %b (esperado: 0)", A, B, equal);

        // Test 3: A < B
        A = 8'h01;
        B = 8'h10;
        #5;  // Esperar a que se propaguen las señales
        $display("Test 3: A = %h, B = %h, equal = %b (esperado: 0)", A, B, equal);

        // Test 4: A == B (ambos en 0)
        A = 8'h00;
        B = 8'h00;
        #5;  // Esperar a que se propaguen las señales
        $display("Test 4: A = %h, B = %h, equal = %b (esperado: 1)", A, B, equal);

        // Test 5: A y B con valores aleatorios
        A = 8'h5A;
        B = 8'hA5;
        #5;  // Esperar a que se propaguen las señales
        $display("Test 5: A = %h, B = %h, equal = %b (esperado: 0)", A, B, equal);

        // Finalizar simulación
        #10;
        $finish;
    end

    // Monitoreo
    initial begin
        $monitor("Time: %0t | A: %h | B: %h | equal: %b", 
                 $time, A, B, equal);
    end

endmodule
