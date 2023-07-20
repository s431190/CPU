
module mooreDetector(z, x, rst ,clk);
input x, rst, clk;
output reg z;
localparam[2:0] reset =3'b000,got0=3'b001,got01=3'b010,
		got010=3'b011,got00=3'b100,got001=3'b101;
reg [2:0]  ps,ns;


always@(posedge clk,posedge rst)
begin
	if(rst) ps <= reset;
	else    ps <= ns;
end
always@(ps,x)
		case(ps)
			rst:begin
				if(x==0) ns <= got0;
				else     ns <= reset; z=0;end
			got0:begin
				if(x==0) ns <= got00;
				else     ns <= got01; z=0;end
			got01:begin
				if(x==0) ns <= got010;
				else     ns <= reset; z=0;end
			got010:begin
				if(x==0) ns <= got00;
				else     ns <= got01; z=1;end
			got00:begin
				if(x==0) ns <= got00;
				else     ns <= got001; z=0;end
  			got001:begin
				if(x==1) ns <= reset;
				else     ns <= got010; z=1;end
			default:
				ns <= reset;
		endcase

endmodule
