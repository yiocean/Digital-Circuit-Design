module Lab1_gatelevel_UDP(F, A, B, C, D);
    output F;
    input A, B, C, D;
    wire w1, w2, w3, w4, w5;

    Lab1_UDP M0(w4, A, w1, C), M1(w5, B, w3, w2);
    not G1(w1, B), G2(w2, D);
    or G3(w3, A, C), G4(F, w4, w5);    
endmodule