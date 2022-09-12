`timescale 1 ns/100 ps;
module TB_Reloj1s;
reg clk1;
wire r1s;
localparam retardo=10; //10 ns por periodo que esta dividido, es decir un periodo de 20ns

E6_Reloj1s DUT1(.clk(clk1), .r1s(r1s));

initial
  begin
  clk1=0;
  end

always
#retardo clk1=~clk1;

endmodule
