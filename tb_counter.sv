module tb_counter;

    // Parámetros
    parameter N = 8;

    // Señales
    reg clk, rst, en;
    wire [N-1:0] q;

    // Instanciar el módulo `counter`
    counter #(N) DUT (
        .clk(clk),
        .rst(rst),
        .en(en),
        .q(q)
    );

    // Generar el reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Periodo de reloj de 10 unidades de tiempo
    end

    // Estímulos
    initial begin
        // Inicialización de señales
        rst = 1;
        en = 0;
        #10;  // Mantener el reset activo durante un ciclo de reloj completo

        // Desactivar reset y activar enable
        rst = 0;
        en = 1;
        #50;  // Contar durante varios ciclos de reloj

        // Desactivar enable (el contador debe detenerse)
        en = 0;
        #30;

        // Reactivar enable (el contador debe reanudar)
        en = 1;
        #50;

        // Activar reset mientras `en` está activo (contador debe resetearse a 0)
        rst = 1;
        #10;
        rst = 0;
        #50;

        // Finalizar simulación
        $finish;
    end

    // Monitoreo
    initial begin
        $monitor("Time: %0t | clk: %b | rst: %b | en: %b | q: %h", 
                 $time, clk, rst, en, q);
    end

endmodule
