module Lab2_half_add(input a, b, output sum, cout);
	xor #(4) G1(sum, a, b);
	and #(2) G2(cout, a, b);
endmodule