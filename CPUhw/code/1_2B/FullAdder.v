module FullAdder (S,Cout,A,B,Cin);
   output S,Cout;
   input A,B,Cin;

   xor (Xor_A_B,A,B);
   xor (S,Xor_A_B,Cin);
   and (And_AB_Cin,Xor_A_B,Cin);
   and (And_A_B,A,B);
   or  (Cout,And_AB_Cin,And_A_B);
endmodule
