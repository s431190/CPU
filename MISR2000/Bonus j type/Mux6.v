module Mux6(data_out, data_0, data_1, Stall);

input 	[16:0] data_0;
input 	[16:0] data_1;
input	Stall;

output	[16:0] data_out;

assign  	data_out = (Stall)?	data_1 : data_0;

endmodule

