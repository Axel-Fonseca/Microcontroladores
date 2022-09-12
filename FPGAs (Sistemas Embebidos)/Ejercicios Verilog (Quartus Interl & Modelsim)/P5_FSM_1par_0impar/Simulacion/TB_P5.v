`timescale 1 ns/10 ps
module TB_P5;
wire y;
wire [2:0] status;
reg x, reset, clk;

P5_FSM_1par_0impar DUT1(.clk(clk), .reset(reset), .x(x), .y(y), .status(status));

localparam	medio_periodo = 10,
		cambio = 2*medio_periodo;

always
	#medio_periodo clk=~clk;

initial
begin
reset = 0;
clk = 0;
#5

x = 0;
#cambio;

x = 1;
#cambio;

x = 1;
#cambio;

x = 0;
#cambio;

x = 1;
#cambio;

x = 0;
#cambio;

x = 0;
#cambio;

x = 0;
#cambio;

x = 1;
#cambio;

x = 1;
#cambio;

x = 1;
#cambio;

x = 1;
#cambio;

x = 0;
#cambio;

x = 0;
#cambio;

x = 0;
#cambio;

x = 1;
#cambio;

x = 0;
#cambio;

x = 0;
#cambio;

x = 0;
#cambio;

x = 1;
#cambio;
end

endmodule



