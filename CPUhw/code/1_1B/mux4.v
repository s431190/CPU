module MUX4to1 (c,in,sel);
  output c;
  input [3:0] in;
  input [1:0] sel;

  MUX2to1 mux1 (c_1, in[0], in[1], sel[0]);
  MUX2to1 mux2 (c_2, in[2], in[3], sel[0]);
  MUX2to1 mux3 (c, c_1, c_2, sel[1]);

endmodule