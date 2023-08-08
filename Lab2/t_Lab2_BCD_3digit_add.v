module t_Lab2_BCD_3digit_add();
	
    reg [11:0] BCD_X;
    reg [11:0] BCD_Y;
    reg cin;
    wire [11:0] BCD_S;
    wire cout;
	
	Lab2_BCD_3digit_add M1(BCD_X, BCD_Y, cin, BCD_S, cout);
    
	initial begin
		BCD_X[11:0]=12'b000000000000; BCD_Y[11:0]=12'b000000000000; cin=1'b1;
		#25 BCD_X[11:0]=12'b100110011001; BCD_Y[11:0]=12'b100110011001; cin=1'b1;
		#25 BCD_X[11:0]=12'b011010000010; BCD_Y[11:0]=12'b100000110101; cin=1'b0;
		#25 BCD_X[11:0]=12'b010001010001; BCD_Y[11:0]=12'b000001101001; cin=1'b0;
		#25 BCD_X[11:0]=12'b001110000111; BCD_Y[11:0]=12'b011000010110; cin=1'b1;
		#25 BCD_X[11:0]=12'b011101100101; BCD_Y[11:0]=12'b100101000011; cin=1'b0;
		#25 BCD_X[11:0]=12'b010110000101; BCD_Y[11:0]=12'b010101010110; cin=1'b0;
		#25 BCD_X[11:0]=12'b100101001000; BCD_Y[11:0]=12'b000001010001; cin=1'b1;
	end
	initial #200 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_BCD_3digit_add.vcd");
		$dumpvars;
	end
endmodule