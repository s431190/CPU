module ALU(alu_out, data_1, data_2, sel, shamt);

parameter		AND	= 4'b0000;
parameter		OR	= 4'b0001;
parameter		ADD	= 4'b0010;
parameter		SUB	= 4'b0011;
parameter	  	SLT	= 4'b0100;
parameter		SLL	= 4'b0101;
parameter		SRL	= 4'b0110;
parameter		SRA	= 4'b0111;
parameter		NOP	= 4'b1111;
parameter		XOR	= 4'b1001;//new
parameter		NOR 	= 4'b1010;//new



output	[31:0]	alu_out;

input  	[4:0]	shamt;
input	[31:0]	data_1, data_2;
input	[3:0]	sel;

reg	[31:0]	alu_out;
reg	[4:0]	temp1;
/////////////////////////////////////////////////////////////////////////////////

				
always@(sel or data_1 or data_2 or shamt)
	case (sel)

		AND:	alu_out = data_1 & data_2;
		OR:	alu_out = data_1 | data_2;
		ADD:	alu_out = data_1 + data_2;
		SUB:	alu_out = data_1 - data_2;
	  	SLT:	if(data_1 < data_2)	alu_out = 1; 
			else 		alu_out = 0;
		SLL:	alu_out = data_2 << shamt;
		SRL:	alu_out = data_2 >> shamt;
		SRA:	if(data_2[31])	alu_out = {32'hffffffff,data_2}>>shamt;
			else 		alu_out = data_2>>shamt;
		NOP:	alu_out = 0;
		XOR:	alu_out = data_1 ^ data_2;//new
		NOR:	alu_out = ~(data_1 | data_2);//new
		default:	alu_out = 0;
	endcase

endmodule 









