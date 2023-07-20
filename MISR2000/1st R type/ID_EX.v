module ID_EX(	ALUSrc, ALUOp, RegDst, 
		Id_Ex_WB_out, Id_Ex_M_out, Id_Ex_ReadRegData1_out, Id_Ex_ReadRegData2_out, 
		Id_Ex_SignExtend_out, Id_Ex_rs_out,  Id_Ex_rt_out, Id_Ex_rd_out, 
		Id_Ex_WB_in, Id_Ex_M_in, Id_Ex_EX_in, Id_Ex_ReadRegData1_in, Id_Ex_ReadRegData2_in, 
		Id_Ex_SignExtend_in, Id_Ex_rs_in, Id_Ex_rt_in, Id_Ex_rd_in, rst, clk);

input	rst;
input 	clk;
input	[1:0]	Id_Ex_WB_in;
input	[3:0]	Id_Ex_M_in;
input 	[7:0]	Id_Ex_EX_in;
input	[31:0]	Id_Ex_ReadRegData1_in;
input	[31:0]	Id_Ex_ReadRegData2_in;
input	[31:0]	Id_Ex_SignExtend_in;
input	[4:0]	Id_Ex_rs_in;
input	[4:0]	Id_Ex_rt_in;
input	[4:0]	Id_Ex_rd_in;

output	[1:0]	Id_Ex_WB_out;
output	[3:0]	Id_Ex_M_out;
output		ALUSrc;
output	[5:0]	ALUOp;
output		RegDst;
output	[31:0]	Id_Ex_ReadRegData1_out;
output	[31:0]	Id_Ex_ReadRegData2_out;
output	[31:0]	Id_Ex_SignExtend_out;
output	[4:0]	Id_Ex_rs_out;
output	[4:0]	Id_Ex_rt_out;
output	[4:0]	Id_Ex_rd_out;


reg	[1:0]	Id_Ex_WB_out;
reg	[3:0]	Id_Ex_M_out;
reg		ALUSrc;
reg	[5:0]	ALUOp;
reg		RegDst;
reg	[31:0]	Id_Ex_ReadRegData1_out;
reg	[31:0]	Id_Ex_ReadRegData2_out;
reg	[31:0]	Id_Ex_SignExtend_out;
reg	[4:0]	Id_Ex_rs_out;
reg	[4:0]	Id_Ex_rt_out;
reg	[4:0]	Id_Ex_rd_out;


always@(posedge clk or posedge rst)begin
	if(rst)begin
		ALUSrc = 0;
		ALUOp = 0;
		RegDst = 0;
		Id_Ex_WB_out = 0;
		Id_Ex_M_out = 0;
		Id_Ex_ReadRegData1_out = 0;
		Id_Ex_ReadRegData2_out = 0;
		Id_Ex_SignExtend_out = 0;
		Id_Ex_rs_out = 0;
		Id_Ex_rt_out = 0;
		Id_Ex_rd_out = 0;
	end
	else begin
		ALUSrc = Id_Ex_EX_in[7];
		ALUOp = Id_Ex_EX_in[6:1];
		RegDst = Id_Ex_EX_in[0];
		Id_Ex_WB_out = Id_Ex_WB_in;
		Id_Ex_M_out = Id_Ex_M_in;
		Id_Ex_ReadRegData1_out = Id_Ex_ReadRegData1_in;
		Id_Ex_ReadRegData2_out = Id_Ex_ReadRegData2_in;
		Id_Ex_SignExtend_out = Id_Ex_SignExtend_in;
		Id_Ex_rs_out = Id_Ex_rs_in;
		Id_Ex_rt_out = Id_Ex_rt_in;
		Id_Ex_rd_out = Id_Ex_rd_in;
	end
end

endmodule