module E4_Sumador_4B (input cin, input [3:0]num1, input [3:0]num2, output cout, output [4:0]suma);

wire tempo1, tempo2, tempo3;

sumadorcompleto f1( .A(num1[0]),	.B(num2[0]),	.Cin(cin), 		.s(suma[0]), 	.Cout(tempo1));
sumadorcompleto f2( .A(num1[1]),	.B(num2[1]),	.Cin(tempo1), 	.s(suma[1]), 	.Cout(tempo2));
sumadorcompleto f3( .A(num1[2]),	.B(num2[2]),	.Cin(tempo2), 	.s(suma[2]), 	.Cout(tempo3));
sumadorcompleto f4( .A(num1[3]),	.B(num2[3]),	.Cin(tempo3), 	.s(suma[3]), 	.Cout(cout));

endmodule
