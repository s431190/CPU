module IF_ID(If_Id_add0_out, If_Id_Instruction_out, If_Id_add0_in, If_Id_Instruction_in, If_Id_Write, If_Id_Flush,  rst, clk );

input	[31:0]	If_Id_add0_in;
input	[31:0]	If_Id_Instruction_in;
input		rst;
input	 	clk;
input		If_Id_Write;
input		If_Id_Flush;

output	[31:0]	If_Id_add0_out;
output	[31:0]	If_Id_Instruction_out;

reg	[31:0]	If_Id_add0_out;
reg	[31:0]	If_Id_Instruction_out;

always@(posedge clk or posedge rst )begin
	
	if(rst || If_Id_Flush)begin
		If_Id_add0_out = 0;
		If_Id_Instruction_out = 0;	
	end
	else if(If_Id_Write) begin
		If_Id_add0_out = If_Id_add0_in;
		If_Id_Instruction_out = If_Id_Instruction_in;	
	end

end

endmodule