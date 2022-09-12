module E7_PWM (input clk, input [3:0] velocidad, output reg senal_pwm);

wire reloj10k;
reg [3:0] cuenta;

E6_Reloj2k U1 (.clk(clk), .clk10k(reloj10k));

always @(posedge reloj10k)
begin
	cuenta=cuenta+1;
	
	if(cuenta<velocidad)
	begin 
	senal_pwm=1'b1;
	end
	
	else
	begin
	senal_pwm=1'b0;
	end
	
	if(cuenta>4'd9)
	begin
	cuenta=4'd0;
	end
end

initial
begin
cuenta=0;
senal_pwm=0;
end

endmodule
