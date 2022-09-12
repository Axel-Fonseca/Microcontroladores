module E8_Bus (input clk, output[3:0] unidades, output[3:0] decenas);

wire reloj1s, reloj10s, reloj100s;

E6_Reloj1s U1(.clk(clk), .r1s(reloj1s));

E8_contadorBCD U2(.reloj(reloj1s), .conta(unidades), .senal(reloj10s));
E8_contadorBCD U3(.reloj(reloj10s), .conta(decenas), .senal(reloj100s));

endmodule
