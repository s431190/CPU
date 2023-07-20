module Instruction_memory(Read_data, Address);

output	[31:0]	Read_data;
input	[31:0]	Address;
reg	[7:0]	instruction [1023:0];

assign	Read_data[7:0] = instruction [Address] ;
assign	Read_data[15:8] = instruction [Address+1] ;
assign	Read_data[23:16] = instruction [Address+2] ;
assign	Read_data[31:24] = instruction [Address+3] ;

endmodule
