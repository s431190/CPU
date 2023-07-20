module MEM_WB(MemtoReg, RegWrite, Mem_Wb_ReadMemData_out, Mem_Wb_ALUResoult_out, Mem_Wb_Mux0_out, 
		 Mem_Wb_WB_in, Mem_Wb_ReadMemData_in, Mem_Wb_ALUResoult_in, Mem_Wb_Mux0_in, rst, clk);	
input	rst;
input 	clk;
input	[1:0]	Mem_Wb_WB_in;
input	[31:0]	Mem_Wb_ReadMemData_in;
input	[31:0]	Mem_Wb_ALUResoult_in;
input 	[4:0]	Mem_Wb_Mux0_in;

output		MemtoReg;
output		RegWrite;
output	[31:0]	Mem_Wb_ReadMemData_out;
output	[31:0]	Mem_Wb_ALUResoult_out;
output 	[4:0]	Mem_Wb_Mux0_out;

reg		MemtoReg;
reg		RegWrite;
reg	[31:0]	Mem_Wb_ReadMemData_out;
reg	[31:0]	Mem_Wb_ALUResoult_out;
reg 	[4:0]	Mem_Wb_Mux0_out;

always@(posedge clk or posedge rst)begin
	if(rst)begin
		MemtoReg = 0;
		RegWrite = 0;
		Mem_Wb_ReadMemData_out = 0;
		Mem_Wb_ALUResoult_out = 0;
		Mem_Wb_Mux0_out = 0;
	end
	else begin
		MemtoReg = Mem_Wb_WB_in[1];
		RegWrite = Mem_Wb_WB_in[0];
		Mem_Wb_ReadMemData_out = Mem_Wb_ReadMemData_in;
		Mem_Wb_ALUResoult_out = Mem_Wb_ALUResoult_in;
		Mem_Wb_Mux0_out = Mem_Wb_Mux0_in;
	end
end

endmodule