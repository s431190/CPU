module testfixture;

reg [3:0] in;
reg [1:0] sel;

MUX4to1 mux (c, in, sel);

integer i,j;

initial
	begin
  	for(i=0;i<4;i=i+1)
  		begin
     		sel=i;
     		for(j=0;j<16;j=j+1)
     			begin
        		in=j;
        		#10;  
     			end
  		end
 	$stop;
	end
initial
 	$monitor($time, " in[0] = %b in[1] = %b  in[2] = %b  in[3] = %b sel[0] = %b  sel[1] = %b c = %b",
 	in[0], in[1], in[2], in[3], sel[0], sel[1], c);

initial 
	begin
	$dumpfile("simulation.dump");
	$dumpvars;
	end
 endmodule
