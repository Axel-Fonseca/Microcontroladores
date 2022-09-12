module P2_Contador1seg (input clk, output reg[3:0] r1s_9d, output reg r1s);

reg[24:0] cuenta;

always @(negedge clk)
begin
	cuenta=cuenta+1;
	if (cuenta==25'd24999999)
	begin
		cuenta=25'd0;
		r1s=~r1s;
	end
end


always @(negedge r1s)
begin
	if (r1s<10)
	begin
	r1s_9d=r1s_9d+1;
	end
	
	if (r1s==10)
	begin
	r1s_9d=0;
	end
end

initial
begin
r1s_9d=0;
r1s=0;
cuenta=0;//solo es necesario para simulacion cuando se usan registros
end

endmodule