module ALU(
	input [31:0] input1, input2,
  	input [3:0]  ALUctrl,
  	output Zero,
  output reg [31:0] out);

  parameter
    	AND = 4'b0000,
	OR  = 4'b0001,
	ADD = 4'b0010,
	SUB = 4'b0110,
	SLT = 4'b0111,
	NOP = 4'b1111;

assign Zero = (out==32'b0)?1'b1:1'b0;
	
always@(ALUctrl or input1 or input2)
 case (ALUctrl)
    	AND: out = input1 & input2;
	OR:  out = input1 | input2;
	ADD: out = input1 + input2;
	SUB: out = input1 - input2;
	SLT: out = (input1<input2)?32'b1:32'b0;
	NOP: out = 32'b0;
    default: out = 32'b0;
 endcase
endmodule 

