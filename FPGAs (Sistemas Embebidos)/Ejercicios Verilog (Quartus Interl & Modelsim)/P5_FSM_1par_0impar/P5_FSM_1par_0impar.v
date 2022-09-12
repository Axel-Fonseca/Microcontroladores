module P5_FSM_1par_0impar (input clk, input reset, input x, output reg y, output reg [2:0] status);

localparam		S0 = 3'b000, //Estado inicial
					S1 = 3'b001, //Estado "1" impares
					S2 = 3'b010, //Estado "1" pares
					S3 = 3'b011, //Estado "0" impares
					S4 = 3'b100, //Estado "0" pares
					S5 = 3'b101, //Estado de salida
					trash_s6 = 3'b110, //Estado basura
					trash_s7 =3'b111; //Esatdo basura
					
reg [2:0] act_st;
reg [2:0] nxt_st;


//Bloque de Transicion
always @(posedge clk)
begin
	if (reset==1'b1)
		act_st = S0;
	else
		act_st = nxt_st;
end


//Bloque de estado sig
always @(*)
begin
nxt_st = act_st;
		
		case (act_st)
							S0:	begin
										if (x==1'b0)
											nxt_st = S0;
										else
											nxt_st = S1;
									end
			
							S1:	begin
										if (x==1'b0)
											nxt_st = S0;
										else
											nxt_st = S2;
									end
			
							S2:	begin
										if (x==1'b0)
											nxt_st = S3;
										else
											nxt_st = S1;
									end
			
							S3:	begin
										if (x==1'b0)
											nxt_st = S4;
										else
											nxt_st = S5;
									end
			
							S4:	begin
										if (x==1'b0)
											nxt_st = S3;
										else
											nxt_st = S1;
									end
			
							S5:	begin
										if (x==1'b0)
											nxt_st = S0;
										else
											nxt_st = S2;
									end
											
							trash_s6:	begin
												nxt_st = S0;
											end
											
							trash_s7:	begin
												nxt_st = S0;
											end
			
			
		endcase
end


//Bloque de salida
always @(*)
begin
y = 1'b0;
status = 3'b000;

	case (act_st)
						S0:	begin
									y = 1'b0;
									status = S0;
								end
						
						S1:	begin
									y = 1'b0;
									status = S1;
								end
						
						S2:	begin
									y = 1'b0;
									status = S2;
								end
						
						S3:	begin
									y = 1'b0;
									status = S3;
								end
						
						S4:	begin
									y = 1'b0;
									status = S4;
								end
						
						S5:	begin
									y = 1'b1;
									status = S5;
								end
										
						trash_s6:	begin
											y = 1'b0;
											status = trash_s6;
										end
								
						trash_s7:	begin
											y = 1'b0;
											status = trash_s7;
										end
	endcase
end


//Bloque de inicializacion
initial
begin
	y = 1'b0;
	status = 3'b000;
	act_st = 3'b000;
	nxt_st = 3'b000;
end

endmodule
