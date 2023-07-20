module ALU(result, A, B, ALU_Ctrl, clk);
output reg[31:0]result;
input [31:0] A, B;
input [3:0] ALU_Ctrl;
input clk;

always@(posedge clk)			//3
case(ALU_Ctrl)
	4'b0000: result <= A & B; //AND
	4'b0001: result <= A | B; //OR
	4'b0010: result <= A + B; //add
	4'b0110: result <= A - B; //sub
	4'b0111: result <= A > B; //set-on-less-than
endcase

endmodule

module ALUControl(ALU_Ctrl, ALUop, func, clk);
output reg [3:0] ALU_Ctrl;
input [1:0] ALUop;
input [5:0] func;
input clk;
reg [1:0] ALUopR;
reg [5:0] funcR;

always@(posedge clk)			//1
begin
	ALUopR <= ALUop; funcR <= func;
end
always@(posedge clk)			//2
begin
	case(ALUopR)
		2'b0: ALU_Ctrl <= 4'b0010; //add
		2'b1: ALU_Ctrl <= 4'b0110; //sub
		2'b10: case(funcR)
				6'b100000: ALU_Ctrl <= 4'b0010; //add
				6'b100010: ALU_Ctrl <= 4'b0110; //sub
				6'b100100: ALU_Ctrl <= 4'b0000; //AND
				6'b100101: ALU_Ctrl <= 4'b0001; //OR
				6'b101010: ALU_Ctrl <= 4'b0111; //set-on-less-than
				default: begin 
						$display("func: 6'b%b is NOT working! Set ALU_Ctrl to 4'b0 automatically.",func);
						ALU_Ctrl <= 4'b0; //AND
			 		 end
		       endcase
		default: begin 
				$display("ALUop: 2'b%b is NOT working! Set ALU_Ctrl to 4'b0 automatically.",ALUop);
				ALU_Ctrl <= 4'b0; //AND 
			 end
	endcase
end

endmodule

module RF(A, B, rs1, rs2, rd, we, clk, result);
input we, clk;
input [4:0] rs1, rs2, rd;
input [31:0] result;
output reg [31:0] A, B;
reg [31:0] register[31:0];
reg [4:0] rs1R, rs2R, rd1, rd2, rd3;
reg we1, we2, we3;

integer i;				//initial register value
initial
for(i = 0; i < 32; i = i+1)
	register[i] <= 5*i + 5;

always@(posedge clk)	//1
begin
	rd1 <= rd; we1 <= we; rs1R <= rs1; rs2R <= rs2;
end
always@(posedge clk)	//2
begin
	rd2 <= rd1; we2 <= we1; A <= register[rs1R]; B <= register[rs2R];
end
always@(posedge clk)	//3
begin
	rd3 <= rd2; we3 <= we2;
end
always@(posedge clk)	//4
if(we3) register[rd3] <= result;

endmodule
