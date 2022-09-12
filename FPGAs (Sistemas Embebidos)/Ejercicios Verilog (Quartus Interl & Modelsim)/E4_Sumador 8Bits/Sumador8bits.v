module Sumador8bits (input [7:0] A, input [7:0] B, input Cin, output [7:0] S, output Cout);

	wire acarreo;
	wire acarreo1;
	wire acarreo2;
	wire acarreo3;
	wire acarreo4;
	wire acarreo5;
	wire acarreo6;



	SumadorCompleto u1(.Cin(0), .A(A[0]), .B(B[0]), .S(S[0]), .Cout(acarreo) );
	SumadorCompleto u2(.Cin(acarreo), .A(A[1]), .B(B[1]), .S(S[1]), .Cout(acarreo1) );
	SumadorCompleto u3(.Cin(acarreo1), .A(A[2]), .B(B[2]), .S(S[2]), .Cout(acarreo2) );
	SumadorCompleto u4(.Cin(acarreo2), .A(A[3]), .B(B[3]), .S(S[3]), .Cout(acarreo3) );
	SumadorCompleto u5(.Cin(acarreo3), .A(A[4]), .B(B[4]), .S(S[4]), .Cout(acarreo4) );
	SumadorCompleto u6(.Cin(acarreo4), .A(A[5]), .B(B[5]), .S(S[5]), .Cout(acarreo5) );
	SumadorCompleto u7(.Cin(acarreo5), .A(A[6]), .B(B[6]), .S(S[6]), .Cout(acarreo6) );
	SumadorCompleto u8(.Cin(acarreo6), .A(A[7]), .B(B[7]), .S(S[7]), .Cout(Cout) );



endmodule
