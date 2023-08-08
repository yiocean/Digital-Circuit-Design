module Lab2_BCD_1digit_add_df (input [3:0] BCD_X, BCD_Y, input cin, output [3:0] BCD_S, output cout);
  
  wire [4:1] C;
  wire [3:0] P;
  wire [3:0] G;
  wire [3:0] S;
  wire cout1;

  assign P[0] = BCD_X[0] ^ BCD_Y[0];
  assign P[1] = BCD_X[1] ^ BCD_Y[1];
  assign P[2] = BCD_X[2] ^ BCD_Y[2];
  assign P[3] = BCD_X[3] ^ BCD_Y[3];

  assign G[0] = BCD_X[0] & BCD_Y[0];
  assign G[1] = BCD_X[1] & BCD_Y[1];
  assign G[2] = BCD_X[2] & BCD_Y[2];
  assign G[3] = BCD_X[3] & BCD_Y[3];

  assign C[1] = G[0] | (cin & P[0]);
  assign C[2] = G[1] | (G[0] & P[1]) | (cin & P[0] & P[1]);
  assign C[3] = G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (cin & P[0] & P[1] & P[2]);
  assign C[4] = G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (cin & P[0] & P[1] & P[2] & P[3]);
  
  assign S[0] = cin ^ P[0];
  assign S[1] = C[1] ^ P[1];
  assign S[2] = C[2] ^ P[2];
  assign S[3] = C[3] ^ P[3];
  assign cout = ((S[2] & S[3]) | (S[3] & S[1]) | C[4]);
  
  //CLA2
  wire [4:1] C1;
  wire [3:0] P1;
  wire [3:0] G1;

  assign P1[0] = S[0] ^ 0;
  assign P1[1] = S[1] ^ cout;
  assign P1[2] = S[2] ^ cout;
  assign P1[3] = S[3] ^ 0;

  assign G1[0] = S[0] & 0;
  assign G1[1] = S[1] & cout;
  assign G1[2] = S[2] & cout;
  assign G1[3] = S[3] & 0;

  assign C1[1] = G1[0] | (0 & P1[0]);
  assign C1[2] = G1[1] | (G1[0] & P1[1]) | (0 & P1[0] & P1[1]);
  assign C1[3] = G1[2] | (G1[1] & P1[2]) | (G1[0] & P1[1] & P1[2]) | (0 & P1[0] & P1[1] & P1[2]);
  assign C1[4] = G1[3] | (G1[2] & P1[3]) | (G1[1] & P1[2] & P1[3]) | (G1[0] & P1[1] & P1[2] & P1[3]) | (0 & P1[0] & P1[1] & P1[2] & P1[3]);
  
  assign BCD_S[0] = 0 ^ P1[0];
  assign BCD_S[1] = C1[1] ^ P1[1];
  assign BCD_S[2] = C1[2] ^ P1[2];
  assign BCD_S[3] = C1[3] ^ P1[3];

endmodule
