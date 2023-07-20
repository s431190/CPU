module mealyDetector_testfixture;
reg x, rst, clk;
wire z;

mealyDetector U1(z, x, rst, clk);
always #10 clk = ~clk;


initial
begin
	clk = 1; 
	rst = 1; #5; rst = 0;
	x = 0; #20;
	x = 0; #20;
	x = 1; #20;
	x = 0; #20;
	x = 0; #20;
	x = 0; #20;
	x = 1; #20;
	x = 0; #20;
	x = 1; #20;
	x = 1; #20;
	x = 1; #20;

	#100 $stop;
end

initial
$monitor($time," rst=%b x=%b z=%b",rst,x,z);

endmodule
