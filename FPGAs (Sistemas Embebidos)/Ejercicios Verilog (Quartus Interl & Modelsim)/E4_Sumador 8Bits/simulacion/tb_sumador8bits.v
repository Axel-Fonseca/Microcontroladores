`timescale 1 us/100 ps
module tb_sumador8bits;

reg [7:0] At;
reg [7:0] Bt;
reg Cin;

wire [7:0] St;
wire Cout;

localparam retardo=10;

Sumador8bits DUT1(.A(At), .B(Bt), .Cin(Cin), .S(St), .Cout(Cout) );

always
	#retardo At=At+1;
always
	#retardo Bt=1;

initial 
begin
	At=0;
	Bt=8'b11111111;
	Cin=0;
	#retardo;
end

endmodule
