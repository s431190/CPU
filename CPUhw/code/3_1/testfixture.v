module testfixture;
reg [1:0] ALUop;
reg [5:0] funct;
reg [31:0] input1,input2;
wire [3:0] ALUctrl;
wire [31:0] out;
wire Zero;

parameter
    	R_Add = 6'b100000,
	R_Sub = 6'b100010,
	R_And = 6'b100100,
	R_Or  = 6'b100101,
	R_Slt = 6'b101010;
	
ALU 	  U1(.out(out) ,.Zero(Zero),.ALUctrl(ALUctrl),.input1(input1),.input2(input2));
ALU_Ctrl  U2(.ALUop(ALUop),.funct(funct),.ALUctrl(ALUctrl));

integer i,j;

initial
	begin
  		for(i=0;i<4;i=i+1)
  		for(j=0;j<2;j=j+1)
  		begin
  			input1=i+5;
  			input2=i+10;
  			ALUop=0;
  			funct=0;#5;
  			ALUop=1;#5;
       			ALUop=2;#5;
			funct=R_Add;#5;
  			funct=R_And;#5;
  			funct=R_Or;#5;
  			funct=R_Slt;#5;
  			funct=R_Sub;#5;
  		end
 		$stop;
	end
initial
   $monitor($time, " input1 = %h input2= %h  ALUop = %h  funct = %h out = %h Zero = %b",
   input1, input2, ALUop, funct, out, Zero);
endmodule

