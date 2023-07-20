module textfixture;
    reg   clk, rst;
    reg   [7:0] A,B,C,D;
    wire   [16:0] E;
    wire   [15:0] A_B, C_D;
    wire   [16:0] AB_CD;

mux4to1 U1(clk,rst,A,B,C,D,E,A_B,C_D,AB_CD);
always #5 clk=~clk;

initial begin
	clk = 1;
	rst = 1;
	A = 8'd0;
	B = 8'd0;
	C = 8'd0;
	D = 8'd0;
#10	rst = 0;
	A = 8'd10;
	B = 8'd10;
	C = 8'd20;
	D = 8'd20;
#10	rst = 0;
	A = 8'd5;
	B = 8'd10;
	C = 8'd15;
	D = 8'd20;
#10	rst = 0;
	A = 8'd2;
	B = 8'd4;
	C = 8'd6;
	D = 8'd8;
//#35	rst = 1;      
#40	$stop;
end
initial
$monitor($time," :A=%d B=%d C=%d D=%d A_B=%d C_D=%d AB_CD=%d E=%d",A,B,C,D,A_B,C_D,AB_CD,E);
endmodule






