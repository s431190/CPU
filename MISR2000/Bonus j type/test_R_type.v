module testbench1();
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

// Reg initial r2=2, r3=3, r4=4, r5=5, r6=6, r7=7, r8=8, r9=9, r10=10 
MIPS.Instruction_memory.instruction[0]= 8'h02;     //addi $2, $2, 2  
MIPS.Instruction_memory.instruction[1]= 8'h00;     
MIPS.Instruction_memory.instruction[2]= 8'h42;     
MIPS.Instruction_memory.instruction[3]= 8'h20;     

MIPS.Instruction_memory.instruction[4]= 8'h03;     //addi $3, $3, 3
MIPS.Instruction_memory.instruction[5]= 8'h00;     
MIPS.Instruction_memory.instruction[6]= 8'h63;     
MIPS.Instruction_memory.instruction[7]= 8'h20;     

MIPS.Instruction_memory.instruction[8]= 8'h04;     //addi $4, $4, 4
MIPS.Instruction_memory.instruction[9]= 8'h00;     
MIPS.Instruction_memory.instruction[10]= 8'h84;     
MIPS.Instruction_memory.instruction[11]= 8'h20;     

MIPS.Instruction_memory.instruction[12]= 8'h05;     //addi $5, $5, 5
MIPS.Instruction_memory.instruction[13]= 8'h00;     
MIPS.Instruction_memory.instruction[14]= 8'ha5;     
MIPS.Instruction_memory.instruction[15]= 8'h20;     

MIPS.Instruction_memory.instruction[16]= 8'h06;     //addi $6, $6, 6
MIPS.Instruction_memory.instruction[17]= 8'h00;     
MIPS.Instruction_memory.instruction[18]= 8'hc6;     
MIPS.Instruction_memory.instruction[19]= 8'h20;    
 
MIPS.Instruction_memory.instruction[20]= 8'h07;     //addi $7, $7, 7
MIPS.Instruction_memory.instruction[21]= 8'h00;     
MIPS.Instruction_memory.instruction[22]= 8'he7;     
MIPS.Instruction_memory.instruction[23]= 8'h20; 
/*
//XOR
MIPS.Instruction_memory.instruction[24]= 8'h26;     //xor $3, $2, $4
MIPS.Instruction_memory.instruction[25]= 8'h18;     
MIPS.Instruction_memory.instruction[26]= 8'h44;     
MIPS.Instruction_memory.instruction[27]= 8'h00;

//xori
MIPS.Instruction_memory.instruction[28]= 8'h05;     //xori $5, $6, 5
MIPS.Instruction_memory.instruction[29]= 8'h00;     
MIPS.Instruction_memory.instruction[30]= 8'hc5;     
MIPS.Instruction_memory.instruction[31]= 8'h38;
//
*/    

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
MIPS.Instruction_memory.instruction[24]= 8'h01;   //   bne $3, $2, 1     
MIPS.Instruction_memory.instruction[25]= 8'h00;     
MIPS.Instruction_memory.instruction[26]= 8'h62;     
MIPS.Instruction_memory.instruction[27]= 8'h14;   

MIPS.Instruction_memory.instruction[28]= 8'h08;     //addi $8, $8, 8
MIPS.Instruction_memory.instruction[29]= 8'h00;     
MIPS.Instruction_memory.instruction[30]= 8'h08;     
MIPS.Instruction_memory.instruction[31]= 8'h21;     

MIPS.Instruction_memory.instruction[32]= 8'h09;     //addi $7, $7, 7
MIPS.Instruction_memory.instruction[33]= 8'h00;     
MIPS.Instruction_memory.instruction[34]= 8'h29;     
MIPS.Instruction_memory.instruction[35]= 8'h21;     
*/
/*
MIPS.Instruction_memory.instruction[24]= 8'h05;   //     sw $7, 5($0)
MIPS.Instruction_memory.instruction[25]= 8'h00;     
MIPS.Instruction_memory.instruction[26]= 8'h07;     
MIPS.Instruction_memory.instruction[27]= 8'hac;    
 

//MIPS.Instruction_memory.instruction[24]= 8'h05;   //     sw $2, 5($0)
//MIPS.Instruction_memory.instruction[25]= 8'h00;     
//MIPS.Instruction_memory.instruction[26]= 8'h02;     
//MIPS.Instruction_memory.instruction[27]= 8'hac;    

MIPS.Instruction_memory.instruction[28]= 8'h05;     //   lw $10, 5($0)
MIPS.Instruction_memory.instruction[29]= 8'h00;     
MIPS.Instruction_memory.instruction[30]= 8'h0a;     
MIPS.Instruction_memory.instruction[31]= 8'h8c;    
 
MIPS.Instruction_memory.instruction[32]= 8'h01;     //  addi $10, $10, 1
MIPS.Instruction_memory.instruction[33]= 8'h00;     
MIPS.Instruction_memory.instruction[34]= 8'h4a;     
MIPS.Instruction_memory.instruction[35]= 8'h21;   


*/


/////////////////////////////////////////////////////////////////////
/*
MIPS.Instruction_memory.instruction[24]= 8'h01;   //     addi $10, $2, 1
MIPS.Instruction_memory.instruction[25]= 8'h00;     
MIPS.Instruction_memory.instruction[26]= 8'h4a;     
MIPS.Instruction_memory.instruction[27]= 8'h20;    
 
MIPS.Instruction_memory.instruction[28]= 8'h0b;     //   andi $11, $5, 11
MIPS.Instruction_memory.instruction[29]= 8'h00;     
MIPS.Instruction_memory.instruction[30]= 8'hab;     
MIPS.Instruction_memory.instruction[31]= 8'h30;    
 
MIPS.Instruction_memory.instruction[32]= 8'h08;     //   ori $12, $5, 8
MIPS.Instruction_memory.instruction[33]= 8'h00;     
MIPS.Instruction_memory.instruction[34]= 8'hac;     
MIPS.Instruction_memory.instruction[35]= 8'h34;   

MIPS.Instruction_memory.instruction[36]= 8'h08;     //   slti $13, $5, 8
MIPS.Instruction_memory.instruction[37]= 8'h00;     
MIPS.Instruction_memory.instruction[38]= 8'had;     
MIPS.Instruction_memory.instruction[39]= 8'h28;    
   
MIPS.Instruction_memory.instruction[40]= 8'h04;	   //       slti $14, $5, 4 
MIPS.Instruction_memory.instruction[41]= 8'h00;     
MIPS.Instruction_memory.instruction[42]= 8'hae;     
MIPS.Instruction_memory.instruction[43]= 8'h28;   

MIPS.Instruction_memory.instruction[44]= 8'h02;     //   sw $7, 2($3)
MIPS.Instruction_memory.instruction[45]= 8'h00;     
MIPS.Instruction_memory.instruction[46]= 8'h67;     
MIPS.Instruction_memory.instruction[47]= 8'hac;   
  
MIPS.Instruction_memory.instruction[48]= 8'h03;    //     lw $15, 3($2)
MIPS.Instruction_memory.instruction[49]= 8'h00;     
MIPS.Instruction_memory.instruction[50]= 8'h4f;     
MIPS.Instruction_memory.instruction[51]= 8'h8c;   
  
MIPS.Instruction_memory.instruction[52]= 8'h10;     //   addi $16, $15, 10000
MIPS.Instruction_memory.instruction[53]= 8'h27;     
MIPS.Instruction_memory.instruction[54]= 8'hf0;     
MIPS.Instruction_memory.instruction[55]= 8'h21;   
  
MIPS.Instruction_memory.instruction[56]= 8'h06;     //   sw $16, 6($2)
MIPS.Instruction_memory.instruction[57]= 8'h00;     
MIPS.Instruction_memory.instruction[58]= 8'h50;     
MIPS.Instruction_memory.instruction[59]= 8'hac;   

MIPS.Instruction_memory.instruction[60]= 8'h06;     //   lb $17, 6($2)
MIPS.Instruction_memory.instruction[61]= 8'h00;     
MIPS.Instruction_memory.instruction[62]= 8'h51;     
MIPS.Instruction_memory.instruction[63]= 8'h80;     

MIPS.Instruction_memory.instruction[64]= 8'h06;     //   sb $7, 6($2)
MIPS.Instruction_memory.instruction[65]= 8'h00;     
MIPS.Instruction_memory.instruction[66]= 8'h47;     
MIPS.Instruction_memory.instruction[67]= 8'ha0;     

MIPS.Instruction_memory.instruction[68]= 8'h06;     //   lw $18, 6($2)
MIPS.Instruction_memory.instruction[69]= 8'h00;     
MIPS.Instruction_memory.instruction[70]= 8'h52;     
MIPS.Instruction_memory.instruction[71]= 8'h8c;     

//for loop 

MIPS.Instruction_memory.instruction[72]= 8'h01;    //   addi $2, $2, 1
MIPS.Instruction_memory.instruction[73]= 8'h00;     
MIPS.Instruction_memory.instruction[74]= 8'h42;     
MIPS.Instruction_memory.instruction[75]= 8'h20;     

MIPS.Instruction_memory.instruction[76]= 8'h01;   //   bne $6, $2, 1    
MIPS.Instruction_memory.instruction[77]= 8'h00;     
MIPS.Instruction_memory.instruction[78]= 8'hc2;     
MIPS.Instruction_memory.instruction[79]= 8'h14;     
*/
MIPS.Instruction_memory.instruction[24]= 8'h40;     //   j  40
MIPS.Instruction_memory.instruction[25]= 8'h00;     
MIPS.Instruction_memory.instruction[26]= 8'h00;     
MIPS.Instruction_memory.instruction[27]= 8'h08;     
/*
MIPS.Instruction_memory.instruction[84]= 8'h12;     //   j  11
MIPS.Instruction_memory.instruction[85]= 8'h00;     
MIPS.Instruction_memory.instruction[86]= 8'h00;     
MIPS.Instruction_memory.instruction[87]= 8'h08;     

*/






////////////////////////////////////////////
    
	#200000	$finish;
	end
	
initial begin
	$dumpfile("testMIPS.vcd");
	$dumpvars();
	end

always #10 clk=~clk;

endmodule

