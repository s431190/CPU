module Shift_left_two1(data_out, data_in);

input 	[25:0] data_in;
output	[27:0] data_out;

assign  	data_out = {data_in,2'b00} ;
endmodule