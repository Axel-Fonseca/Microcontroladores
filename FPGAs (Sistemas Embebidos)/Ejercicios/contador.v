module contador (input A, 
                 output reg [3:0] BCD);
 
 always @(posedge A)
 begin 
 BCD = BCD+1'b1;
 if (BCD == 4'd9)
    begin
	 BCD = 4'd0;
	 end
 end 
 
 
 endmodule 