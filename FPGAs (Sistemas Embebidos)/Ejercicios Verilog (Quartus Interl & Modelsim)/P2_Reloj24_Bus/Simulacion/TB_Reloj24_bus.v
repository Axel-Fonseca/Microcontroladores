`timescale 1 ns/100 ps;

module TB_Reloj24_bus;

reg clk1;
reg [2:0] direcc;
wire[3:0] BUS1;

localparam retU=20, ret1=120, ret2=1200, ret3=7200, ret4=72000, ret=2, retclk=1;

P2_Reloj24_Bus DUT1(.clk(clk1), .direccion(direcc), .BUS(BUS1));

always
#retclk clk1=~clk1;

initial
begin
clk1 = 1'd0;
	
	begin
	direcc = 3'b000; //Se muestra el conteo de Us de 0 a 9
	#retU;

	direcc = 3'b001;//Se muestra el cambio de Ds de 0 a 1
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret1;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;//Se muestra el cambio de Um de 0 a 1
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret1;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;//Se muestra el cambio de Um de 0 a 1
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret2;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;//Se muestra el cambio de Dm de 1 a 2
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret2;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;//Se muestra el cambio de Dm de 1 a 2
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret3;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;//Se muestra el cambio de Uh de 0 a 1
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret3;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;//Se muestra el cambio de Uh de 1 a 2
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret4;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;//Se muestra el cambio de Dh de 0 a 1
	#ret;

//***********
	#ret4;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;//Se muestra el cambio de Dh de 1 a 2
	#ret;

//***********
	#ret3;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	#ret3;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

	#ret3;
	direcc = 3'b000;
	#retU;

	direcc = 3'b001;
	#ret;

	direcc = 3'b010;
	#ret;

	direcc = 3'b011;
	#ret;

	direcc = 3'b100;
	#ret;

	direcc = 3'b101;
	#ret;

//***********
	end

end

endmodule
