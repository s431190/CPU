module Adder0(data_out, data_1, data_2);

input 	[31:0] data_1;
input 	[31:0] data_2;
output	[31:0] data_out;

assign  	data_out = data_1+data_2;
endmodule