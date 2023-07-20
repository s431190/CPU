module testfixture;
reg [1:0]in;
reg sel;

MUX2to1 mux (c, in[1], in[0], sel);

integer i, j;
// Apply Stimulus
initial
begin
	for(i=0; i<2; i=i+1)
		for(j=0; j<4; j=j+1)
		begin
			sel=i; in=j;
			#5;
		end
 	$stop;
end

initial
 $monitor($time, " a = %b b = %b sel = %b c = %b", in[1],in[0], sel, c);

initial 
	begin
		$dumpfile("simulation.dump");
		$dumpvars;
	end
 endmodule

