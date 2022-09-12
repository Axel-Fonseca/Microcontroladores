module E3_Comparador
(input wire [1:0] num1, input wire [1:0] num2, output wire compa);

wire tempo1, tempo2;

assign tempo1 = num1[0] ~^ num2[0];
assign tempo2 = num1[1] ~^ num2[1];
assign compa = tempo1 & tempo2;

endmodule
