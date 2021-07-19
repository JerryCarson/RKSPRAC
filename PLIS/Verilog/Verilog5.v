module counter (DIN, COUNT, DIR, RST, CLK);
input [13:0] DIN;
input LOAD, CE, DIR, RST, CLK;
output [13:0] COUNT;
reg [13:0] COUNT;
always @(posedge CLK or posedge RST)
begin
if (RST == 1) COUNT <= 'b0;
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
end
endmodule