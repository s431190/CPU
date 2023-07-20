module Mux9(data_out, Write_Enable,Jump);

input  Write_Enable;
input 	Jump;

output	[5:0] data_out;
assign  data_out = (Write_Enable && Jump)?6'b011111 : 6'b000000;

endmodule
																					
																					
																					