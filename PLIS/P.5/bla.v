module counter(a, CLK, rdy, LED0, LED1, LED2);
input wire CLK;
output wire LED0, LED1, LED2;
input [1:0] a;
input wire rdy;
reg LED;
reg L0;
reg L1;
reg L2;
initial L0 <= 1'b0;
initial L1 <= 1'b0;
initial L2 <= 1'b0;
initial LED <=1'b1;

 //Счётчик
reg [24:0] counter;
initial counter <= 25'd0;

//always @(posedge CLK) begin
//	if (counter == 25'd25000000) begin
//		counter <= 25'd0;
//		LED <= ~ LED;
//	end else begin
//		counter <= counter + 1'b1;
//	end
//end
//assign LED0 = LED;
//assign LED1 = ~ LED;
//assign LED2 = LED;

always @(posedge CLK) begin
	case(a)
	2'd0: begin
//	out = 5;
   L0 = LED;
	L1 = ~LED;
	L2 = ~LED;
	end
	
	2'd1: begin
	//out = 10;
	L0 = ~LED;
	L1 = LED;
	L2 = ~LED;
	end
	
	2'd2: begin
	//out = 15;
	L0 = ~LED;
	L1 = ~LED;
	L2 = LED;
	end
	
	2'd3: begin
	//out = 20;
	L0 = LED;
	L1 = LED;
	L2 = LED;
	end
	
	endcase
end

	assign LED0 = L0;
	assign LED1 = L1;
	assign LED2 = L2;

endmodule 