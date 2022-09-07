module oscilador(input clk, output reg osc);

reg [11:0] contador;

always @(posedge clk)
begin 
     contador = contador+1;
	  if (contador == 12'd2499)
	  begin
	       contador=12'd0;
			 osc = ~osc;
	  end 
end 

endmodule 