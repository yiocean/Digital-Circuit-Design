module Lab2_4_bit_CLA_df(input [3:0] A, B, input cin, output [3:0] S, output cout);

  wire [4:1] C;
  wire [3:0] P;
  wire [3:0] G;

  assign P[0] = A[0] ^ B[0];
  assign P[1] = A[1] ^ B[1];
  assign P[2] = A[2] ^ B[2];
  assign P[3] = A[3] ^ B[3];

  assign G[0] = A[0] & B[0];
  assign G[1] = A[1] & B[1];
  assign G[2] = A[2] & B[2];
  assign G[3] = A[3] & B[3];

  assign C[1] = G[0] | (cin & P[0]);
  assign C[2] = G[1] | (G[0] & P[1]) | (cin & P[0] & P[1]);
  assign C[3] = G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (cin & P[0] & P[1] & P[2]);
  assign C[4] = G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (cin & P[0] & P[1] & P[2] & P[3]);
  
  assign S[0] = cin ^ P[0];
  assign S[1] = C[1] ^ P[1];
  assign S[2] = C[2] ^ P[2];
  assign S[3] = C[3] ^ P[3];
  assign cout = C[4];

endmodule
