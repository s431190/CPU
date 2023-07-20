module MIPS_R2000(clk,rst);

input clk;
input rst;

//////////////////////////////////////////////////////   
//Adder0
wire	[31:0] 	Add0_data_out;

//Adder1
wire	[31:0] 	Add1_data_out;

//ALU
wire	[31:0]	alu_out;

//ALU_control
wire	[3:0]	sel;

//Branch_Jump_Detection
wire		If_Id_Flush;
wire		PCSrc;

//Control
wire	[1:0]	Branch;
wire		Jump;
wire 	[1:0]	WB;
wire 	[3:0]	M;
wire 	[7:0]	EX;

//Data_memory 
wire	[31:0]	Read_Data_Mem_data;

//EX_MEM
wire	[1:0]	MemRead;
wire	[1:0]	MemWrite;
wire	[1:0]	Ex_Mem_WB_out;
wire	[31:0]	Ex_Mem_ALUResult_out;
wire	[31:0]	Ex_Mem_Mux8_out;
wire	[4:0]	Ex_Mem_Mux0_out;

//Forwarding_unti
wire	[1:0]	ForwardA;		
wire	[1:0]	ForwardB;
wire	[1:0]	ForwardC;

//HazardDetectionUnit
wire		Stall;
wire		If_Id_Write;
wire		PCWrite;

//ID_EX
wire	[1:0]	Id_Ex_WB_out;
wire	[3:0]	Id_Ex_M_out;
wire		ALUSrc;
wire	[5:0]	ALUOp;
wire		RegDst;
wire	[31:0]	Id_Ex_ReadRegData1_out;
wire	[31:0]	Id_Ex_ReadRegData2_out;
wire	[31:0]	Id_Ex_SignExtend_out;
wire	[4:0]	Id_Ex_rs_out;
wire	[4:0]	Id_Ex_rt_out;
wire	[4:0]	Id_Ex_rd_out;

//IF_ID
wire	[31:0]	If_Id_add0_out;
wire	[31:0]	If_Id_Instruction_out;

//Instruction_memory
wire	[31:0]	Read_Instruction_Mem_data;

//MEM_WB
wire		MemtoReg;
wire		RegWrite;
wire	[31:0]	Mem_Wb_ReadMemData_out;
wire	[31:0]	Mem_Wb_ALUResoult_out;
wire 	[4:0]	Mem_Wb_Mux0_out;

//Mux0
wire	[4:0] 	Mux0_data_out;

//Mux1
wire	[31:0] 	Mux1_data_out;

//Mux2
wire	[31:0] 	Mux2_data_out;

//Mux3
wire	[31:0] 	Mux3_data_out;

//Mux4
wire	[31:0] 	Mux4_data_out;

//Mux5
wire	[31:0]	Mux5_data_out;

//Mux6
wire	[16:0] 	Mux6_data_out;

//Mux7
wire	[31:0] 	Mux7_data_out;

//Mux8
wire	[31:0] 	Mux8_data_out;

//PC
wire	[31:0]	PC_data_out;

//Registers
wire	[31:0]	Reg_Data_Out_1;
wire      	[31:0]	Reg_Data_Out_2;
	
//Shift_left_two0
wire	[31:0] 	Shift0_data_out;

//Shift_left_two1
wire	[27:0] 	Shift1_data_out;

//Sign_extend
wire	[31:0] 	Sign_Extend_data_out;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Adder0	Adder0( 
		.data_out(Add0_data_out), 
		.data_1(PC_data_out), 
		.data_2(4)
		);

Adder1	Adder1( 
		.data_out(Add1_data_out), 
		.data_1(If_Id_add0_out), 
		.data_2(Shift0_data_out) 
		);
ALU	ALU( 
		.alu_out(alu_out), 
		.data_1(Mux4_data_out), 
		.data_2(Mux5_data_out), 
		.sel(sel),
		.shamt(Id_Ex_SignExtend_out[10:6]) 
		);
ALU_control	ALU_control( 
		.sel(sel), 
		.Function(Id_Ex_SignExtend_out[5:0]), 
		.ALUOp(ALUOp) 
		);
Branch_Jump_Detection	Branch_Jump_Detection( 
		.If_Id_Flush(If_Id_Flush), 
		.PCSrc(PCSrc), 
		.data_1(Reg_Data_Out_1), 
		.data_2(Reg_Data_Out_2), 
		.Branch(Mux6_data_out[16:15]), 
		.Jump(Mux6_data_out[15]) 
		);
Control	Control( 
		.Branch(Branch), 
		.Jump(Jump), 
		.WB(WB), 
		.M(M), 
		.EX(EX), 
		.OPCode(If_Id_Instruction_out[31:26]) 
		);
Data_memory	Data_memory( 
		.Read_data(Read_Data_Mem_data), 
		.Write_data(Ex_Mem_Mux8_out), 
		.Address(Ex_Mem_ALUResult_out), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.clk(clk)
		);
EX_MEM	EX_MEM( 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Ex_Mem_WB_out(Ex_Mem_WB_out), 
		.Ex_Mem_ALUResult_out(Ex_Mem_ALUResult_out), 
		.Ex_Mem_Mux8_out(Ex_Mem_Mux8_out), 
		.Ex_Mem_Mux0_out(Ex_Mem_Mux0_out), 
		.Ex_Mem_WB_in(Id_Ex_WB_out), 
		.Ex_Mem_M_in(Id_Ex_M_out), 
		.Ex_Mem_ALUResult_in(alu_out), 
		.Ex_Mem_Mux8_in(Mux8_data_out), 
		.Ex_Mem_Mux0_in(Mux0_data_out), 
		.rst(rst),
		.clk(clk)
		);
Forwarding_unti	Forwarding_unti( 
		.ForwardA(ForwardA), 
		.ForwardB(ForwardB), 
		.ForwardC(ForwardC), 
		.Ex_Mem_RegWrite(Ex_Mem_WB_out[0]), 
		.Mem_Wb_RegWrite(RegWrite), 
		.Ex_Mem_rd(Ex_Mem_Mux0_out), 
		.Mem_Wb_rd(Mem_Wb_Mux0_out), 
		.Id_Ex_rs(Id_Ex_rs_out), 
		.Id_Ex_rt(Id_Ex_rt_out) 
		);
HazardDetectionUnit	HazardDetectionUnit( 
		.Stall(Stall), 
		.If_Id_Write(If_Id_Write), 
		.PCWrite(PCWrite), 
		.Id_Ex_MemRead(Id_Ex_M_out[3:2]), 
		.Id_Ex_rt(Id_Ex_rt_out), 
		.If_Id_rt(If_Id_Instruction_out[20:16]), 
		.If_Id_rs(If_Id_Instruction_out[25:21])  
		);
ID_EX	ID_EX( 
		.ALUSrc(ALUSrc), 
		.ALUOp(ALUOp), 
		.RegDst(RegDst), 
		.Id_Ex_WB_out(Id_Ex_WB_out), 
		.Id_Ex_M_out(Id_Ex_M_out), 
		.Id_Ex_ReadRegData1_out(Id_Ex_ReadRegData1_out), 
		.Id_Ex_ReadRegData2_out(Id_Ex_ReadRegData2_out), 
		.Id_Ex_SignExtend_out(Id_Ex_SignExtend_out), 
		.Id_Ex_rs_out(Id_Ex_rs_out),  
		.Id_Ex_rt_out(Id_Ex_rt_out), 
		.Id_Ex_rd_out(Id_Ex_rd_out), 
		.Id_Ex_WB_in(Mux6_data_out[13:12]), 
		.Id_Ex_M_in(Mux6_data_out[11:8]), 
		.Id_Ex_EX_in(Mux6_data_out[7:0]), 
		.Id_Ex_ReadRegData1_in(Reg_Data_Out_1), 
		.Id_Ex_ReadRegData2_in(Reg_Data_Out_2), 
		.Id_Ex_SignExtend_in(Sign_Extend_data_out), 
		.Id_Ex_rs_in(If_Id_Instruction_out[25:21]), 
		.Id_Ex_rt_in(If_Id_Instruction_out[20:16]), 
		.Id_Ex_rd_in(If_Id_Instruction_out[15:11]), 
		.rst(rst), 
		.clk(clk)
		);
IF_ID	IF_ID( 
		.If_Id_add0_out(If_Id_add0_out), 
		.If_Id_Instruction_out(If_Id_Instruction_out), 
		.If_Id_add0_in(Add0_data_out), 
		.If_Id_Instruction_in(Read_Instruction_Mem_data), 
		.If_Id_Write(If_Id_Write), 
		.If_Id_Flush(If_Id_Flush),  
		.rst(rst), 
		.clk(clk) 
		);
Instruction_memory	Instruction_memory( 
		.Read_data(Read_Instruction_Mem_data), 
		.Address(PC_data_out) 
		);
MEM_WB	MEM_WB( 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.Mem_Wb_ReadMemData_out(Mem_Wb_ReadMemData_out), 
		.Mem_Wb_ALUResoult_out(Mem_Wb_ALUResoult_out), 
		.Mem_Wb_Mux0_out(Mem_Wb_Mux0_out), 
		.Mem_Wb_WB_in(Ex_Mem_WB_out), 
		.Mem_Wb_ReadMemData_in(Read_Data_Mem_data), 
		.Mem_Wb_ALUResoult_in(Ex_Mem_ALUResult_out), 
		.Mem_Wb_Mux0_in(Ex_Mem_Mux0_out), 
		.rst(rst), 
		.clk(clk)
		);	
Mux0	Mux0( 
		.data_out(Mux0_data_out), 
		.data_0(Id_Ex_rt_out), 
		.data_1(Id_Ex_rd_out), 
		.RegDst(RegDst) 
		);
Mux1	Mux1( 
		.data_out(Mux1_data_out), 
		.data_0(Mem_Wb_ALUResoult_out), 
		.data_1(Mem_Wb_ReadMemData_out), 
		.MemtoReg(MemtoReg) 
		);
Mux2	Mux2( 
		.data_out(Mux2_data_out), 
		.data_0(Add0_data_out), 
		.data_1(Add1_data_out), 
		.PCSrc(PCSrc) 
		);
Mux3	Mux3( 
		.data_out(Mux3_data_out), 
		.data_0(Id_Ex_ReadRegData2_out), 
		.data_1(Mux1_data_out), 
		.data_2(Ex_Mem_ALUResult_out), 
		.data_3(0), 
		.ForwardB(ForwardB) 
		);
Mux4	Mux4( 
		.data_out(Mux4_data_out), 
		.data_0(Id_Ex_ReadRegData1_out), 
		.data_1(Mux1_data_out), 
		.data_2(Ex_Mem_ALUResult_out), 
		.data_3(0),
		.ForwardA(ForwardA) 
		);
Mux5	Mux5( 
		.data_out(Mux5_data_out), 
		.data_0(Mux3_data_out), 
		.data_1(Id_Ex_SignExtend_out), 
		.ALUSrc(ALUSrc) 
		);
Mux6	Mux6( 
		.data_out(Mux6_data_out), 
		.data_0({Branch,Jump,WB,M,EX}), 
		.data_1(17'b0), 
		.Stall(Stall) 
		);
Mux7	Mux7( 
		.data_out(Mux7_data_out), 
		.data_0(Mux2_data_out), 
		.data_1({If_Id_add0_out[31:28],Shift1_data_out}), 
		.Jump(Mux6_data_out[14]) 
		);
Mux8	Mux8( 
		.data_out(Mux8_data_out), 
		.data_0(Id_Ex_ReadRegData2_out), 
		.data_1(Mux1_data_out), 
		.data_2(Ex_Mem_ALUResult_out), 
		.data_3(0),
		.ForwardC(ForwardC) 
		);
PC	PC( 
		.data_out(PC_data_out), 
		.data_in(Mux7_data_out), 		
		.PCWrite(PCWrite), 
		.rst(rst), 
		.clk(clk)
		);
Registers	Registers( 
		.Data_Out_1(Reg_Data_Out_1),
		.Data_Out_2(Reg_Data_Out_2),
		.Data_in(Mux1_data_out),
		.Read_Addr_1(If_Id_Instruction_out[25:21]),
		.Read_Addr_2(If_Id_Instruction_out[20:16]),
		.Write_Addr(Mem_Wb_Mux0_out),
		.Write_Enable(RegWrite),
		.rst(rst),
		.clk(clk)
		);
Shift_left_two0	Shift_left_two0( 
		.data_out(Shift0_data_out), 
		.data_in(Sign_Extend_data_out) 
		);
Shift_left_two1	Shift_left_two1( 
		.data_out(Shift1_data_out), 
		.data_in(If_Id_Instruction_out[25:0]) 
		);
Sign_extend	Sign_extend( 
		.data_out(Sign_Extend_data_out), 
		.data_in(If_Id_Instruction_out[15:0]) 
		);


endmodule