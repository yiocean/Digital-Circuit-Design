module Lab3_Converter_state_diagram (input X, Clk, Rst, output Z);
    
    reg Z;
    reg[2:0] state, next_state;
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;
    
    always @(posedge Clk,negedge Rst)
        if(Rst==0) state<=S0;
        else state<=next_state;
    always @(state, X)
        case(state)
            S0: if(X) next_state=S1; else next_state=S4;
            S1: if(X) next_state=S2; else next_state=S5;
            S2: if(X) next_state=S3; else next_state=S3;
            S3: if(X) next_state=S0; else next_state=S0;
            S4: if(X) next_state=S5; else next_state=S5;
            S5: if(X) next_state=S3; else next_state=S6;
            S6: if(X) next_state=S0;
        endcase
    
    always@(state, X)
        case(state)
            S0,S1,S5,S6: Z=!X;
            S4,S2,S3: Z=X;
        endcase
endmodule