module Mux5(data_out, data_0, data_1, ALUSrc);

input 	[31:0] data_0;
input 	[31:0] data_1;
input	ALUSrc;

output	[31:0] data_out;

assign  	data_out = (ALUSrc)?	data_1 : data_0;

endmodule