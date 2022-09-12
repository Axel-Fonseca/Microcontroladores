module contadorosciloscopio( input [3:0] contador, output a, output b, output c, output d, output e, output f, output g);
Suma6 U1(a, contador[3], contador[2], contador[1], contador[0]);
Suma5 U2(b, contador[3], contador[2], contador[1], contador[0]);
Suma4 U3(c, contador[3], contador[2], contador[1], contador[0]);
Suma3 U4(d, contador[3], contador[2], contador[1], contador[0]);
Suma2 U5(e, contador[3], contador[2], contador[1], contador[0]);
Suma1 U6(f, contador[3], contador[2], contador[1], contador[0]);
Suma0 U7(g, contador[3], contador[2], contador[1], contador[0]);




endmodule
primitive Suma6(

output a,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		a
		0	0	0	0	:	1;
		0	0	0	1	:	0;
		0	0	1	0	:	1;
		0	0	1	1	:	1;
		0	1	0	0	:	0;
		0	1	0	1	:	1;
		0	1	1	0	:	1;
		0	1	1	1	:	1;
		1	0	0	0	:	1;
		1	0	0	1	:	1;
		
   

endtable
endprimitive

primitive Suma5(

output b,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		b
		0	0	0	0	:	1;
		0	0	0	1	:	1;
		0	0	1	0	:	1;
		0	0	1	1	:	1;
		0	1	0	0	:	1;
		0	1	0	1	:	0;
		0	1	1	0	:	0;
		0	1	1	1	:	1;
		1	0	0	0	:	1;
		1	0	0	1	:	1;
   

endtable
endprimitive

primitive Suma4(

output c,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		a
		0	0	0	0	:	1;
		0	0	0	1	:	1;
		0	0	1	0	:	0;
		0	0	1	1	:	1;
		0	1	0	0	:	1;
		0	1	0	1	:	1;
		0	1	1	0	:	1;
		0	1	1	1	:	1;
		1	0	0	0	:	1;
		1	0	0	1	:	1;
   

endtable
endprimitive

primitive Suma3(

output d,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		d
		0	0	0	0	:	1;
		0	0	0	1	:	0;
		0	0	1	0	:	1;
		0	0	1	1	:	1;
		0	1	0	0	:	0;
		0	1	0	1	:	1;
		0	1	1	0	:	1;
		0	1	1	1	:	0;
		1	0	0	0	:	1;
		1	0	0	1	:	1;
   

endtable
endprimitive
primitive Suma2(

output e,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		e
		0	0	0	0	:	1;
		0	0	0	1	:	0;
		0	0	1	0	:	1;
		0	0	1	1	:	0;
		0	1	0	0	:	0;
		0	1	0	1	:	0;
		0	1	1	0	:	1;
		0	1	1	1	:	0;
		1	0	0	0	:	1;
		1	0	0	1	:	0;
   

endtable
endprimitive
primitive Suma1(

output f,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		f
		0	0	0	0	:	1;
		0	0	0	1	:	0;
		0	0	1	0	:	0;
		0	0	1	1	:	0;
		0	1	0	0	:	1;
		0	1	0	1	:	1;
		0	1	1	0	:	1;
		0	1	1	1	:	0;
		1	0	0	0	:	1;
		1	0	0	1	:	1;
   

endtable
endprimitive
primitive Suma0(

output g,
input A1,
input A0,
input S1,
input S0);

table 

//		A1	A0	S1	S0		g
		0	0	0	0	:	0;
		0	0	0	1	:	0;
		0	0	1	0	:	1;
		0	0	1	1	:	1;
		0	1	0	0	:	1;
		0	1	0	1	:	1;
		0	1	1	0	:	1;
		0	1	1	1	:	0;
		1	0	0	0	:	1;
		1	0	0	1	:	1;
   

endtable
endprimitive