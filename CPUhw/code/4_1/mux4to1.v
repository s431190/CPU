module mux4to1(
    input      clk, rst,
    input      [7:0] A,B,C,D,
    output     reg [16:0] E,
    output     reg [15:0] A_B, C_D,
    output     reg [16:0] AB_CD);

    always @(posedge clk or posedge rst) 
	begin
          		if (rst) 
	    	begin
              		A_B<= 1'b0;
              		C_D<= 1'b0;
            	end 
	  	else 
	    	begin
              		A_B<= A*B;
              		C_D<= C*D;
            	end
        	end
    always @(posedge clk or posedge rst) 
	begin
          		if (rst) 
	    		AB_CD<=1'b0;  	
		else 
	            	AB_CD<=A_B+C_D;
	end
    always @(posedge clk or posedge rst) 
	begin
          		if (rst) 
	    		E<=1'b0;  	
		else 
	            	E<=AB_CD;
	end

endmodule
