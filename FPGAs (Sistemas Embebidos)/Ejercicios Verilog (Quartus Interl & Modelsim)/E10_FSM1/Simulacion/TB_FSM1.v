`timescale 1 ns/10 ps
module tb_secuencia;

reg reset;
reg clk;
reg x;
wire z;
wire [2:0] estatus;

localparam medio_periodo=10,
           cambio=2*medio_periodo;


secuencia DUT1(.Reset(reset), .clk(clk), .x(x), .z(z), .status(estatus) );

always
	#medio_periodo clk=~clk;

initial
begin
	reset=0;
	clk=0;
	x=0;
	#5
	reset=0;
	clk=0;
	x=0;
	#cambio;
	x=1;
	#cambio;
	x=0;
	#cambio;
	x=0;
	#cambio;
	x=1;
	#cambio;
	x=1;
	#cambio;
	x=1;
	#cambio;
	x=0;
	#cambio;
	x=0;
	#cambio;
	x=1;
	#cambio;
	x=1;
	#cambio;

end

endmodule

Press Shift + Tab to navigate to chat history.