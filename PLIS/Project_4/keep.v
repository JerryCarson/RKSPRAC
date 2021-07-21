module keep (a, out, LED0, LED1, LED2);
output LED0, LED1, LED2;
input [1:0] a;
output reg [10:0] out;

reg LED;
initial LED <= 1'b0; 

always @(a) begin
	case(a)
	
	11'd0: begin
	out = 5;
	assign LED0 = LED;
	assign LED1 = - LED;
	assign LED2 = - LED;
	end
	
	11'd1: begin
	out = 10;
	assign LED0 = - LED;
	assign LED1 = LED;
	assign LED2 = - LED;
	end
	
	11'd2: begin
	assign LED0 = - LED;
	assign LED1 = - LED;
	assign LED2 = LED;
	end
	
	11'd3: begin
	out = 20;
	assign LED0 = LED;
	assign LED1 = LED;
	assign LED2 = - LED;
	end
	
	endcase
end

endmodule 