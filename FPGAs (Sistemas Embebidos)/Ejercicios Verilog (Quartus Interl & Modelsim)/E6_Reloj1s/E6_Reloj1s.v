module E6_Reloj1s (input clk, output reg r1s);
reg [24:0] cuenta;

always @(posedge clk)
begin
	cuenta=cuenta+1;
	
	if (cuenta==25'd24999999)
		begin
		  cuenta=0;
		  r1s=~r1s;
		end
end

initial
begin
cuenta=0;
r1s=0;
end

endmodule
