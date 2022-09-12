module Final_FSM_Intermitentes (input clk, input reset, input E, input [1:0] ADI, output reg clk1s, output reg D, output reg I, output reg [1:0] Status);

/*
PROGRAMA DE INTERMITENTES CON SEÑAL DE RELOJ DE 1 SEGUNDO RESUELTO POR MAQUINA DE ESTADOS DE MOORE


Entradas:		clk: Reloj de tarjeta (50 MHz)
					reset: Botón de reinicio
					ADI: Palanca que indica Apagado (00) , Derecha (10), Izquierda (01), Nada (11)
					E: Botón de emergencia (Prioridad)														
			
Salidas:			clk1s: Reloj de 1 segundo (1 Hz) para la intermitencia de las salidas y estados
					D: Luz derecha se enciende de manera intermitente con clk1s
					I: Luz izquierda se enciende de manera intermitente con clk1s
					Status: Indica en que estado se encuentra el sistema
*/

localparam		S0 = 2'b00,	//Estado 0 (Apagado), ambas luces apagadas
					S1 = 2'b01,	//Estado 1 (Derecha). luz derecha encendida intermitentemente
					S2 = 2'b10, //Estado 2 (Izquierda), luz izquierda encendida intermitentemente
					S3 = 2'b11; //Estado 3 (Emergencia), ambas luces encendidas intermitentemente
		
		
reg [1:0] act_st;		//Estado actual
reg [1:0] nxt_st;	 	//Estado siguiente
reg [24:0] count; 	//Cuenta para reloj 1 seg (25 bits para cumplir el conteo)
reg [1:0] LED_count;	//Cuenta para la intermitencia de luces
reg Intermitente;		//Variables para intermitencia (Derecha e Izquierda)


//SEÑAL DE RELOJ DE 1 SEGUNDO
always @ (posedge clk)
begin
count = count+1;

	if (count == 25'd24999999) //El reloj de la tarjeta debe contar hasta 25,000,000 para cumplir medio ciclo de 1 seg
		begin
			count = 25'd0;
			clk1s = ~clk1s;		//Después de cumplir la cuenta, se invierte para cumplir la otra mitad del periodo y formar el segundo completo
		end
end


//BLOQUE DE TRANSICIÓN
always @(posedge clk1s)
begin
	if (reset==1'b1)		//Si reset=1 entonces el estado actual se vuelve estado inicial
		begin
			act_st = S0;
		end
	else						//Si reset=0 entonces el estado actual se vuelve el estado siguiente
		begin
			act_st = nxt_st;
		end	
end



//BLOQUE DE ESTADO SIGUIENTE
always @(*)			//Siempre se ejecuta
begin
nxt_st = act_st;

	case (act_st)  //Case para las condiciones de transicion de estados segun cada caso (Tabla de estados)

					S0:	begin
								if (ADI==2'b00 & E==0)	//Si Palanca=Apagado y Emergencia=Apagado
									begin
										nxt_st = S0;		//S0 se dirige a S0
									end
								
								if (ADI==2'b01 & E==0)	//Si Palanca=Derecha y Emergencia=Apagado
									begin
										nxt_st = S1;		//S0 se dirige a S1
									end
								
								if (ADI==2'b10 & E==0)	//Si Palanca=Izquierda y Emergencia=Apagado
									begin
										nxt_st = S2;		//S0 se dirige a S2
									end
					
								if (ADI==2'b11 & E==0)	//Si Palanca=Basura(Nada) y Emergencia=Apagado
									begin
										nxt_st = S0;		//S0 se dirige a S0
									end
								
								if (ADI==2'b00 & E==1)	//Si Palanca=Apagado y Emergencia=Encendido
									begin
										nxt_st = S3;		//S0 se dirige a S3
									end
								
								if (ADI==2'b01 & E==1)	//Si Palanca=Derecha y Emergencia=Encendido
									begin
										nxt_st = S3;		//S0 se dirige a S3
									end
								
								if (ADI==2'b10 & E==1)	//Si Palanca=Izquierda y Emergencia=Encendido
									begin
										nxt_st = S3;		//S0 se dirige a S3
									end
							
								if (ADI==2'b11 & E==1)	//Si Palanca=Basura(Nada) y Emergencia=Encendido
									begin
										nxt_st = S3;		//S0 se dirige a S3
									end
							end
					
					
					S1:	begin								//Son las mismas condiciones para cada estado 
								if (ADI==2'b00 & E==0)
									begin
										nxt_st = S0;
									end
								
								if (ADI==2'b01 & E==0)
									begin
										nxt_st = S1;
									end
								
								if (ADI==2'b10 & E==0)
									begin
										nxt_st = S2;
									end
					
								if (ADI==2'b11 & E==0)
									begin
										nxt_st = S0;
									end
								
								if (ADI==2'b00 & E==1)
									begin
										nxt_st = S3;
									end
								
								if (ADI==2'b01 & E==1)
									begin
										nxt_st = S3;
									end
								
								if (ADI==2'b10 & E==1)
									begin
										nxt_st = S3;
									end
							
								if (ADI==2'b11 & E==1)
									begin
										nxt_st = S3;
									end
							end
					
					
					S2:	begin
								if (ADI==2'b00 & E==0)
									begin
										nxt_st = S0;
									end
								
								if (ADI==2'b01 & E==0)
									begin
										nxt_st = S1;
									end
								
								if (ADI==2'b10 & E==0)
									begin
										nxt_st = S2;
									end
					
								if (ADI==2'b11 & E==0)
									begin
										nxt_st = S0;
									end
								
								if (ADI==2'b00 & E==1)
									begin
										nxt_st = S3;
									end
								
								if (ADI==2'b01 & E==1)
									begin
										nxt_st = S3;
									end
								
								if (ADI==2'b10 & E==1)
									begin
										nxt_st = S3;
									end
							
								if (ADI==2'b11 & E==1)
									begin
										nxt_st = S3;
									end
							end
					
					
					S3:	begin
								if (ADI==2'b00 & E==0)
									begin
										nxt_st = S0;
									end
								
								if (ADI==2'b01 & E==0)
									begin
										nxt_st = S1;
									end
								
								if (ADI==2'b10 & E==0)
									begin
										nxt_st = S2;
									end
					
								if (ADI==2'b11 & E==0)
									begin
										nxt_st = S0;
									end
								
								if (ADI==2'b00 & E==1)
									begin
										nxt_st = S3;
									end
								
								if (ADI==2'b01 & E==1)
									begin
										nxt_st = S3;
									end
								
								if (ADI==2'b10 & E==1)
									begin
										nxt_st = S3;
									end
							
								if (ADI==2'b11 & E==1)
									begin
										nxt_st = S3;
									end
							end

	endcase
end


//BLOQUE DE INTERMITENCIA
always @(posedge clk1s)			//Depende de clk1s ya que la intermitencia debe estar sincronizada con este
begin
LED_count = LED_count+1;
Intermitente = 1'b0;

			if (LED_count==2'b01)		//Cuando LED_count=1 entonces la intermitente se prende
				begin
					Intermitente = 1'b1;
				end
				
			if (LED_count==2'b10)		//Cuando LED_count=2 entonces la intermitente se apaga
				begin
					Intermitente = 1'b0;
					LED_count = 2'b00;	//Se reinicia para seguir prendiendo y apagando
				end
end


//BLOQUE DE SALIDA
always @(*)
begin
D = 1'b0;
I = 1'b0;
Status = 2'b00;

	case (act_st)		//Case para las salidas en cada estado, estas no dependen de las entradas ya que es Maquina de Moore
	
					S0:	begin						//En S0(Apagado), todo se encuentra apagado
								D = 1'b0;	
								I = 1'b0;
								Status = S0;		//Indica el estado actual
							end
					
					
					S1:	begin						//En S1(Derecha), la salida 'Derecha' realiza intermitencia
								D = Intermitente;	//Se incorpora la salida de la intermitencia realizada en el bloque anterior
								I = 1'b0;
								Status = S1;		//Indica el estado actual
							end
					
					
					S2:	begin						//En S2(Izquierda), la salida 'Izquierda' realiza intermitencia
								D = 1'b0;			
								I = Intermitente;
								Status = S2;		//Indica el estado actual
							end
					
					S3:	begin						//En S3(Emergencia), ambas salidas 'derecha' e 'izquierda' realizan intermitencia simultaneamente
								D = Intermitente;
								I = Intermitente;
								Status = S3;		//Indica el estado actual
							end
	
	endcase
end


//BLOQUE DE INICIALIZACIÓN
initial		//Se inicializan los valores para la simulacion con ModelSim (TestBench)
begin
	count = 25'd0;
	LED_count = 2'b00;
	D = 1'b0;
	I = 1'b0;
	Intermitente = 1'b0;
	Status = 2'b00;
	act_st = 2'b00;
	nxt_st = 2'b00;
	clk1s = 1'b0;
end

endmodule
