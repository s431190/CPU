module Mux7(data_out, data_0, data_1, Jump);

input 	[31:0] data_0;
input 	[31:0] data_1;
input	Jump;

output	[31:0] data_out;

assign  	data_out = (Jump)?	data_1 : data_0;

endmodule