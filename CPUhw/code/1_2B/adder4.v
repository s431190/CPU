module adder4 (S,Cout,A,B,Cin);

output 	Cout;
output 	[3:0] S;
input 	[3:0] A,B;
input 	Cin;

FullAdder F1(S[0],Cout_1,A[0],B[0],Cin);
FullAdder F2(S[1],Cout_2,A[1],B[1],Cout_1);
FullAdder F3(S[2],Cout_3,A[2],B[2],Cout_2);
FullAdder F4(S[3],Cout,A[3],B[3],Cout_3);

endmodule
