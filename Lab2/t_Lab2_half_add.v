module t_Lab2_half_add();
	wire sum, cout;
	reg a, b;
	
	//instantiate device under test
	Lab2_half_add M(a, b, sum, cout);
	
	//apply inputs one at a time
	initial	begin
		a=1'b0; b=1'b0;
		#25 a=1'b0; b=1'b1;
		#25 a=1'b1; b=1'b0;
		#25 a=1'b1; b=1'b1;
	end
	initial #100 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_half_add.vcd");
		$dumpvars;
	end
endmodule
	