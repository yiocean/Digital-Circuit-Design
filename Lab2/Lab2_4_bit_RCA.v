module Lab2_4_bit_RCA (input [3:0] A, B, input cin, output [3:0] S, output cout);
    wire B1, B2, B3;
	Lab2_full_add FA0 (A[0], B[0], cin, B1, S[0]);
	Lab2_full_add FA1 (A[1], B[1], B1, B2, S[1]);
	Lab2_full_add FA2 (A[2], B[2], B2, B3, S[2]);
	Lab2_full_add FA3 (A[3], B[3], B3, cout, S[3]);
endmodule