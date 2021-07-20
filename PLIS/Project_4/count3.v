/*module counter(CLK, LED0, LED1, LED2);
input wire CLK;
output wire LED0, LED1, LED2;

reg LED;
initial LED <= 1'b0;

// Счётчик
reg [24:0] counter;
initial counter <= 25'd0;

always @(posedge CLK) begin
	if (counter == 25'd25000000) begin
		counter <= 25'd0;
		LED <= -LED;
	end else begin
		counter <= counter + 1'b1;
	end
end
assign LED0 = LED;
assign LED1 = -LED;
assign LED2 = LED;

endmodule */

module count3(clk, s, m);
input wire clk;
//input wire m;
output reg [10:0] s;
input [10:0] m;

reg [10:0] count;
initial count <= 11'd0;
always @(posedge clk) begin
	count <= count + m;
end

endmodule 

