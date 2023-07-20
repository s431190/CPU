module PC(data_out, data_in, PCWrite, rst, clk);

input	[31:0]	data_in;
input 		PCWrite; 
input 		rst;
input 		clk;
output	[31:0]	data_out;
reg	[31:0]	data_out;

always@(negedge clk or posedge rst)	begin
	if(rst) 	data_out = 32'd0;
	else if(PCWrite)	data_out = data_in;

end


endmodule
