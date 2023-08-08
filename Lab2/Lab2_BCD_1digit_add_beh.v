module Lab2_BCD_1digit_add_beh(input [3:0] BCD_X, BCD_Y, input cin, output [3:0] BCD_S, output cout);

    reg [3:0] S_temp;
    reg c_temp;

    reg [4:1] C;
    reg [3:0] P;
    reg [3:0] G;
    reg [3:0] S, S1;
    reg cout1, cout3;
    reg [4:1] C1;
    reg [3:0] P1;
    reg [3:0] G1;

    always @(*) begin
        

        P[0] = BCD_X[0] ^ BCD_Y[0];
        P[1] = BCD_X[1] ^ BCD_Y[1];
        P[2] = BCD_X[2] ^ BCD_Y[2];
        P[3] = BCD_X[3] ^ BCD_Y[3];

        G[0] = BCD_X[0] & BCD_Y[0];
        G[1] = BCD_X[1] & BCD_Y[1];
        G[2] = BCD_X[2] & BCD_Y[2];
        G[3] = BCD_X[3] & BCD_Y[3];

        C[1] = G[0] | (cin & P[0]);
        C[2] = G[1] | (G[0] & P[1]) | (cin & P[0] & P[1]);
        C[3] = G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (cin & P[0] & P[1] & P[2]);
        C[4] = G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (cin & P[0] & P[1] & P[2] & P[3]);
        
        S[0] = cin ^ P[0];
        S[1] = C[1] ^ P[1];
        S[2] = C[2] ^ P[2];
        S[3] = C[3] ^ P[3];
        cout3 = ((S[2] & S[3]) | (S[3] & S[1]) | C[4]);
        
        //CLA2

        P1[0] = S[0] ^ 0;
        P1[1] = S[1] ^ cout;
        P1[2] = S[2] ^ cout;
        P1[3] = S[3] ^ 0;

        G1[0] = S[0] & 0;
        G1[1] = S[1] & cout;
        G1[2] = S[2] & cout;
        G1[3] = S[3] & 0;

        C1[1] = G1[0] | (0 & P1[0]);
        C1[2] = G1[1] | (G1[0] & P1[1]) | (0 & P1[0] & P1[1]);
        C1[3] = G1[2] | (G1[1] & P1[2]) | (G1[0] & P1[1] & P1[2]) | (0 & P1[0] & P1[1] & P1[2]);
        C1[4] = G1[3] | (G1[2] & P1[3]) | (G1[1] & P1[2] & P1[3]) | (G1[0] & P1[1] & P1[2] & P1[3]) | (0 & P1[0] & P1[1] & P1[2] & P1[3]);
        
        S1[0] = 0 ^ P1[0];
        S1[1] = C1[1] ^ P1[1];
        S1[2] = C1[2] ^ P1[2];
        S1[3] = C1[3] ^ P1[3];
    end

    assign BCD_S[0] = S1[0];
    assign BCD_S[1] = S1[1];
    assign BCD_S[2] = S1[2];
    assign BCD_S[3] = S1[3];
    assign cout = cout3;

endmodule
