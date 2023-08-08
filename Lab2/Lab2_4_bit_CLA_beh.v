module Lab2_4_bit_CLA_beh(input [3:0] A, B, input cin, output [3:0] S, output cout);

  reg [4:1] C;
  reg [3:0] P;
  reg [3:0] G;
  reg [3:0] S1;
  reg cout1;

  always @(*)
  begin

    P[0] = A[0] ^ B[0];
    P[1] = A[1] ^ B[1];
    P[2] = A[2] ^ B[2];
    P[3] = A[3] ^ B[3];

    G[0] = A[0] & B[0];
    G[1] = A[1] & B[1];
    G[2] = A[2] & B[2];
    G[3] = A[3] & B[3];

    C[1] = G[0] | (cin & P[0]);
    C[2] = G[1] | (G[0] & P[1]) | (cin & P[0] & P[1]);
    C[3] = G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (cin & P[0] & P[1] & P[2]);
    C[4] = G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (cin & P[0] & P[1] & P[2] & P[3]);
    
    S1[0] = cin ^ P[0];
    S1[1] = C[1] ^ P[1];
    S1[2] = C[2] ^ P[2];
    S1[3] = C[3] ^ P[3];
    cout1 = C[4];
  end

  assign S[0] = S1[0];
  assign S[1] = S1[1];
  assign S[2] = S1[2];
  assign S[3] = S1[3];
  assign cout = cout1;

endmodule
