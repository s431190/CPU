module HazardDetectionUnit(Stall, If_Id_Write, PCWrite, Id_Ex_MemRead, Id_Ex_rt, If_Id_rt, If_Id_rs );

input 	[1:0]	Id_Ex_MemRead;
input	[4:0]	Id_Ex_rt;
input	[4:0]	If_Id_rt;
input	[4:0]	If_Id_rs;

output		Stall;
output		If_Id_Write;
output		PCWrite;

reg		Stall;
reg		If_Id_Write;
reg		PCWrite;


always@(Id_Ex_MemRead or Id_Ex_rt or If_Id_rt or If_Id_rs )begin
	PCWrite = 1;
	Stall = 0;
	If_Id_Write = 1;
	
	 if((Id_Ex_MemRead[1] || Id_Ex_MemRead[0]) && ((Id_Ex_rt == If_Id_rs)||(Id_Ex_rt == If_Id_rt)))begin
		PCWrite = 0;
		Stall = 1;
		If_Id_Write = 0;
	end
end
endmodule
