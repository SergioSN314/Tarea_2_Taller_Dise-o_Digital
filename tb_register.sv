module tb_register;

    // Parámetros
    parameter N = 8;

    // Señales
    reg clk;
    reg rst;
    reg [N-1:0] D;
    wire [N-1:0] Q;

    // Instanciar el módulo `register`
    register #(N) DUT (
        .clk(clk),
        .rst(rst),
        .D(D),
        .Q(Q)
    );

    // Generación de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Periodo del reloj de 10 unidades de tiempo
    end

    // Estímulos
    initial begin
        // Inicialización
        rst = 1;
        D = 8'hAA;

        // Espera para asegurar el reset
        #10;
        rst = 0;

        // Aplicar datos a la entrada D
        #10;
        D = 8'h55;

        // Otro conjunto de datos
        #10;
        D = 8'hF0;

        // Activar reset nuevamente
        #10;
        rst = 1;

        // Desactivar reset
        #10;
        rst = 0;
        D = 8'h0F;

        // Finalizar simulación
        #20;
        $finish;
    end

    // Monitoreo
    initial begin
        $monitor("Time: %0t | clk: %b | rst: %b | D: %h | Q: %h", 
                 $time, clk, rst, D, Q);
    end

endmodule
