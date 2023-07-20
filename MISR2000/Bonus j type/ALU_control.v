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



// I_type	ALUOp
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


// sel
parameter		AND	= 4'b0000;
parameter		OR	= 4'b0001;
parameter		ADD	= 4'b0010;
parameter		SUB	= 4'b0011;
parameter	  	SLT	= 4'b0100;
parameter		SLL	= 4'b0101;
parameter		SRL	= 4'b0110;
parameter		SRA	= 4'b0111;
parameter		NOP	= 4'b1111;




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
				default:	sel = NOP;	
			endcase
		addi:	sel = ADD;
		andi:        sel = AND;
		ori:	sel = OR;
		slti:	sel = SLT;
		beq:	sel = SUB;
		bne:	sel = SUB;
		lw:	sel = ADD;
		sw:	sel = ADD;
		lb:	sel = ADD;
		sb:	sel = ADD;

		default:	sel = NOP;	
	endcase

endmodule 











