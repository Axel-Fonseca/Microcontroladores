module E5_Contador1dig (input clk, output reg nuevo_clk);

reg [3:0] contador;

always @(posedge clk)
begin
	contador=contador+1;
	if (contador>4'd9)
	begin
		contador=0;
		nuevo_clk=~nuevo_clk;
	end
end

initial
begin
nuevo_clk=0;
contador=4'd0; //solo es necesario para simulacion cuando se usan registros
end

endmodule
