module Branch_Jump_Detection(Branch, Jump, If_Id_Flush, PCSrc, data_1, data_2);

input	[31:0]	data_1, data_2;
input	[1:0]	Branch;
input		Jump;

output		If_Id_Flush;
output		PCSrc;

reg		If_Id_Flush;
reg		PCSrc;

always@(data_1 or data_2 or Branch or Jump)begin
	If_Id_Flush = 0;
	PCSrc = 0;
	if(Jump)begin
		//If_Id_Flush = 1;	
	end
	else if(Branch[0])begin	
		if(data_1 == data_2)begin 
			PCSrc = 1;
		//	If_Id_Flush = 1;			
		end
	end
	else if(Branch[1])begin
		if(data_1 != data_2)begin
			PCSrc=1;	
		//	If_Id_Flush = 1;			
		end	
	end

end
				
endmodule 









