module Registers(Data_Out_1,Data_Out_2,Data_in,Read_Addr_1,
			Read_Addr_2,Write_Addr,Write_Enable,rst,clk);
input	[31:0]Data_in;
input	[4:0]Read_Addr_1,Read_Addr_2,Write_Addr;
input	Write_Enable,rst, clk;

output	[31:0]Data_Out_1;
output      [31:0]Data_Out_2;

reg	[31:0]Reg_File[31:0];	

assign Data_Out_1 = Reg_File[Read_Addr_1];
assign Data_Out_2 = Reg_File[Read_Addr_2];

	always@(negedge clk or posedge rst)begin
		if(rst)begin
			Reg_File[0]=32'd0;
			Reg_File[1]=32'd0;
			Reg_File[2]=32'd0;
			Reg_File[3]=32'd0;
			Reg_File[4]=32'd0;
			Reg_File[5]=32'd0;
			Reg_File[6]=32'd0;
			Reg_File[7]=32'd0;
			Reg_File[8]=32'd0;
			Reg_File[9]=32'd0;
			Reg_File[10]=32'd0;
			Reg_File[11]=32'd0;
			Reg_File[12]=32'd0;
			Reg_File[13]=32'd0;
			Reg_File[14]=32'd0;
			Reg_File[15]=32'd0;
			Reg_File[16]=32'd0;
			Reg_File[17]=32'd0;
			Reg_File[18]=32'd0;
			Reg_File[19]=32'd0;
			Reg_File[20]=32'd0;
			Reg_File[21]=32'd0;
			Reg_File[22]=32'd0;
			Reg_File[23]=32'd0;
			Reg_File[24]=32'd0;
			Reg_File[25]=32'd0;
			Reg_File[26]=32'd0;
			Reg_File[27]=32'd0;
			Reg_File[28]=32'd0;
			Reg_File[29]=32'd0;
			Reg_File[30]=32'd0;
			Reg_File[31]=32'd0;
		end
		if(Write_Enable) Reg_File[Write_Addr] <= Data_in;
	end

endmodule