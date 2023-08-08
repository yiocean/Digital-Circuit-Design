module Lab1_dataflow(F, A, B, C, D);
    output F;
    input A, B, C, D;

    assign f1=(~(((~B) & A) | C));
    assign f2=(~(((A | C) & B) | (~D)));
    assign F=(f1 | f2);
    //assign F=((!((A && (!B)) || C)) || (!((A || C) && B) ||(!D)));
endmodule