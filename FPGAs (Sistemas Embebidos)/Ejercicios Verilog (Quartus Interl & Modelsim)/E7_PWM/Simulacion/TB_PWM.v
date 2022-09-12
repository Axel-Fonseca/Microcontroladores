`timescale 1 ns/10 ps;
module TB_PWM;

reg clk1;
reg [3:0] velo;
wire senal_pwm;
localparam retardo=10, retardo2=10000;

E7_PWM DUT1(.clk(clk1), .velocidad(velo), .senal_pwm(senal_pwm));

initial 
begin
	clk1=0;
	velo=4'd4;
	#retardo2;
	velo=4'd8;
	#retardo2;
end

always
#retardo clk1=~clk1;

endmodule

