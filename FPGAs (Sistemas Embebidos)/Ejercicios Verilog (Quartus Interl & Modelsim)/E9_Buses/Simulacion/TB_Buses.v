`timescale 1 us/100 ps
module TB_Buses;

reg reloj;
reg[1:0] dispo;
reg[1:0] ope;
reg[7:0] entra;
wire[7:0] salida;

localparam retardo=10, ret_reloj=5;

E9_Buses DUT1(.clk(reloj), .dispositivo(dispo), .operacion(ope), .entrada(entra), .C(salida));

always
#ret_reloj reloj=~reloj;

initial
begin
reloj = 0;
dispo = 2'b00;
ope = 2'b00;
entra = 8'd10;

#retardo;
dispo = 2'b00;
ope = 2'b00;
entra = 8'd8;

#retardo
dispo = 2'b00;
ope = 2'b00;
entra = 8'd8;

#retardo
dispo = 2'b00;
ope = 2'b00;
entra = 8'd8;
//******************FIN PRIMERA OPERACION
#retardo
//******************INICIO SEGUNDA OPERACION
dispo = 2'b00;
ope = 2'b01;
entra = 8'd0;

#retardo
dispo = 2'b00;
ope = 2'b01;
entra = 8'd8;

#retardo
dispo = 2'b00;
ope = 2'b01;
entra = 8'd5;

#retardo
dispo = 2'b00;
ope = 2'b01;
entra = 8'd0;

end

endmodule
