module mealyDetector(z, x, rst ,clk);
output reg z;
input x, rst, clk;
localparam[1:0] reset =2'b00,got0=2'b01,
		got01 =2'b10,got00=2'b11;
reg [1:0]  ps,ns;


always@(posedge clk,posedge rst)
begin
	if(rst) ps <= reset;
	else    ps <= ns;
end
always@(ps,x)
		case(ps)
			rst:begin
				if(x==0) ns <= got0;
				else     ns <= reset; end
			got0:begin
				if(x==0) ns <= got00;
				else     ns <= got01; end
			got00:begin
				if(x==0) ns <= got00;
				else     ns <= got01; end
			got01:begin
				if(x==0) ns <= got0;
				else     ns <= rst; end
			default:
				ns <= reset;
		endcase

always@(ps,x)
		case(ps)
			rst:z=0;
			got0:z=0;
			got01: begin if(x==0) z=1;
				else z=0; end
			got00: begin if(x==0) z=0;
				else z=0; end
			default: z=0;
		endcase

endmodule
