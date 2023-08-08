module Lab2_4_bit_CLA_gate(input [3:0] A, B, input cin, output [3:0] S, output cout);

    wire [3:0] P, G, C, C1;

    xor #(4) xor1(P[0], A[0], B[0]);
    xor #(4) xor2(P[1], A[1], B[1]);
    xor #(4) xor3(P[2], A[2], B[2]);
    xor #(4) xor4(P[3], A[3], B[3]);

    and #(2) and1(P[0], A[0], B[0]);
    and #(2) and2(P[1], A[1], B[1]);
    and #(2) and3(P[2], A[2], B[2]);
    and #(2) and4(P[3], A[3], B[3]);

    and #(2) and5(G[0], A[0], B[0]);
    and #(2) and6(G[1], A[1], B[1]);
    and #(2) and7(G[2], A[2], B[2]);
    and #(2) and8(G[3], A[3], B[3]);

    and #(2) and9(C1[0], cin, P[0]);
    or #(2) or1(C[1], G[0], C1[0]);
    and #(2) and10(C1[1], C[1], P[0]);
    or #(2) or2(C[2], G[1], C1[1]);
    and #(2) and11(C1[2], C[2], P[1]);
    or #(2) or3(C[3], G[2], C1[2]);
    and #(2) and12(C1[3], C[3], P[2]);
    or #(2) or4(cout, G[3], C1[3]);

    xor #(4) xor5(S[0], cin, P[0]);
    xor #(4) xor6(S[1], C[1], P[1]);
    xor #(4) xor7(S[2], C[2], P[2]);
    xor #(4) xor8(S[3], C[3], P[3]);

    

endmodule
