module number (
 input wire [10:0] out,
 output reg [10:0] m
 );
 
always @(out) begin
	case(out)
	
	11'd5: m = 11'd103;
	11'd10: m = 11'd205;
	11'd15: m = 11'd308;
	11'd20: m = 11'd410;
	
	endcase
end
 //assign m = 11'd102;
 
endmodule