module Lab3_D_FF_gatelevel(input D, Clk, output Q, Qb);

    wire w1, w2;
    wire Q1, Qb1;

    not #(1) G1(w1, Clk);
    Lab3_D_Latch_gatelevel M1(D, w1, Q1, Qb1);
    not #(1) G2(w2, w1);
    Lab3_D_Latch_gatelevel M2(Q1, w2, Q, Qb);


endmodule