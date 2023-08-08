module t_Lab3_D_FF_gatelevel();
	
    reg D;
    reg Clk;
    wire Q;
    wire Qb;

	Lab3_D_FF_gatelevel M1(D, Clk, Q, Qb);

    initial begin Clk=0; forever #5 Clk=~Clk; end

	initial begin
		D=1'b0; 
		#7 D=1'b1;
		#10 D=1'b0; 
		#20 D=1'b1; 
		#10 D=1'b0;
		#10 D=1'b1; 
		#20 D=1'b0;
		#4 D=1'b1;
	end
	initial #81 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab3_D_FF_gatelevel.vcd");
		$dumpvars;
	end
endmodule