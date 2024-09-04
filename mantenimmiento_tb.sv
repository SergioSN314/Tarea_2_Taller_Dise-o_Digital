module mantenimmiento_tb;

    // Señales de entrada
    logic clk;
    logic rst;
    logic M;
    logic rst_manual;

    // Señales de salida
    logic [7:0] status;
    logic t0, error, en_cont, rst_timer;  // Señales internas para monitoreo

    // Instanciar el módulo `mantenimiento`
    mantenimiento DUT (
        .clk(clk),
        .rst(rst),
        .M(M),
        .rst_manual(rst_manual),
        .status(status)
    );

    // Generación de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Estímulos y pruebas
    initial begin
        rst = 1;
        M = 0;
        rst_manual = 0;

        // Reset inicial
        #15 rst = 0;

        // Caso 1: Mantenimiento realizado antes de 200 ciclos
        #20 M = 1;  // Presionar el botón
        #100 M = 0;  // Soltar el botón
        

        // Verificación
        if (status != 8'hFF && status != 8'd0) $display("Test 1 passed.");
        else $display("Test 1 failed.");

        // Caso 2: No se presiona el botón durante 200 ciclos
        #200;
        if (status == 8'hFF) $display("Test 2 passed.");
        else $display("Test 2 failed.");

        // Reset manual
        rst_manual = 1;
        #100 rst_manual = 0;
		  #20;

        if (status == 8'd0) $display("Test 3 passed.");
        else $display("Test 3 failed.");

        $finish;
    end

    // Monitoreo
    initial begin
        $monitor("Time: %0t | rst: %b | M: %b | rst_manual: %b | status: %h", 
                 $time, rst, M, rst_manual, status);
        // Monitoreo de señales internas
        $monitor("error: %b | en_cont: %b | rst_timer: %b | t0: %b",
                 error, en_cont, rst_timer, t0);
    end

endmodule
