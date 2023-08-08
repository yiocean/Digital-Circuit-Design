module Lab1_gatelevel(F, A, B, C, D);
    output F;
    input A, B, C, D;
    wire w1, w2, w3, w4, w5, w6, w7, w8;

    and G2(w2, A, w1), G6(w6, w5, B);
    not G1(w1, B), G4(w4, D);
    or G5(w5, A, C), G8(F, w3, w7);
    nor G3(w3, w2, C), G7(w7, w6, w4);
endmodule