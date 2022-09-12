`timescale 1 ns/10 ps

module TB_Contador1seg;

reg clk1;
wire r1s;
wire [3:0] re1s_9d;
localparam periodo=10;//10 ns por mitad de periodo de la senal de reloj de 1 segundo. T=20s

P2_Contador1seg DUT1(.clk(clk1), .r1s_9d(re1s_9d), .r1s(r1s));

initial
begin
clk1=0;
end

always
#periodo clk1=~clk1;

endmodule
