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

module count3(clk, m, s, sum);
input clk;
input [10:0] m;
input [10:0] s;
output [10:0] sum;

always @(posedge clk) begin
	assign sum = s + m;
end

endmodule 

