module E9_Buses (input clk, input[1:0] dispositivo, input [1:0] operacion, input[7:0] entrada, output reg[7:0] C);

//Diseño del mapa de memoria de mi sistema

/*Direccionamiento 1. Dispisitivo a utilizar
						 2. Operacion a realizar
Bus de datos		 3. Enviarle los datos necesarios para la operacion*/						 


//***********Creacion bus de direcciones/Mapa de memoria//

//		1. Dispositivo	 2. Operacion 3. DatosA	 DatosB
//			0 0				0 0			  A		  Z(Alta impedancia)
//			0 0				0 1			  A		  B
//			0 0				1 0			  Z		  B
//			0 0				1 1			  A		  B

//			0 1				0 0			  A		  Z

//			1 0				0 0			  Z		  B

reg [7:0]A;
reg [7:0]B;

wire[19:0] cod_op; //cod_up = numero max de bits
wire[3:0] codigo;
//reg[1:0] op; (Esta variables se puede eliminar)
reg[1:0] conta;

assign cod_op[19] = dispositivo[1];
assign cod_op[18] = dispositivo[0];

assign cod_op[17] = operacion[1];
assign cod_op[16] = operacion[0];

assign cod_op[15] = A[7];
assign cod_op[15] = A[6];
assign cod_op[15] = A[5];
assign cod_op[15] = A[4];
assign cod_op[15] = A[3];
assign cod_op[15] = A[2];
assign cod_op[15] = A[1];
assign cod_op[15] = A[0];

assign cod_op[15] = B[7];
assign cod_op[15] = B[6];
assign cod_op[15] = B[5];
assign cod_op[15] = B[4];
assign cod_op[15] = B[3];
assign cod_op[15] = B[2];
assign cod_op[15] = B[1];
assign cod_op[15] = B[0];

assign codigo[3] = cod_op[19];
assign codigo[2] = cod_op[18];
assign codigo[1] = cod_op[17];
assign codigo[0] = cod_op[16];

/*******Otra forma de definir el BUS mas simplificada
reg [1:0] op;
reg [1:0] conta;
wire [3:0] codigo;



assign codigo[3] = dispositivo[1];
assign codigo[2] = dispositivo[0];
assign codigo[1] = operacion[1];
assign codigo[0] = operacion[0];
*********Fin definicion simplificada*/



//Dispositivo:	0 0 --> ALU
//					0 1 --> Corrimiento A
//					1 0 --> Corrimiento B


//***********************BLOQUE DE SALIDA ALU Y CORRIMIENTO***************
always@(codigo,A,B)
begin
	case(codigo)  
		4'b0000:
			begin
				C = A;
			end
		
		4'b0001: 
			begin
				C = A+B;
			end
		
		4'b0010:
			begin
				C = B;
			end
		
		4'b0011:
			begin
				C = A-B;
			end
		
		4'b0100:
			begin
				C = A<<1;
			end
	
		4'b1000:
			begin
				C = B<<1;
			end
		
		default: C = 9'd0;
	
	endcase
end


/******************
always@(operacion)
begin
	case(operacion)
	2'b00: op=1;
	2'b01: op=2;		Se puede eliminar
	2'b10: op=1;
	2'b11: op=2;
	endcase
end
*******************/


//****************************BLOQUE DE ENTRADA*********************
always@(posedge clk)//Microinstrucciones
begin
	case(codigo)  
		4'b0000:
			begin
				if(conta==2'd1)
					A = entrada;
			end
		
		4'b0001: 
			begin
				if(conta==2'd1)
					A = entrada;
			
				if(conta==2'd2)
					B = entrada;
			end
		
		4'b0010:
			begin
				if(conta==2'd1)
					B = entrada;
			end
		
		4'b0011:
			begin
				if(conta==2'd1)
					A = entrada;
			
				if(conta==2'd2)
				B = entrada;
			end
		
		4'b0100:
			begin
				if(conta==2'd1)
				A = entrada;	
			end
	
		4'b1000:
			begin
				if(conta==2'd1)
				B = entrada;
			end

		default:
			begin
				A = 8'd0;
				B = 8'd0;
			end
	
	endcase
conta=conta+2'd1;
end

initial
begin
A = 0;
B = 0;
C = 0;
conta=0;
//op = 0;

end

endmodule
