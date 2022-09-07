module contador1seg(input reloj, output reg led);
reg [24:0] contador;

always @(posedge reloj)
   begin
	     contador=contador+1'd1;
		  if (contador==25'd24999999)
		  begin 
		  contador =25'd0;
		  led = ~ led;
		  end
		  end
endmodule
