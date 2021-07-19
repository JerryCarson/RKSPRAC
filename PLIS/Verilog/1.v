module counter (clk, data, m);

input clk;
output [7:0] data;
output [7:0] m;
reg [7:0] m;

always @(posedge clk) begin
	m <= data;
end
endmodule