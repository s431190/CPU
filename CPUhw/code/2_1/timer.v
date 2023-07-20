module timer(output reg[3:0]hh, [5:0]mm, [5:0]ss, pm, 
	input reset, load, clk, [3:0]i_hh, [5:0]i_mm, [5:0]i_ss, i_pm);

always@(negedge clk or posedge reset or posedge load)
begin
	if(load)
	begin
		hh = i_hh; mm = i_mm; ss = i_ss; pm = i_pm;		
	end
	if(reset)
	begin
		hh = 0; mm = 0; ss = 0; pm = 0;
	end
	else
	begin
		pm = (hh==11 & mm==59 & ss==59) ? ~pm : pm;
		hh = (hh==11 & mm==59 & ss==59) ? 1 : ((mm==59 & ss==59) ? hh + 1 : hh);
		mm = (mm==59 & ss==59) ? 0 : (ss==59 ? mm + 1 : mm);
		ss = ss==59 ? 0 : ss + 1;
	end
end
endmodule
