module contadorpulsos (input wire entrada, output reg [7:0] contador);

always @(negedge entrada)
begin
	contador=contador+1;
end

initial
begin
	contador=0;
end
endmodule
