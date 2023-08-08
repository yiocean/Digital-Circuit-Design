module t_Lab2_BCD_3digit_add_sub();
	
    reg [11:0] BCD_X;
    reg [11:0] BCD_Y;
    reg mode;
    wire [11:0] BCD_R;
    wire kout;
	
	Lab2_BCD_3digit_add_sub M1(BCD_X, BCD_Y, mode, BCD_R, kout);

	initial begin
		BCD_X[11:0]=12'b000000000000; BCD_Y[11:0]=12'b000000000000; mode=1'b0;
		#25 BCD_X[11:0]=12'b100110011001; BCD_Y[11:0]=12'b100110011001; mode=1'b0;
		#25 BCD_X[11:0]=12'b010101001000; BCD_Y[11:0]=12'b010001011001; mode=1'b0;
		#25 BCD_X[11:0]=12'b100110011001; BCD_Y[11:0]=12'b100110011001; mode=1'b1;
		#25 BCD_X[11:0]=12'b010101101001; BCD_Y[11:0]=12'b010101101000; mode=1'b1;
		#25 BCD_X[11:0]=12'b000100001000; BCD_Y[11:0]=12'b000001010001; mode=1'b1;
		#25 BCD_X[11:0]=12'b001110000111; BCD_Y[11:0]=12'b011000010110; mode=1'b1;
		#25 BCD_X[11:0]=12'b011101100101; BCD_Y[11:0]=12'b100101000011; mode=1'b1;
	end
	initial #200 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_BCD_3digit_add_sub.vcd");
		$dumpvars;
	end
endmodule