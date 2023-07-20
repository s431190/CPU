module Mux2(data_out, data_0, data_1, PCSrc);

input 	[31:0] data_0;
input 	[31:0] data_1;
input	PCSrc;

output	[31:0] data_out;

assign  	data_out = (PCSrc)?	data_1 : data_0;

endmodule