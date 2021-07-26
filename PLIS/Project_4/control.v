module control
(
read_full,
read_empty,
read_req,
clk,
);

input read_full;
input read_empty;
output read_req;
input clk;
reg read_req;
reg check;
initial check = 0;
initial read_req = 0;

always @(posedge clk)
	begin
		if(read_full == 1)
			begin
			check = 1;
			read_req = 1;
			end
		else if(read_full == 0)
			begin
				if (read_empty == 1)
					begin
						check = 0;
						read_req = 0;
					end
				else if (read_empty == 0)
					begin
						if (check == 1)
						read_req = 1;
					end
			end
		else
			begin
				read_req = 0;
			end
	end
endmodule