
    module PPA16(A, B, Cin, S, Cout);

    input [15:0] A, B; 
    input Cin;
    output [15:0] S;
    output Cout;
   
    wire [15:0] P, G;
    assign P = A | B;  // Propagate
    assign G = A & B;  // Generate

    wire [15:0] P_k [3:0];
    wire [15:0] G_k [3:0];

    // k = 0: Initial propagate and generate
    assign P_k[0] = P;
    assign G_k[0] = G;

    genvar i;

    // k = 1
    assign P_k[1][0] = P_k[0][0];
    assign G_k[1][0] = G_k[0][0];
    generate
        for (i = 1; i < 16; i = i + 1) begin : k1
            assign P_k[1][i] = P_k[0][i] & P_k[0][i-1];
            assign G_k[1][i] = G_k[0][i] | (P_k[0][i] & G_k[0][i-1]);
        end
    endgenerate

    // ---- k = 2 ----
    assign P_k[2][1:0] = P_k[1][1:0];
    assign G_k[2][1:0] = G_k[1][1:0];
    generate
        for (i = 2; i < 16; i = i + 1) begin : k2
            assign P_k[2][i] = P_k[1][i] & P_k[1][i-2];
            assign G_k[2][i] = G_k[1][i] | (P_k[1][i] & G_k[1][i-2]);
        end
    endgenerate

    // k = 3
    assign P_k[3][3:0] = P_k[2][3:0];
    assign G_k[3][3:0] = G_k[2][3:0];
    generate
        for (i = 4; i < 16; i = i + 1) begin : k3
            assign P_k[3][i] = P_k[2][i] & P_k[2][i-4];
            assign G_k[3][i] = G_k[2][i] | (P_k[2][i] & G_k[2][i-4]);
        end
    endgenerate

    // final
    wire [15:0] P_final, G_final;
    assign P_final[7:0] = P_k[3][7:0];
    assign G_final[7:0] = G_k[3][7:0];
    generate
        for (i = 8; i < 16; i = i + 1) begin : k4
            assign P_final[i] = P_k[3][i] & P_k[3][i-8];
            assign G_final[i] = G_k[3][i] | (P_k[3][i] & G_k[3][i-8]);
        end
    endgenerate

   
    assign S = (A ^ B) ^ {G_final[14:0], Cin};  // Sum bits
    assign Cout = G_final[15];                 // Carry-out

endmodule