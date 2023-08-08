module t_Lab3_Converter();
    wire Z,Z1;
    reg X,Clk,Rst;

    Lab3_Converter_state_diagram M0(X,Clk,Rst,Z);
    Lab3_Converter_structure M1(X,Clk,Rst,Z1);

    initial #395 $finish;

    initial
        begin
            Clk=0;
            forever #5 Clk=~Clk;
        end
    initial
        fork
            Rst=0;
            #2 Rst=1;
            
            //0011(0)
            X=1'b1;
            #10 X=1'b1;
            #20 X=1'b0;
            #30 X=1'b0;
            //0100(1)
            #40 X=1'b0;
            #50 X=1'b0;
            #60 X=1'b1;
            #70 X=1'b0;
            //0101(2)
            #80 X=1'b1;
            #90 X=1'b0;
            #100 X=1'b1;
            #110 X=1'b0;
            //0110(3)
            #120 X=1'b0;
            #130 X=1'b1;
            #140 X=1'b1;
            #150 X=1'b0;
            //0111(4)
            #160 X=1'b1;
            #170 X=1'b1;
            #180 X=1'b1;
            #190 X=1'b0;
            //1000(5)
            #200 X=1'b0;
            #210 X=1'b0;
            #220 X=1'b0;
            #230 X=1'b1;
            //1001(6)
            #240 X=1'b1;
            #250 X=1'b0;
            #260 X=1'b0;
            #270 X=1'b1;
            //1010(7)
            #280 X=1'b0;
            #290 X=1'b1;
            #300 X=1'b0;
            #310 X=1'b1;
            //1011(8)
            #320 X=1'b1;
            #330 X=1'b1;
            #340 X=1'b0;
            #350 X=1'b1;
            //1100(9)
            #360 X=1'b0;
            #370 X=1'b0;
            #380 X=1'b1;
            #390 X=1'b1;
        join
        initial begin
            $dumpfile("t_Lab3_Converter.vcd");
            $dumpvars;
        end
endmodule