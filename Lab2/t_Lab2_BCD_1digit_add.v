module t_Lab2_BCD_1digit_add();
	
    reg [3:0] BCD_X;
    reg [3:0] BCD_Y;
    reg cin;
    wire [3:0] BCD_S1;
	wire [3:0] BCD_S2;
    wire cout1, cout2;
	
	Lab2_BCD_1digit_add_df M1(BCD_X, BCD_Y, cin, BCD_S1, cout1);
    Lab2_BCD_1digit_add_beh M2(BCD_X, BCD_Y, cin, BCD_S2, cout2);
	
	initial begin
		BCD_X[3:0]=4'b0000; BCD_Y[3:0]=4'b0000; cin=1'b1;
		#25 BCD_X[3:0]=4'b1001; BCD_Y[3:0]=4'b1001; cin=1'b1;
		#25 BCD_X[3:0]=4'b0011; BCD_Y[3:0]=4'b0111; cin=1'b0;
		#25 BCD_X[3:0]=4'b0101; BCD_Y[3:0]=4'b1000; cin=1'b0;
		#25 BCD_X[3:0]=4'b0011; BCD_Y[3:0]=4'b0110; cin=1'b1;
		#25 BCD_X[3:0]=4'b0110; BCD_Y[3:0]=4'b0001; cin=1'b1;
		#25 BCD_X[3:0]=4'b1001; BCD_Y[3:0]=4'b0110; cin=1'b0;
		#25 BCD_X[3:0]=4'b0101; BCD_Y[3:0]=4'b0011; cin=1'b0;
	end
	initial #200 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_BCD_1digit_add.vcd");
		$dumpvars;
	end
endmodule