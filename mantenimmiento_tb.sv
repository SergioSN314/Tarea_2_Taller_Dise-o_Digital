module mantenimmiento_tb;
	logic clk, rst, M, rst_manual;
	logic [7:0] status;
	// Instancia del módulo Mantenimiento
	mantenimiento dut (
		.clk(clk),
		.rst(rst),
		.M(M),
		.rst_manual(rst_manual),
		.status(status)
		);
		
	// Generador de reloj
	initial begin 
		clk = 0;
		forever #5 clk = ~clk; // Periodo de reloj de 10 unidades de tiempo
	end
	
	initial begin
		// Reset inicial
		rst = 1;
		rst_manual = 0;
		M = 0;
		
		#10;
		rst = 0;
		
		#3000;
		
		rst_manual = 1; #20;// Activar reset manual cuando hay error
		
		
		rst_manual = 0; #20;// Desactivar reset manual
		
		// Primer ciclo de mantenimiento
		#100;     // Esperar unos ciclos
		M = 1;    // Activar M
		#20;
		M = 0;    // Desactivar M
		
		// Segundo ciclo de mantenimiento
		#100;     // Esperar unos ciclos
		M = 1;    // Activar M nuevamente
		#20;
		M = 0;    // Desactivar M
		// Esperar hasta que se produzca el error 
		
		#4000;
		
		rst_manual = 1; #20;// Activar otra vez el reset manual cuando hay error
		
		
		rst_manual = 0; #20;// Desactivar reset manual
		
		// Continuar contando después del reset manual
		
		// Tercer ciclo de mantenimiento
		#100;     // Esperar unos ciclos
		M = 1;    // Activar M después del reset manual
		#20;
		M = 0;
		
		// Verificar si se vuelve a presentar otro error, esperando 200 ciclos
		
		#2100;
		// Terminar simulación
		$finish;
	end
	
	
endmodule