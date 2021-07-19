module counter
(
input clk, enable,
output [7:0] data
);
 assign data = counter;
 
 always @(posedge clk)
 begin
 if (enable)
 counter = counter + 1;
 else
 counter = 0;
 end

 endmodule