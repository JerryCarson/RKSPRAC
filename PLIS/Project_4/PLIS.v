module PLIS (
input [1:0] a,
input wire rdy,
input clk,
output reg [10:0] s,
output reg [5:0] data_out,
output full, empty );
wire [10:0] l1, l2, l3; 
wire [5:0] l4; 
wire enb;

keep module_1(  .a (a), .LED0 (LED0), .LED1 (LED1), .LED2 (LED2), .out (l1) );
number module_2( .out (l1), .m (l2) );
control module_3( .rdy (ready), .empty (empty), .full (full), .enb (enb) );
count3 module_4( .clk (clk), .m (l2), .enb (enb), .s (s) );
ROM_4 module_5( .clock (clk), .address (l3), .q (l4) );
FIFO module_6( .data (l4), .wrclk (clk), .rdclk (rdclk), .q (data_out), .rdfull (full), .rdempty (empty) );

endmodule
