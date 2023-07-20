module Mux1(data_out, data_0, data_1, MemtoReg);

input 	[31:0] data_0;
input 	[31:0] data_1;
input	MemtoReg;

output	[31:0] data_out;

assign  	data_out = (MemtoReg)?	data_1 : data_0;

endmodule