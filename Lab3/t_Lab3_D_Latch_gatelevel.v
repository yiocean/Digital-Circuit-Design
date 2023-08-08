module t_Lab3_D_Latch_gatelevel();
	
    reg D;
    reg E;
    wire Q;
    wire Qb;
	
	Lab3_D_Latch_gatelevel M1(D, E, Q, Qb);

	initial begin
		D=1'b0; E=1'b0;
		#5 D=1'b0; E=1'b1;
		#5 D=1'b0; E=1'b0;
		#5 D=1'b1; E=1'b0;
		#5 D=1'b1; E=1'b1;
		#5 D=1'b0; E=1'b0;
		#5 D=1'b0; E=1'b1;
		#5 D=1'b0; E=1'b0;
        #15 D=1'b1; E=1'b1;
        #1 D=1'b1; E=1'b0;
	end
	initial #60 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab3_D_Latch_gatelevel.vcd");
		$dumpvars;
	end
endmodule