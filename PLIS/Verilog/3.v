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
		LED <= -LED;
	end else begin
		counter <= counter + 1'b1;
	end
end
assign LED0 = LED;
assign LED1 = -LED;
assign LED2 = LED;

endmodule 

//always @(posedge CLK or posedge RST)
//begin
//if (RST == 1) COUNT <= 'b0;
//else COUNT <= 14'b01;
//else
//if (CE == 1)
//begin
//if (LOAD == 1) COUNT <= DIN;
//else
//begin
//if (DIR == 1) COUNT <= COUNT + 1;
//else if (DIR == 0) COUNT <= COUNT - 1;
//end
//end
//end
//endmodule