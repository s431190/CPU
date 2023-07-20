module FullAdder (S,Cout,A,B,Cin);
   output S,Cout;
   input A,B,Cin;

   xor 	g1(Xor_A_B,A,B);
   xor 	g2(S,Xor_A_B,Cin);
   and 	g3(And_AB_Cin,Xor_A_B,Cin);
   and 	g4(And_A_B,A,B);
   or  	g5(Cout,And_AB_Cin,And_A_B);

endmodule
