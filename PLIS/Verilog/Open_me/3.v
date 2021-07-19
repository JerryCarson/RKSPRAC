module counter(CLK, LED0, LED1, LED2);
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
		LED <= ~LED;
	end else begin
		counter <= counter + 1'b1;
	end
end
assign LED0 = LED;
assign LED1 = ~LED;
assign LED2 = LED;

endmodule 


module count(clk, s);
input wire clk;
//input wire m;
output wire s;
integer m;

reg [10:0] x;
initial m <= 11'b01100;
reg[10:0] count;
initial count <= 11'd0;
endmodule

//for (i = 1; 


