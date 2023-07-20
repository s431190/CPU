module ALU_Ctrl(
  input [1:0] ALUop,
  input [5:0] funct,
  output reg [3:0] ALUctrl);

  parameter
    	lw  	= 2'b00,
	sw 	= 2'b00,
	beq	= 2'b01,
	R_Type 	= 2'b10;
	
  parameter
    	R_Add = 6'b100000,
	R_Sub = 6'b100010,
	R_And = 6'b100100,
	R_Or  = 6'b100101,
	R_Slt = 6'b101010;
  
  parameter
    	AND = 4'b0000,
	OR  = 4'b0001,
	ADD = 4'b0010,
	SUB = 4'b0110,
	SLT = 4'b0111,
	NOP = 4'b1111;
	
  always@(ALUop or funct) begin
  	case(ALUop)
    		lw:  ALUctrl = ADD;
		sw:  ALUctrl = ADD;
		beq: ALUctrl = SUB;
		R_Type: begin
	        	  case(funct)
			    R_Add: ALUctrl = ADD;
			    R_Sub: ALUctrl = SUB;
			    R_And: ALUctrl = AND;
			    R_Or:  ALUctrl = OR;
			    R_Slt: ALUctrl = SLT;
			  default: ALUctrl = NOP;
			  endcase
	        	end
    		default: ALUctrl = NOP;
  	endcase
  end
endmodule 

