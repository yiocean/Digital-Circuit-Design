module Lab3_Converter_structure (input X, Clk, Rst, output Z);

    //reg Z;
    wire [2:0] state;
    wire [2:0] next_state;

    assign next_state[0] = (~state[2] & state[1] & ~state[0]) | (~state[2] & ~state[0] & X) | (~state[2] & ~state[1] & state[0] & ~X) | (state[2] & ~state[1] & ~state[0]) | (state[2] & ~state[1] & X);
    assign next_state[1] = (~state[2] & state[1] & ~state[0]) | (state[2] & ~state[1] & state[0]) | (~state[1] & state[0] & X);
    assign next_state[2] = (~state[1] & ~X) | (state[2] & ~state[1] & ~state[0]);
    assign Z = (~state[2] & ~state[1] & ~X) | (~state[2] & state[1] & X) | (~state[1] & state[0] & ~X) | (state[2] & ~state[1] & ~state[0] & X);
    //always@(negedge Clk)
        //Z = (~state[2] & ~state[1] & ~X) | (~state[2] & state[1] & X) | (~state[1] & state[0] & ~X) | (state[2] & ~state[1] & ~state[0] & X);

    D_FF_AR M0(next_state[0], Clk, Rst, state[0]);
    D_FF_AR M1(next_state[1], Clk, Rst, state[1]);
    D_FF_AR M2(next_state[2], Clk, Rst, state[2]);

endmodule