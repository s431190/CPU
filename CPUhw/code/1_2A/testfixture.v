module testfixture;

reg A,B,Cin;
FullAdder FA (S,Cout,A,B,Cin);

integer i,j,k;

initial
	begin
  	for(i=0;i<2;i=i+1)
  		begin
     		Cin=i;
     		for(j=0;j<2;j=j+1)
     			begin
        		A=j;
        		for(k=0;k<2;k=k+1)
        			begin
           			B=k;
           			#10;  
        			end     
			end
  		end
 	$stop;
	end

initial
 $monitor($time, " A = %b B = %b  Cin = %b  S = %b Cout = %b", A, B, Cin, S, Cout);

initial 
	begin
		$dumpfile("simulation.dump");
		$dumpvars;
	end
 endmodule
