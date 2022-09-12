module ALUEXA(input [1:0] sel, input [7:0] A, input [7:0] B, output reg [8:0] C, output reg [7:0] acumulador);



always @(sel, A, B)
begin
	C=8'd0;
	case (sel)
		2'b00: 
			begin
				C=A+B;
			end
		2'b01:
			begin
				acumulador=A;
			end
		2'b10:
			begin
				C=A-B;
			end
		2'b11:
			begin
				acumulador=B;
			end
	endcase
end
initial
begin
	acumulador=0;
	C=0;
end

endmodule
