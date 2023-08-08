module Lab2_BCD_9c_beh(input [3:0] BCD, output [3:0] BCD_9c);

  reg [3:0] BCD_9c1;

  always @(*) begin
    BCD_9c1[0] = !BCD[0];
    BCD_9c1[1] = BCD[1];
    BCD_9c1[2] = BCD[1] ^ BCD[2];
    BCD_9c1[3] = (!BCD[0]) & (!BCD[1]) & (!BCD[3]);
  end

  assign BCD_9c[0] = BCD_9c1[0];
  assign BCD_9c[1] = BCD_9c1[1];
  assign BCD_9c[2] = BCD_9c1[2];
  assign BCD_9c[3] = BCD_9c1[3];

endmodule


