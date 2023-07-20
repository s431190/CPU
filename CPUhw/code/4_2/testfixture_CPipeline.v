module testfixture_CPipeline;
reg we, clk;
reg [4:0] rs1, rs2, rd;
reg [1:0] ALUop;
reg [5:0] func;
wire [31:0] result, A, B;
wire [3:0] ALU_Ctrl;

ALU U1(result, A, B, ALU_Ctrl, clk);
ALUControl U2(ALU_Ctrl, ALUop, func, clk);
RF U3(A, B, rs1, rs2, rd, we, clk, result);

always #5 clk = ~clk;

integer i;
initial
begin
	we <= 1; clk <= 1; ALUop <= 2'b10; func <= 6'b100000; #10//initial value: add
	for(i = 0; i < 32; i = i+1)	//register[i] = register[i] + register[i]
	begin
		rs1 <= i; rs2 <= i; rd <= i; #10;
	end
	#20 ALUop <= 2'b10; func <= 6'b100010; // sub
	for(i = 0; i < 32; i = i+1)	//register[i] = register[31] - register[i] when i is even
	begin
		rs1 <= 31; rs2 <= i; rd <= i; #10; we = i%2;
	end
	#40 $stop;
end
initial
$monitor($time," ALUop=%b func=%b ALU_Ctrl=%b rs1=%d rs2=%d A=%d B=%d result=%d rd=%b we=%b",ALUop, func, ALU_Ctrl, rs1, rs2, A, B, result, rd, we);

endmodule
