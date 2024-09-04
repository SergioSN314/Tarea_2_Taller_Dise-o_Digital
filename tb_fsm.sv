module tb_fsm;

    // Señales
    logic clk, rst, M, t0, rst_manual;
    logic error, en_cont, rst_timer;

    // Instanciar el módulo `fsm`
    fsm DUT (
        .clk(clk),
        .rst(rst),
        .M(M),
        .t0(t0),
        .rst_manual(rst_manual),
        .error(error),
        .en_cont(en_cont),
        .rst_timer(rst_timer)
    );

    // Generación del reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Periodo de reloj de 10 unidades de tiempo
    end

    // Estímulos
    initial begin
        // Inicialización de señales
        rst = 1; M = 0; t0 = 0; rst_manual = 0;
        #10;  // Mantener el reset activo durante un ciclo de reloj completo

        // Desactivar reset, sin presionar M (debe ir al estado 2'b10)
        rst = 0;
        #10;
        if (DUT.state !== 2'b10) $display("Error: Esperaba el estado 2'b10, pero fue %b", DUT.state);

        // Simular la presión del botón M (debe ir al estado 2'b01)
        M = 1;
        #50;
        if (DUT.state !== 2'b01) $display("Error: Esperaba el estado 2'b01, pero fue %b", DUT.state);

        // Regresar a estado inicial y activar t0 (debe ir al estado 2'b11)
        M = 0; t0 = 1;
        #50;
        if (DUT.state !== 2'b11) $display("Error: Esperaba el estado 2'b11, pero fue %b", DUT.state);

        // Probar reset manual desde el estado 2'b11 (debe regresar al estado 2'b00)
        rst_manual = 1;
        #50;
        if (DUT.state !== 2'b00) $display("Error: Esperaba el estado 2'b00, pero fue %b", DUT.state);
		  
		  rst_manual = 0;
		  #50

        // Finalizar simulación
        $finish;
    end

    // Monitoreo
    initial begin
        $monitor("Time: %0t | state: %b | M: %b | t0: %b | rst_manual: %b | error: %b | en_cont: %b | rst_timer: %b",
                 $time, DUT.state, M, t0, rst_manual, error, en_cont, rst_timer);
    end

endmodule
