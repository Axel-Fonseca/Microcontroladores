`timescale 1 ns/10 ps	//Escala de tiempo 1 nanosegundo

module TB_Inter;

//Se toman las mismas entradas y salidas del programa principal, todas las entradas se declaran como reg y las salidas como wire
wire Reloj_1seg, Derecha, Izquierda;	//Se cambia el nombre si desea para la simulacion
wire [1:0] Estado;
reg clk, Reset, Emergencia;
reg [1:0] Palanca;

//Se realiza una iteracion con el programa principal realizando las conexiones y se agrega 'DUT1'
Final_FSM_Intermitentes DUT1 (.clk(clk), .reset(Reset), .E(Emergencia), .ADI(Palanca), .clk1s(Reloj_1seg), .D(Derecha), .I(Izquierda), .Status(Estado));


localparam	med_periodo = 10,			//constante de 10 ns, es decir medio ciclo de reloj de 50 MHz
		cambio = 49999999*(2*med_periodo);	//constante que equivale a 1 segundos debido a los calculos realizados

always
#med_periodo clk = ~clk;				//Señal de reloj de 50MHz

initial
begin
//Se declaran las entradas y los tiempos de simulacion
	Reset = 1'b0;		//Reset=Apagado
	clk = 1'b0;		//clk=empieza en cero
	Palanca = 2'b00;	//Palanca=Apagada
	Emergencia = 1'b0;	//Emergencia=Apagada
	#249999990;		//0.5 segundos de retraso para identificar los cambios como Maquina de Moore

	Palanca = 2'b01; 	//Luz derecha
	Emergencia = 1'b0;	//Emergencia apagado
	#cambio;		
	#cambio;		
	#cambio;
	#cambio;		//4 cambios=4 segundos

	Palanca = 2'b10; 	//Luz izquierda
	Emergencia = 1'b0;	//Emergencia apagado
	#cambio;
	#cambio;		//2 segundos


	Palanca = 2'b00; 	//Ambas luces apagadas
	Emergencia = 1'b1;	//Emergencia encendido
	#cambio;
	#cambio;
	#cambio;		//3 segundos

	Palanca = 2'b01; 	//Luz derecha
	Emergencia = 1'b0;	//Emergencia apagado
	#cambio;
	#cambio;		//2 segundos

	Palanca = 2'b01; 	//Luz derecha
	Emergencia = 1'b1;	//Emergencia encendido
	#cambio;
	#cambio;		//2 segundos

	Palanca = 2'b10; 	//Luz izquierda
	Emergencia = 1'b1;	//Emergencia encendido			
	#cambio;
	#cambio;		//2 segundos
	
	Reset = 1'b1;		//Reset=encendido
end

endmodule
