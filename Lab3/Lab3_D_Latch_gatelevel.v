module Lab3_D_Latch_gatelevel (input D, E, output Q, Qb);
    wire A, B, N1;
    not #(1) G1(N1, D);
    and #(1) G2(A, N1, E);
    and #(1) G3(B, D, E);
    nor #(1) G4(Q, Qb, A);
    nor #(1) G5(Qb, Q, B);
endmodule