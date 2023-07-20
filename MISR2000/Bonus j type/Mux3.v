module Mux3(data_out, data_0, data_1, data_2, data_3, ForwardB);

input 	[31:0] 	data_0;
input 	[31:0] 	data_1;
input 	[31:0] 	data_2;
input 	[31:0] 	data_3;
input	[1:0]	ForwardB;
output	[31:0] 	data_out;
reg	[31:0] 	data_out;

always@(ForwardB or data_0 or data_1 or data_2 or data_3)  begin
	case(ForwardB)
	0:	data_out = data_0; 
	1:	data_out = data_1; 
	2:	data_out = data_2; 
	3:	data_out = data_3; 
	endcase
end
endmodule
