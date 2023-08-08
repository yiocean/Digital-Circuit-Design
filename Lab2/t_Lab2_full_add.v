module t_Lab2_full_add();
	wire sum, cout;
	reg a, b, cin;
	
	//instantiate device under test
	Lab2_full_add M(a, b, cin, sum, cout);
	
	//apply inputs one at a time
	initial	begin
		a=1'b0; b=1'b0; cin=1'b0;
		#20 a=1'b0; b=1'b0; cin=1'b1;
		#20 a=1'b0; b=1'b1; cin=1'b0;
		#20 a=1'b0; b=1'b1; cin=1'b1;
		#20 a=1'b1; b=1'b0; cin=1'b0;
		#20 a=1'b1; b=1'b0; cin=1'b1;
		#20 a=1'b1; b=1'b1; cin=1'b0;
		#20 a=1'b1; b=1'b1; cin=1'b1;
	end
	initial #160 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_full_add.vcd");
		$dumpvars;
	end
endmodule