`timescale 1 ns/ 100 ps
module tb_reloj1khz;
reg reloj;
wire reloj1k;

//Variable de tiempo solo para simulacion
localparam periodo =10;

Reloj1khz U1(.clk(reloj), .reloj1khz(reloj1k) );


always

	#periodo reloj = ~reloj;

initial
	begin
	reloj=0;
	#periodo;
	end

endmodule 