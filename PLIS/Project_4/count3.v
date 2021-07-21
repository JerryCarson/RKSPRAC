//module counter(CLK, LED0, LED1, LED2);
//input wire CLK;
//output wire LED0, LED1, LED2;
//
//reg LED;
//initial LED <= 1'b0;
//
//// Счётчик
//reg [24:0] counter;
//initial counter <= 25'd0;
//
//always @(posedge CLK) begin
//	if (counter == 25'd25000000) begin
//		counter <= 25'd0;
//		LED <= -LED;
//	end else begin
//		counter <= counter + 1'b1;
//	end
//end
//assign LED0 = LED;
//assign LED1 = -LED;
//assign LED2 = LED;
//
//endmodule 

module count3 (
input clk,
input [10:0] m,
output reg [10:0] s
);
initial begin
s = 11'b0;
end

always @(posedge clk) begin
	s <= s + m;
end

endmodule 


