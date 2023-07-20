module Data_memory(Read_data, Write_data, Address, MemWrite, MemRead, clk);

output	[31:0]	Read_data;

input	[31:0]	Write_data;
input	[31:0]	Address;
input		clk;
input 	[1:0]	MemWrite,MemRead;

reg	[7:0]	memory0 [255:0];    // address0   |    memory3 - memory2 - memory1 - memory0 
reg	[7:0]	memory1 [255:0];    // address1   |    memory3 - memory2 - memory1 - memory0 
reg	[7:0]	memory2 [255:0];    // address2   |    memory3 - memory2 - memory1 - memory0 
reg	[7:0]	memory3 [255:0];    //        :		:	   :	       :	        :
	
parameter 	DoNothing = 2'b00;
parameter		WordWork = 2'b01;
parameter		ByteWork = 2'b10;

assign	Read_data[31:24] 	= (MemRead[0])? memory3[Address] : 8'd0;
assign	Read_data[23:16] 	= (MemRead[0])? memory2[Address] : 8'd0;
assign	Read_data[15:8] 	= (MemRead[0])? memory1[Address] : 8'd0;
assign	Read_data[7:0] 	= memory0[Address] ;

always@(negedge clk)	begin	
	case(MemWrite)
		{WordWork}:	begin
						memory3[Address] = Write_data[31:24];
						memory2[Address] = Write_data[23:16];
						memory1[Address] = Write_data[15:8];
						memory0[Address] = Write_data[7:0];
				end
		{ByteWork}:  	begin	
						//memory3[Address] = 8'd0;
						//memory2[Address] = 8'd0;
						//memory1[Address] = 8'd0;
						memory0[Address] = Write_data[7:0];					
				end
	endcase
end
endmodule
