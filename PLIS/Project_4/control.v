module control (
input wire rdy, empty, full,
output reg enb );

always @(rdy or empty or full)
begin
	if(rdy) begin
	
		case(full)
		1'b1: enb = 0;
		1'b0: enb = 1;
		endcase
		
		case(empty)
		1'b1: enb = 1;
		1'b0: enb = 0;
		endcase
		
	end
end
endmodule
		
		
