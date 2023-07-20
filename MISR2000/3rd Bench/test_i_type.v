module testbench2();
reg	clk;
reg	rst;

wire 	[31:0]	PC;
wire 	[31:0]	IR;

//control ID/EX
wire		RegDst;
wire 	[5:0]	ALUOp;
wire		ALUSrc;

//control EX/MEM
wire	[1:0]	MemWrite;
wire	[1:0]	MemRead;

//control MEM/WB
wire		MemtoRge;
wire		RegWrite;

//control Hazard Detection Unit
wire		PCWrite;
wire		If_Id_Write;
wire		Stall;

//Mux
wire	[4:0] 	Mux0_out;
wire	[31:0] 	Mux1_out;
wire	[31:0] 	Mux2_out;
wire	[31:0] 	Mux3_out;
wire	[31:0] 	Mux4_out;
wire	[31:0] 	Mux5_out;
wire	[16:0] 	Mux6_out;
wire 	[31:0]	Mux7_out;


wire	[31:0]	RegData1;
wire	[31:0]	RegData2;

wire	[31:0]	ALUResult;

wire	[31:0]	MemAddr;
wire	[31:0]	MemWriteData;
wire	[31:0]	MemReadData;

//============================================================

MIPS_R2000 	MIPS(clk,rst);


assign	PC = MIPS.PC.data_out;
assign	IR = MIPS.Instruction_memory.Read_data;

assign	RegDst 	= MIPS.ID_EX.RegDst;
assign	ALUOp 	= MIPS.ID_EX.ALUOp;
assign	ALUSrc 	= MIPS.ID_EX.ALUSrc;

assign	MemWrite = MIPS.EX_MEM.MemWrite;
assign	MemRead = MIPS.EX_MEM.MemRead;

assign	MemtoRge = MIPS.MEM_WB.MemtoReg;
assign	RegWrite = MIPS.MEM_WB.RegWrite;

assign	PCWrite = MIPS.HazardDetectionUnit.PCWrite;
assign	If_Id_Write = MIPS.HazardDetectionUnit.If_Id_Write;
assign	Stall = MIPS.HazardDetectionUnit.Stall;

assign	Mux0_out = MIPS.Mux0.data_out;
assign	Mux1_out = MIPS.Mux1.data_out;
assign	Mux2_out = MIPS.Mux2.data_out;
assign	Mux3_out = MIPS.Mux3.data_out;
assign	Mux4_out = MIPS.Mux4.data_out;
assign	Mux5_out = MIPS.Mux5.data_out;
assign	Mux6_out = MIPS.Mux6.data_out;
assign	Mux7_out = MIPS.Mux7.data_out;

assign	RegData1 = MIPS.Registers.Data_Out_1;
assign	RegData2 = MIPS.Registers.Data_Out_2;

assign	ALUResult = MIPS.ALU.alu_out;

assign	MemAddr = MIPS.Data_memory.Address ;
assign	MemWriteData = MIPS.Data_memory.Write_data;
assign	MemReadData = MIPS.Data_memory.Read_data;


initial begin
	clk=0;
	rst=1;

	#50
	rst=0;

//=========================================================================================
// Reg initial r2=2, r3=3, r4=4, r5=5, r6=6, r7=7, r8=8, r9=9, r10=10 

//////////////No.1 i type text////////////////

/*
MIPS.Instruction_memory.instruction[0]= 8'h00;     //addi $2, $2, 0  
MIPS.Instruction_memory.instruction[1]= 8'h00;     //001000_00010_00010_0000000000000000
MIPS.Instruction_memory.instruction[2]= 8'h42;     
MIPS.Instruction_memory.instruction[3]= 8'h20;     

MIPS.Instruction_memory.instruction[4]= 8'h01;     //addi $3, $3, 1
MIPS.Instruction_memory.instruction[5]= 8'h00;     //001000_00011_00011_0000000000000001
MIPS.Instruction_memory.instruction[6]= 8'h63;     
MIPS.Instruction_memory.instruction[7]= 8'h20;     

MIPS.Instruction_memory.instruction[8]= 8'h02;     //addi $4, $4, 2
MIPS.Instruction_memory.instruction[9]= 8'h00;     //001000_00100_00100_0000000000000010
MIPS.Instruction_memory.instruction[10]= 8'h84;     
MIPS.Instruction_memory.instruction[11]= 8'h20;

MIPS.Instruction_memory.instruction[12]= 8'h01;     //xori $2, $5, 1  
MIPS.Instruction_memory.instruction[13]= 8'h00;     //001110_00010_00101_0000000000000010
MIPS.Instruction_memory.instruction[14]= 8'h45;     
MIPS.Instruction_memory.instruction[15]= 8'h38;     

MIPS.Instruction_memory.instruction[16]= 8'h02;     //xori $3, $6, 2  
MIPS.Instruction_memory.instruction[17]= 8'h00;     //001110_00011_00110_0000000000000010
MIPS.Instruction_memory.instruction[18]= 8'h66;     
MIPS.Instruction_memory.instruction[19]= 8'h38;   
*/
//////////////No.2 i type text////////////////
/*
MIPS.Instruction_memory.instruction[0]= 8'h01;     //addi $2, $2, 1  
MIPS.Instruction_memory.instruction[1]= 8'h00;     //001000_00010_00010_0000000000000000
MIPS.Instruction_memory.instruction[2]= 8'h42;     
MIPS.Instruction_memory.instruction[3]= 8'h20;     

MIPS.Instruction_memory.instruction[4]= 8'h02;     //addi $3, $3, 2
MIPS.Instruction_memory.instruction[5]= 8'h00;     //001000_00011_00011_0000000000000001
MIPS.Instruction_memory.instruction[6]= 8'h63;     
MIPS.Instruction_memory.instruction[7]= 8'h20;     

MIPS.Instruction_memory.instruction[8]= 8'h03;     //addi $4, $4, 3
MIPS.Instruction_memory.instruction[9]= 8'h00;     //001000_00100_00100_0000000000000010
MIPS.Instruction_memory.instruction[10]= 8'h84;     
MIPS.Instruction_memory.instruction[11]= 8'h20;

MIPS.Instruction_memory.instruction[12]= 8'h04;     //addi $5, $5, 4  
MIPS.Instruction_memory.instruction[13]= 8'h00;     //001000_00101_00101_0000000000000011
MIPS.Instruction_memory.instruction[14]= 8'b101_00101;     
MIPS.Instruction_memory.instruction[15]= 8'b001000_00;     


MIPS.Instruction_memory.instruction[16]= 8'h01;    //ble $4, $5, 1 true
MIPS.Instruction_memory.instruction[17]= 8'h00;    //111010_000101_00100_0000000000000001
MIPS.Instruction_memory.instruction[18]= 8'b101_00100;     
MIPS.Instruction_memory.instruction[19]= 8'b111010_00;


MIPS.Instruction_memory.instruction[20]= 8'h05;     //addi $6, $6, 5 //no print
MIPS.Instruction_memory.instruction[21]= 8'h00;     //001000_00110_00110_0000000000000100
MIPS.Instruction_memory.instruction[22]= 8'b110_00110;     
MIPS.Instruction_memory.instruction[23]= 8'b001000_00;     

MIPS.Instruction_memory.instruction[24]= 8'h06;     //addi $7, $7, 6
MIPS.Instruction_memory.instruction[25]= 8'h00;     //001000_00111_00111_0000000000000101
MIPS.Instruction_memory.instruction[26]= 8'b111_00111;     
MIPS.Instruction_memory.instruction[27]= 8'b001000_00;
*/
//////////////No.3 i type text////////////////

MIPS.Instruction_memory.instruction[0]= 8'h01;     //addi $2, $2, 1  
MIPS.Instruction_memory.instruction[1]= 8'h00;     //001000_00010_00010_0000000000000000
MIPS.Instruction_memory.instruction[2]= 8'h42;     
MIPS.Instruction_memory.instruction[3]= 8'h20;     

MIPS.Instruction_memory.instruction[4]= 8'h02;     //addi $3, $3, 2
MIPS.Instruction_memory.instruction[5]= 8'h00;     //001000_00011_00011_0000000000000001
MIPS.Instruction_memory.instruction[6]= 8'h63;     
MIPS.Instruction_memory.instruction[7]= 8'h20;     

MIPS.Instruction_memory.instruction[8]= 8'h03;     //addi $4, $4, 3
MIPS.Instruction_memory.instruction[9]= 8'h00;     //001000_00100_00100_0000000000000010
MIPS.Instruction_memory.instruction[10]= 8'h84;     
MIPS.Instruction_memory.instruction[11]= 8'h20;

MIPS.Instruction_memory.instruction[12]= 8'h04;     //addi $5, $5, 4  
MIPS.Instruction_memory.instruction[13]= 8'h00;     //001000_00101_00101_0000000000000011
MIPS.Instruction_memory.instruction[14]= 8'b101_00101;     
MIPS.Instruction_memory.instruction[15]= 8'b001000_00;     


MIPS.Instruction_memory.instruction[16]= 8'h01;    //bgt $4, $5, 1 flase
MIPS.Instruction_memory.instruction[17]= 8'h00;    //111011_000101_00100_0000000000000001
MIPS.Instruction_memory.instruction[18]= 8'b101_00100;     
MIPS.Instruction_memory.instruction[19]= 8'b111011_00;


MIPS.Instruction_memory.instruction[20]= 8'h05;     //addi $6, $6, 5 //no print
MIPS.Instruction_memory.instruction[21]= 8'h00;     //001000_00110_00110_0000000000000100
MIPS.Instruction_memory.instruction[22]= 8'b110_00110;     
MIPS.Instruction_memory.instruction[23]= 8'b001000_00;     

MIPS.Instruction_memory.instruction[24]= 8'h06;     //addi $7, $7, 6
MIPS.Instruction_memory.instruction[25]= 8'h00;     //001000_00111_00111_0000000000000101
MIPS.Instruction_memory.instruction[26]= 8'b111_00111;     
MIPS.Instruction_memory.instruction[27]= 8'b001000_00;






//=========================================================================================   
	#200000	$stop;
	end
	
initial begin
	$dumpfile("testMIPS.vcd");
	$dumpvars();
	end

always #100 clk=~clk;

endmodule

