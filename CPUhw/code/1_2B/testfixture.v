module testfixture;

reg [3:0] A,B;
reg Cin;
wire [3:0] S;

adder4 A1(S,Cout,A,B,Cin);

integer i,j,k;

initial
	begin
  	for(i=0;i<2;i=i+1)
  		begin
     		Cin=i;
     		for(j=0;j<16;j=j+1)
     			begin
        		A=j;
        		for(k=0;k<16;k=k+1)
        		begin
           		B=k;
           		#10;  
        		end
     		end
  	end
 $stop;
end

initial
 $monitor($time, " A=%b B=%b  Cin=%b  S=%b Cout=%b", A, B, Cin, S, Cout);
initial 
	begin
		$dumpfile("simulation.dump");
		$dumpvars;
	end
endmodule
