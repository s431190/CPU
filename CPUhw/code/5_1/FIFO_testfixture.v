module FIFO_testfixture;

reg [7:0]Data_in;
reg rd, wr, clk, rst;
wire empty, full;
wire [3:0]count;
wire [7:0]Data_out;

FIFO fifo(Data_in, rd, wr, clk, rst ,empty, full, count, Data_out);

always #10 clk = ~clk;

initial
begin
	clk = 1; rst=1; #20;
	rst=0;
	Data_in=10; rd=0; wr=1;#20;
        Data_in=20; rd=0; wr=1;#20;
	Data_in=30; rd=0; wr=1;#20;
        Data_in=40; rd=0; wr=1;#20;
	rd=1; wr=0;

	#500 $stop;
end

initial
$monitor($time,"Data_in=%d, rd=%b, wr=%b, clk=%d, rst=%d ,empty=%b ,full=%b ,count=%d ,Data_out=%d",
	        Data_in, rd, wr, clk ,rst ,empty, full, count, Data_out);

endmodule
