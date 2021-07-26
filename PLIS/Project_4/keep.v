module keep (
output reg LED0, LED1, LED2,
input [1:0] a,
output reg [10:0] out,
input clk,

output reg LED
 );
 
initial 
LED <= 1'b0;
 
always @(clk) begin
	case(a)
	
	2'b00: begin
	out = 5;
	LED0 = LED;
	LED1 = ~ LED;
	LED2 = ~ LED;
	//$display("%d",LED0, LED1, LED2);
	end
	
	2'b01: begin
	out = 10;
	LED0 = ~ LED;
	LED1 = LED;
	LED2 = ~ LED;
	end
	
	2'b10: begin
	out = 15;
	LED0 = ~ LED;
	LED1 = ~ LED;
	LED2 = LED;
	end
	
	2'b11: begin
	out = 20;
	LED0 = LED;
	LED1 = LED;
	LED2 = ~ LED;
	end
	
	endcase
end

endmodule 