module MUX2to1 (c,a,b,sel);

  output c;
  input a,b,sel;

  not 	g1(sel_, sel);
  and 	g2(a1, a, sel_);
  and 	g3(b1, b, sel);
  or  	g4(c, a1, b1);

endmodule
