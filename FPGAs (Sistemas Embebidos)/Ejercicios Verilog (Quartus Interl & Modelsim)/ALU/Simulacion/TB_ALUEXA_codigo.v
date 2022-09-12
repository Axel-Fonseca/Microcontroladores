`timescale 1us/100ps
module TB_ALUEXA_codigo;

reg[1:0] sel1;
reg[7:0] A1;
reg[7:0] B1;
wire[8:0] C;
wire[7:0] acumulador1;
localparam periodo=10;

ALUEXA DUT1(.sel(sel1), .A(A1), .B(B1), .C(C), .acumulador(acumulador1));

initial
	begin
//Primer calculo cuando sel=00
	sel1=2'b00;
	A1=8'd25;
	B1=8'd10;
	#periodo; 
	
	sel1=2'b01;
	A1=8'd30;
	B1=8'd15;
	#periodo; 

	sel1=2'b10;
	A1=8'd30;
	B1=8'd15;
	#periodo; 

	sel1=2'b11;
	A1=8'd30;
	B1=8'd15;
	#periodo; 

	end
endmodule
