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