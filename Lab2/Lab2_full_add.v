module Lab2_full_add (input a, b, cin, output sum, cout);
    wire sum1, cout1, cout2;
	Lab2_half_add FA1(a, b, sum1, cout1);
	Lab2_half_add FA2(sum1, cin, sum, cout2);
	or #(2) G1(cout, cout1, cout2);
endmodule