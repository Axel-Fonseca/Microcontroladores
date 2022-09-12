  module P2_Reloj24_Bus(input clk, input [2:0] direccion, output reg [3:0] BUS);


// diseño del mapa de memoria de mi sistema

// Bus de Direccionamiento: 1.- El dispositivo a utilizar, 
//                          2.- Operacion a realizar
//  Bus de Datos            3.- Enviarle los datos necesarios para la operacion

// ***** Creacicion del bus de direcciones ******
//    Dispositivo     operacion		Uniseg	Decseg	Unimin	Decmin	Unihora	Dechora	
//      0 0 0           					Us			Z			Z			Z			Z			Z
//      0 0 1          						Z			Ds			Z			Z			Z			Z
//      0 1 0           					Z			Z			Um			Z			Z			Z
//      0 1 1           					Z			Z			Z			Dm			Z			Z
//      1 0 0           					Z			Z			Z			Z			Uh			Z
//      1 0 1           					Z			Z			Z			Z			Z			Dh


wire [2:0] codigo;

reg [3:0] Us, Um, Uh;
reg [2:0] Ds, Dm;
reg [1:0] Dh;

assign codigo[2] = direccion[2];
assign codigo[1] = direccion[1];
assign codigo[0] = direccion[0];



// ********** Contador de segundos, minutos y horas***********
always @(negedge clk)
begin
Us = Us+4'd1;
	if(Us>4'd9)
	begin
		Ds = Ds+3'b1;
		Us = 4'd0;
		
			if(Ds>3'd5)
			begin
				Um = Um+4'd1;
				Ds = 3'd0;
				
					if(Um>4'd9)
					begin
						Dm = Dm+3'd1;
						Um = 4'd0;
						
							if(Dm>3'd5)
							begin
								Uh = Uh+4'd1;
								Dm = 4'd0;
								
									if(Uh>4'd9)
									begin
										Dh = Dh+2'd1;
										Uh = 4'd0;
										
											if(Dh>1'd2 && Uh>4'd3)
											begin
				
													Us = 4'd0;
													Ds = 3'd0;
													Um = 4'd0;
													Dm = 4'd0;
													Uh = 4'd0;
													Dh = 2'd0;
			
											end
									end
										
							end
					end
			end
				
	end
	
end

// ********** Salida por medio de BUS **************

always @(negedge clk)
begin	
case (codigo)
	4'b000:
		begin
			BUS = Us;
		end
	4'b001:
		begin
			BUS = Ds;	
		end
	4'b010:
	   begin
			BUS = Um;
		end
	4'b011:
		begin
			BUS = Dm;		
		end
	4'b100:
		begin
			BUS = Uh;  	
		end
	4'b101:
		begin
			BUS = Dh;
		end
	default : begin
					BUS = 4'd0;
				 end
endcase

end

initial
begin
	Us=4'd0;
	Ds=3'd0;
	Um=4'd0;
	Dm=3'd0;
	Uh=4'd0;
	Dh=2'd0;
end

endmodule
