module EX_MEM(	MemRead, MemWrite, Ex_Mem_WB_out, 
		Ex_Mem_ALUResult_out, Ex_Mem_Mux8_out, Ex_Mem_Mux0_out, 
		Ex_Mem_WB_in, Ex_Mem_M_in, 
		Ex_Mem_ALUResult_in, Ex_Mem_Mux8_in, Ex_Mem_Mux0_in, rst,clk);

input	rst;
input 	clk;
input	[1:0]	Ex_Mem_WB_in;
input	[3:0]	Ex_Mem_M_in;
input	[31:0]	Ex_Mem_ALUResult_in;
input	[31:0]	Ex_Mem_Mux8_in;
input	[4:0]	Ex_Mem_Mux0_in;

output	[1:0]	MemRead;
output	[1:0]	MemWrite;
output	[1:0]	Ex_Mem_WB_out;
output	[31:0]	Ex_Mem_ALUResult_out;
output	[31:0]	Ex_Mem_Mux8_out;
output	[4:0]	Ex_Mem_Mux0_out;

reg	[1:0]	MemRead;
reg	[1:0]	MemWrite;
reg	[1:0]	Ex_Mem_WB_out;
reg	[31:0]	Ex_Mem_ALUResult_out;
reg	[31:0]	Ex_Mem_Mux8_out;
reg	[4:0]	Ex_Mem_Mux0_out;

always@(posedge clk or posedge rst)begin
	if(rst)begin
 		MemRead = 0;
		MemWrite = 0;
		Ex_Mem_WB_out = 0;
		Ex_Mem_ALUResult_out = 0;
		Ex_Mem_Mux8_out = 0;
		Ex_Mem_Mux0_out = 0;
	end
	else begin
		MemRead = Ex_Mem_M_in[3:2];
		MemWrite = Ex_Mem_M_in[1:0];
		Ex_Mem_WB_out = Ex_Mem_WB_in;
		Ex_Mem_ALUResult_out = Ex_Mem_ALUResult_in;
		Ex_Mem_Mux8_out = Ex_Mem_Mux8_in;
		Ex_Mem_Mux0_out = Ex_Mem_Mux0_in;
	end
end

endmodule