module Sign_extend(data_out, data_in);
input 	[15:0] data_in;
output	[31:0] data_out;

assign  	data_out = (data_in[15])? 	{16'hffff,data_in} :{16'h0000,data_in};

endmodule