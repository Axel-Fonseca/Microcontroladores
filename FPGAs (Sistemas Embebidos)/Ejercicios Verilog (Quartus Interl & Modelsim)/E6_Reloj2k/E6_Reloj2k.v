module E6_Reloj2k (input clk, output reg clk10k);

reg [11:0] contador;

always @(posedge clk)
begin 
	contador=contador+1;
	if (contador==12'd2499)
	begin
	contador=0;
	clk10k=~clk10k;
	end
end

initial
begin
clk10k=0;
contador=0;
end

endmodule
