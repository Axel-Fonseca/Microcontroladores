module E8_contadorBCD(input reloj, output reg[3:0] conta, output reg senal);

always@(posedge reloj)
begin
  conta=conta+1;
  
  if (conta>4'd4)
  begin
		senal=1'b1;
  end
  
  else
  begin
		senal=1'b0;
  end
  
  if(conta>4'd9)
  begin
		conta=0;
  end
  
end

endmodule
