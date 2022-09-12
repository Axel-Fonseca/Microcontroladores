module Reloj1khz (input clk, output reg reloj1khz);

reg[15:0] contador;
 always @( posedge clk )
 begin
    contador=contador+1'b1;
	 if (contador>16'd24999)
	    begin
			 contador=0;
			 reloj1khz=~reloj1khz;
	    end
	 
 end
 
 endmodule 