module keep (
output reg LED0, LED1, LED2,
input [1:0] a,
output reg [10:0] out,

output reg LED
 );
 
initial 
LED <= 1'b0;
 
always @(a) begin
	case(a)
	
	11'd0: begin
	out = 5;
	LED0 = LED;
	LED1 = ~ LED;
	LED2 = ~ LED;
	//$display("%d",LED0, LED1, LED2);
	end
	
	11'd1: begin
	out = 10;
	LED0 = ~ LED;
	LED1 = LED;
	LED2 = ~ LED;
	end
	
	11'd2: begin
	LED0 = ~ LED;
	LED1 = ~ LED;
	LED2 = LED;
	end
	
	11'd3: begin
	out = 20;
	LED0 = LED;
	LED1 = LED;
	LED2 = ~ LED;
	end
	
	endcase
end

endmodule 