module ALU_control(sel, Function, ALUOp);

output	[3:0]	sel;
input	[5:0]	Function;
input	[5:0]	ALUOp;
reg 	[3:0]	sel;

 // R_type 	Function 
parameter		add	= 6'b100000;
parameter		sub	= 6'b100010;
parameter		andd	= 6'b100100;
parameter		orr	= 6'b100101;
parameter		slt	= 6'b101010;
parameter		sll	= 6'b000000;
parameter		sra	= 6'b000011;
parameter		srl	= 6'b000010;
parameter		xorr 	= 6'b100110;//new
parameter		norr 	= 6'b100111;//new


// I_type	ALUOp
parameter		Rtype	= 6'b000000;
parameter		addi	= 6'b001000;
parameter		andi	= 6'b001100;
parameter		ori	= 6'b001101;
parameter		slti	= 6'b001010;
parameter		beq	= 6'b000100;
parameter		bne	= 6'b000101;
parameter		lh	= 6'b100001;//new2
parameter		sh	= 6'b101001;//new2
parameter		lw	= 6'b100010;
parameter		sw	= 6'b101010;
parameter		lb	= 6'b100000;
parameter		sb	= 6'b101000;
parameter		xori	= 6'b001110;//new2

// sel
parameter		AND	= 4'b0000;
parameter		OR	= 4'b0001;
parameter		ADD	= 4'b0010;
parameter		SUB	= 4'b0011;
parameter	 	SLT	= 4'b0100;
parameter		SLL	= 4'b0101;
parameter		SRL	= 4'b0110;
parameter		SRA	= 4'b0111;
parameter		NOP	= 4'b1111;
parameter		XOR	= 4'b1001;//new
parameter		NOR 	= 4'b1010;//new

/////////////////////////////////////////////////////////////////////////////////
				
always@(ALUOp or Function)
	case (ALUOp)
		Rtype:	case(Function)
				add:	sel = ADD;
				sub:	sel = SUB;
				andd:	sel = AND;
				orr:	sel = OR;
				slt:	sel = SLT;
				sll:	sel = SLL;
				sra: 	sel = SRA;
				srl:	sel = SRL;	
				xorr:	sel = XOR;//new
				norr:	sel = NOR;//new
				default:	sel = NOP;	
			endcase
		addi:	sel = ADD;
		andi:   sel = AND;
		ori:	sel = OR;
		slti:	sel = SLT;
		beq:	sel = SUB;
		bne:	sel = SUB;
		lh:	sel = ADD;//new2
		sh:	sel = ADD;//new2
		lw:	sel = ADD;
		sw:	sel = ADD;
		lb:	sel = ADD;
		sb:	sel = ADD;
		xori:	sel = XOR;//new2
		default:	sel = NOP;	
	endcase

endmodule 











