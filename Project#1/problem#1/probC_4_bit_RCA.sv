module one_bit_full_adder(A, B, Cin, S, Cout);
  
  input A, B, Cin;
  output S,  Cout;
  
  wire wOut1;
  wire wIn1, wIn2, wIn3;
  
  xor U1(wOut1, A, B);
  xor U2(S, wOut1, Cin);
  
  and G1(wIn1, A, B);
  and G2(wIn2, B, Cin);
  and G3(wIn3, A, Cin);
  or  G4(Cout, wIn1, wIn2, wIn3);
  
endmodule

module four_bit_RCA(A, B, Cin, S, Cout);
  
  input [3:0] A, B;
  input Cin;
  wire [2:0] Cinter;
  output [3:0] S;
  output Cout;
  
  one_bit_full_adder FA0(A[0], B[0], Cin, S[0], Cinter[0]);
  one_bit_full_adder FA1(A[1], B[1], Cinter[0], S[1], Cinter[1]);
  one_bit_full_adder FA2(A[2], B[2], Cinter[1], S[2], Cinter[2]);
  one_bit_full_adder FA3(A[3], B[3], Cinter[2], S[3], Cout);
  
endmodule