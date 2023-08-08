module t_Lab2_BCD_9c();
	wire [3:0]BCD_9c1;
    wire [3:0]BCD_9c2;
	reg [3:0]BCD;
	
	//instantiate device under test
	Lab2_BCD_9c_df M1(BCD, BCD_9c1);
    Lab2_BCD_9c_beh M2(BCD, BCD_9c2);
	
	//apply inputs one at a time
	initial begin
        BCD = 4'b0000;
        #10 BCD = 4'b0001;
        #10 BCD = 4'b0010;
        #10 BCD = 4'b0011;
        #10 BCD = 4'b0100;
        #10 BCD = 4'b0101;
        #10 BCD = 4'b0110;
        #10 BCD = 4'b0111;
        #10 BCD = 4'b1000;
        #10 BCD = 4'b1001;
        #10 BCD = 4'b1010;
        #10 BCD = 4'b1011;
        #10 BCD = 4'b1100;
        #10 BCD = 4'b1101;
        #10 BCD = 4'b1110;
        #10 BCD = 4'b1111;
        $finish;
    end
	initial #160 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("t_Lab2_BCD_9c.vcd");
		$dumpvars;
	end
endmodule