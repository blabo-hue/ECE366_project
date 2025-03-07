
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

module CLA (A, B, Cin, S, Cout);
  input [31:0] A, B;  
  input Cin;         
  output [31:0] S;   
  output Cout;        

    // Internal signals
    wire [7:0] P, G;    // Propagate and Generate signals for each block
    wire [8:0] C;       // Carry signals for each block

    // Initialize the first carry
    assign C[0] = Cin;

    // Block 0 (Bits 3:0)
    assign P[0] = A[3] | A[2] | A[1] | A[0];
    assign G[0] = (A[3] & B[3]) | (A[2] & B[2]) | (A[1] & B[1]) | (A[0] & B[0]);
    assign C[1] = G[0] | (P[0] & C[0]);
    four_bit_RCA rca0 (.A(A[3:0]), .B(B[3:0]), .Cin(C[0]), .S(S[3:0]), .Cout());

    // Block 1 (Bits 7:4)
    assign P[1] = A[7] | A[6] | A[5] | A[4];
    assign G[1] = (A[7] & B[7]) | (A[6] & B[6]) | (A[5] & B[5]) | (A[4] & B[4]);
    assign C[2] = G[1] | (P[1] & C[1]);
    four_bit_RCA rca1 (.A(A[7:4]), .B(B[7:4]), .Cin(C[1]), .S(S[7:4]), .Cout());

    // Block 2 (Bits 11:8)
    assign P[2] = A[11] | A[10] | A[9] | A[8];
    assign G[2] = (A[11] & B[11]) | (A[10] & B[10]) | (A[9] & B[9]) | (A[8] & B[8]);
    assign C[3] = G[2] | (P[2] & C[2]);
    four_bit_RCA rca2 (.A(A[11:8]), .B(B[11:8]), .Cin(C[2]), .S(S[11:8]), .Cout());

    // Block 3 (Bits 15:12)
    assign P[3] = A[15] | A[14] | A[13] | A[12];
    assign G[3] = (A[15] & B[15]) | (A[14] & B[14]) | (A[13] & B[13]) | (A[12] & B[12]);
    assign C[4] = G[3] | (P[3] & C[3]);
    four_bit_RCA rca3 (.A(A[15:12]), .B(B[15:12]), .Cin(C[3]), .S(S[15:12]), .Cout());

    // Block 4 (Bits 19:16)
    assign P[4] = A[19] | A[18] | A[17] | A[16];
    assign G[4] = (A[19] & B[19]) | (A[18] & B[18]) | (A[17] & B[17]) | (A[16] & B[16]);
    assign C[5] = G[4] | (P[4] & C[4]);
    four_bit_RCA rca4 (.A(A[19:16]), .B(B[19:16]), .Cin(C[4]), .S(S[19:16]), .Cout());

    // Block 5 (Bits 23:20)
    assign P[5] = A[23] | A[22] | A[21] | A[20];
    assign G[5] = (A[23] & B[23]) | (A[22] & B[22]) | (A[21] & B[21]) | (A[20] & B[20]);
    assign C[6] = G[5] | (P[5] & C[5]);
    four_bit_RCA rca5 (.A(A[23:20]), .B(B[23:20]), .Cin(C[5]), .S(S[23:20]), .Cout());

    // Block 6 (Bits 27:24)
    assign P[6] = A[27] | A[26] | A[25] | A[24];
    assign G[6] = (A[27] & B[27]) | (A[26] & B[26]) | (A[25] & B[25]) | (A[24] & B[24]);
    assign C[7] = G[6] | (P[6] & C[6]);
    four_bit_RCA rca6 (.A(A[27:24]), .B(B[27:24]), .Cin(C[6]), .S(S[27:24]), .Cout());

    // Block 7 (Bits 31:28)
    assign P[7] = A[31] | A[30] | A[29] | A[28];
    assign G[7] = (A[31] & B[31]) | (A[30] & B[30]) | (A[29] & B[29]) | (A[28] & B[28]);
    assign C[8] = G[7] | (P[7] & C[7]);
    four_bit_RCA rca7 (.A(A[31:28]), .B(B[31:28]), .Cin(C[7]), .S(S[31:28]), .Cout());

    // Final carry-out
    assign Cout = C[8];
endmodule