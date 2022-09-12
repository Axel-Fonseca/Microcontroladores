 module P4_FSM_Trenes(input clk, input reset, input V0, input V1, output reg B, output reg T0, output reg T1, output reg [1:0] status);
 
 localparam		S0 = 2'b00,	 //Estado inicial
					S1 = 2'b01,	 //Estado 1
					S2 = 2'b10,	 //Estado 2
					Trash_S = 2'b11; //Estado basura
					
reg [1:0] act_state;
reg [1:0] next_state;


//Bloque de Transicion
always @(posedge clk)
begin
	if (reset==1'b1)
		act_state = S0;
	else
		act_state = next_state;
end


//Bloque de estado sig
always @(*)
begin
next_state = act_state;

	case (act_state)
	
		S0:	begin
				if (V0==1'b0 && V1==1'b0)
				   begin
					next_state = S1; 
				   end
				
				if (V0==1'b0 && V1==1'b1)
				   begin
					next_state = S1;
				   end
				
				if (V0==1'b1 && V1==1'b0)
				   begin
					next_state = S2;
				   end
				
				if (V0==1'b1 && V1==1'b1)
				   begin
					next_state = S0;
				   end
			end
		
		S1:	begin
				if (V0==1'b0 && V1==1'b0)
				   begin
					next_state = S1; 
				   end
				
				if (V0==1'b0 && V1==1'b1)
				   begin
					next_state = S1;
				   end
				
				if (V0==1'b1 && V1==1'b0)
				   begin
					next_state = S2;
				   end
				
				if (V0==1'b1 && V1==1'b1)
				   begin
					next_state = S0;
				   end
			end
		
		S2:	begin
				if (V0==1'b0 && V1==1'b0)
				   begin
					next_state = S1; 
				   end
				
				if (V0==1'b0 && V1==1'b1)
				   begin
					next_state = S1;
				   end
				
				if (V0==1'b1 && V1==1'b0)
				   begin
					next_state = S2;
				   end
				
				if (V0==1'b1 && V1==1'b1)
				   begin
					next_state = S0;
				   end
			end
		
		Trash_S:	begin
					next_state = S0;
				end
	endcase
end


//Bloque de salida
always @(*)
begin
T0=1'b0;
T1=1'b0;
B=1'b0;
status=2'b00;
	case (act_state)

		S0:	begin
					T0=1'b1;
					T1=1'b1;
					B=1'b1;
					status=S0;
			end
		
		S1:	begin
					T0=1'b0;
					T1=1'b1;
					B=1'b0;
					status=S1;
			end

		S2:	begin
					T0=1'b1;
					T1=1'b0;
					B=1'b0;
					status=S2;
				  
				end
	endcase
end

initial
	begin
	T0=1'b0;
	T1=1'b0;
	B=1'b0;
	act_state=2'b00;
	next_state=2'b00;
	status=2'b00;
	end
 
endmodule
 
 