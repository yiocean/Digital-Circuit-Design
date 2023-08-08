module t_Lab2_4_bit_add();
	wire [3:0]S, S1, S2, S3;
	wire cout, cout1, cout2, cout3;
	reg [3:0]A, B;
	reg cin;
	
	//Lab2_4_bit_RCA M1(A, B, cin, S, cout);
	Lab2_4_bit_CLA_beh M2(A, B, cin, S1, cout1);
	Lab2_4_bit_CLA_df M3(A, B, cin, S2, cout2);
	Lab2_4_bit_CLA_gate M4(A, B, cin, S3, cout3);
	
	initial begin
		A[3:0]=4'b0000; B[3:0]=4'b0000; cin=1'b1;
		#25 A[3:0]=4'b1111; B[3:0]=4'b1111; cin=1'b1;
		#25 A[3:0]=4'b0011; B[3:0]=4'b0110; cin=1'b1;
		#25 A[3:0]=4'b0101; B[3:0]=4'b1001; cin=1'b0;
		#25 A[3:0]=4'b0111; B[3:0]=4'b1010; cin=1'b1;
		#25 A[3:0]=4'b1101; B[3:0]=4'b0010; cin=1'b0;
		#25 A[3:0]=4'b1111; B[3:0]=4'b0111; cin=1'b0;
		#25 A[3:0]=4'b1110; B[3:0]=4'b0101; cin=1'b1;
	end
	initial #200 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_4_bit_add.vcd");
		$dumpvars;
	end
endmodule