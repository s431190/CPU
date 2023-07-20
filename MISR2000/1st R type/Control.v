module Control(Branch, Jump, WB, M, EX,  OPCode);


//OPCode
parameter		Rtype	= 6'b000000;
parameter		addi	= 6'b001000;
parameter		andi	= 6'b001100;
parameter		ori	= 6'b001101;
parameter		slti	= 6'b001010;
parameter		beq	= 6'b000100;
parameter		bne	= 6'b000101;
parameter		lw	= 6'b100011;
parameter		sw	= 6'b101011;
parameter		lb	= 6'b100000;
parameter		sb	= 6'b101000;
parameter		j	= 6'b000010;
parameter		WordWork = 2'b01;
parameter		ByteWork = 2'b10;


input 	[5:0]	OPCode;

output	[1:0]	Branch;
output		Jump;
output 	[1:0]	WB;
output 	[3:0]	M;
output 	[7:0]	EX;

reg 		RegDst, Jump, MemtoReg, ALUSrc, RegWrite;
reg 	[1:0]	MemRead, MemWrite;
reg 	[1:0]	Branch;
reg	[5:0]	ALUOp;

assign	WB = {MemtoReg, RegWrite}; 
assign	M = {MemRead, MemWrite};
assign	EX = {ALUSrc, ALUOp, RegDst};

always@(OPCode)begin

	RegDst = 0;
	Jump =0;
	Branch = 0;
	MemRead = 0;
	MemtoReg = 0;
	MemWrite = 0;
 	ALUSrc = 0;
	RegWrite	 = 0;
	ALUOp = 0;

	case(OPCode)
		Rtype : 	begin
				RegDst = 1;
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 0;
				RegWrite	 = 1;
				ALUOp = OPCode;

		 	end
		addi : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 1;
				RegWrite	 = 1;
				ALUOp = OPCode;
		 	end	
		andi : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 1;
				RegWrite	 = 1;
				ALUOp = OPCode;
		 	end	
		ori : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 1;
				RegWrite	 = 1;
				ALUOp = OPCode;
		 	end	
		slti : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 1;
				RegWrite	 = 1;
				ALUOp = OPCode;
		 	end	
		beq : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 2'b01;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 0;
				RegWrite	 = 0;
				ALUOp = OPCode;
		 	end	
		bne : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 2'b10;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 0;
				RegWrite	 = 0;
				ALUOp = OPCode;
		 	end	
		lw : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = WordWork ;
				MemtoReg = 1;
				MemWrite = 0;
 				ALUSrc = 1;
				RegWrite	 = 1;
				ALUOp = OPCode;
		 	end	
		sw : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = WordWork ;
 				ALUSrc = 1;
				RegWrite	 = 0;
				ALUOp = OPCode;
		 	end	
		lb : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = ByteWork ;
				MemtoReg = 1;
				MemWrite = 0;
 				ALUSrc = 1;
				RegWrite	 = 1;
				ALUOp = OPCode;
		 	end	
		sb : 	begin
				RegDst = 0;				
				Jump =0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = ByteWork ;
 				ALUSrc = 1;
				RegWrite	 = 0;
				ALUOp = OPCode;
		 	end	
		j: 	begin
				RegDst = 0;				
				Jump =1;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 0;
				RegWrite	 = 0;
				ALUOp = OPCode;
		 	end		

		default : 	begin
				RegDst = 0;
				Branch = 0;
				MemRead = 0;
				MemtoReg = 0;
				MemWrite = 0;
 				ALUSrc = 0;
				RegWrite	 = 0;
				ALUOp = OPCode;
		 	end
	endcase
end
endmodule
