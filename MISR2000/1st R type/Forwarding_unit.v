module Forwarding_unti(ForwardA, ForwardB, ForwardC, Ex_Mem_RegWrite, Mem_Wb_RegWrite, Ex_Mem_rd, Mem_Wb_rd, Id_Ex_rs, Id_Ex_rt);
input 		Ex_Mem_RegWrite;
input 		Mem_Wb_RegWrite;
input	[4:0]	Ex_Mem_rd;
input	[4:0]	Mem_Wb_rd;
input	[4:0]	Id_Ex_rs;
input	[4:0]	Id_Ex_rt;

output	[1:0]	ForwardA;	//2'b10 => Ex_Mem_rd=rs   	;   2'b10 => Mem_Wb_rd=rs   	
output	[1:0]	ForwardB;	//2'b10 => Ex_Mem_rd=rt	;   2'b10 => Mem_Wb_rd=rt   	
output	[1:0]	ForwardC;

reg	[1:0]	ForwardA;	
reg	[1:0]	ForwardB;
reg	[1:0]	ForwardC;

always@(Ex_Mem_RegWrite or Mem_Wb_RegWrite or Ex_Mem_rd or Mem_Wb_rd or Id_Ex_rs or Id_Ex_rt)begin
	
	if(Ex_Mem_RegWrite && (Ex_Mem_rd!=0) &&(Ex_Mem_rd == Id_Ex_rs))begin
		ForwardA = 2'b10;
	end
	//else if(Mem_Wb_RegWrite && (Mem_Wb_rd != 0) &&(Ex_Mem_rd != Id_Ex_rs) && (Mem_Wb_rd == Id_Ex_rs))begin
	else if(Mem_Wb_RegWrite && (Mem_Wb_rd != 0) && (Mem_Wb_rd == Id_Ex_rs))begin

		ForwardA = 2'b01;
	end
	else	ForwardA = 2'b00;

//////////////////////////////////////////////	

	if(Ex_Mem_RegWrite && (Ex_Mem_rd!=0) &&(Ex_Mem_rd == Id_Ex_rt))begin
		ForwardB = 2'b10;
	end
	//else if(Mem_Wb_RegWrite && (Mem_Wb_rd != 0) &&(Ex_Mem_rd != Id_Ex_rt) && (Mem_Wb_rd == Id_Ex_rt))begin
	else if(Mem_Wb_RegWrite && (Mem_Wb_rd != 0) && (Mem_Wb_rd == Id_Ex_rt))begin

		ForwardB = 2'b01;
	end
	else	ForwardB = 2'b00;

//////////////////////////////////////////////

	if(Ex_Mem_RegWrite && (Ex_Mem_rd!=0) &&(Ex_Mem_rd == Id_Ex_rt))begin
		ForwardC = 2'b10;
	end
	else if(Mem_Wb_RegWrite && (Mem_Wb_rd != 0) && (Mem_Wb_rd == Id_Ex_rt))begin

		ForwardC = 2'b01;
	end
	else	ForwardC = 2'b00;



end

endmodule
