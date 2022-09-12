module E10_FSM1(input Reset, input clk, input x, output reg z, output reg [2:0] status);

localparam 	Estado_inicial = 3'b000,
				Estado_1 = 3'b001,
				Estado_2 = 3'b010,
				Estado_3 = 3'b011,
				Estado_4 = 3'b100,
				Estado_bas5 = 3'b101,
				Estado_bas6 = 3'b110,
				Estado_bas7 = 3'b111;

				
reg [2:0] EstadoActual;
reg [2:0] EstadoSiguiente;

// Bloque de Transicion

always @(posedge clk)
begin
if (Reset==1'b1) 
	EstadoActual=Estado_inicial;
else
	EstadoActual = EstadoSiguiente;
end

//Bloque de estado siguiente
always @(*)
begin
	EstadoSiguiente = EstadoActual;
	
	case (EstadoActual) 
		Estado_inicial: 	begin
									if (x==1'b1)
										EstadoSiguiente=Estado_1;
								end
								
		Estado_1:			begin
									if (x==1'b0)
										EstadoSiguiente=Estado_2;
								end
								
		Estado_2:			begin
									if (x==1'b0)
										EstadoSiguiente=Estado_3;
									else
										EstadoSiguiente=Estado_1;
								end
								
		Estado_3: 			begin
									if (x==1'b0)
										EstadoSiguiente=Estado_inicial;
									else
										EstadoSiguiente=Estado_4;
								end
								
		Estado_4: 			begin
									if (x==1'b0)
										EstadoSiguiente=Estado_2;
									else 
										EstadoSiguiente=Estado_1;
								end
								
		Estado_bas5: 		begin
									EstadoSiguiente=Estado_inicial;
								end
								
		Estado_bas6: 		begin
									EstadoSiguiente=Estado_inicial;
								end
								
		Estado_bas7: 		begin
									EstadoSiguiente=Estado_inicial;
								end


	endcase
	
end

//Bloque de Salida
always @(*)
begin
	z=1'b0;
	status=3'b000;
	case (EstadoActual) 
		Estado_inicial: 	begin
									z=1'b0;
									status=Estado_inicial;
								end
		Estado_1:			begin
									z=1'b0;
									status=Estado_1;
								end
		Estado_2:			begin
									z=1'b0;
									status=Estado_2;
								end
		Estado_3: 			begin
									z=1'b0;
									status=Estado_3;
								end
		Estado_4: 			begin
									z=1'b1;
									status=Estado_4;
								end
	endcase
	
end

initial
begin
	z=1'b0;
	EstadoActual=3'b000;
	EstadoSiguiente=3'b000;
end

endmodule
