module contadorpulsos (input wire entrada, output reg contador);

always @(negedge entrada)
begin
	contador=contador+1;
end

endmodule
