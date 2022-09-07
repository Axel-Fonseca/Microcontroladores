 module contadordisplay (input P, output [3:0] C);
 

cuenta  u3(C[3], conta[3], conta[2], conta[1], conta[0]);
cuenta1 u2(C[2], conta[3], conta[2], conta[1], conta[0]);
cuenta2 u1(C[1], conta[3], conta[2], conta[1], conta[0]);
cuenta3 u0(C[0], conta[3], conta[2], conta[1], conta[0]);
 

reg [3:0] conta ; //contador 

always @(posedge P)
begin

conta = conta+1'b1;
if (conta == 4'd10)
begin 
 
 conta = 4'd0;
   end

end 

endmodule

primitive cuenta(

output s3,
input conta0,
input conta1,
input conta2,
input conta3);

table
// A1   A0   B1   B0     S3
   0    0    0    0   :  0;
	0    0    0    1   :  0;
	0    0    1    0   :  0;
	0    0    1    1   :  0;
	0    1    0    0   :  0;
	0    1    0    1   :  0;
	0    1    1    0   :  0;
	0    1    1    1   :  0;
	1    0    0    0   :  1;
	1    0    0    1   :  1;
	
endtable
endprimitive



primitive cuenta1(

output s2,
input conta0,
input conta1,
input conta2,
input conta3);

table
// A1   A0   B1   B0     S3
   0    0    0    0   :  0;
	0    0    0    1   :  0;
	0    0    1    0   :  0;
	0    0    1    1   :  0;
	0    1    0    0   :  1;
	0    1    0    1   :  1;
	0    1    1    0   :  1;
	0    1    1    1   :  1;
	1    0    0    0   :  0;
	1    0    0    1   :  0;

endtable
endprimitive 

primitive cuenta2(

output s1,
input conta0,
input conta1,
input conta2,
input conta3);

table
// A1   A0   B1   B0     S3
   0    0    0    0   :  0;
	0    0    0    1   :  0;
	0    0    1    0   :  1;
	0    0    1    1   :  1;
	0    1    0    0   :  0;
	0    1    0    1   :  0;
	0    1    1    0   :  1;
	0    1    1    1   :  1;
	1    0    0    0   :  0;
	1    0    0    1   :  0;

endtable
endprimitive

primitive cuenta3(

output s0,
input conta0,
input conta1,
input conta2,
input conta3);

table
// A1   A0   B1   B0     S3
   0    0    0    0   :  0;
	0    0    0    1   :  1;
	0    0    1    0   :  0;
	0    0    1    1   :  1;
	0    1    0    0   :  0;
	0    1    0    1   :  1;
	0    1    1    0   :  0;
	0    1    1    1   :  1;
	1    0    0    0   :  0;
	1    0    0    1   :  1;

endtable
endprimitive	



 				
				