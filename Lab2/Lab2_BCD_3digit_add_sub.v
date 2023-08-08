module Lab2_BCD_3digit_add_sub (input [11:0] BCD_3X, BCD_3Y, input mode, output [11:0] BCD_3R, output kout);

    wire [11:0] new_Y, BCD_9c, BCD_3R_9c, BCD_3R_10c,BCD_3R_tmp;
    wire cout;
    wire notuse;
    Lab2_BCD_9c_beh M1(BCD_3Y[3:0],BCD_9c[3:0]);
    Lab2_BCD_9c_beh M2(BCD_3Y[7:4],BCD_9c[7:4]);
    Lab2_BCD_9c_beh M3(BCD_3Y[11:8],BCD_9c[11:8]);

    //Lab2_BCD_3digit_add B4(BCD_9c, 12'b000000000000, 1'b1, BCD_10c, trash);
    assign new_Y[0]=(mode & BCD_9c[0]) | (!mode & BCD_3Y[0]);
    assign new_Y[1]=(mode & BCD_9c[1]) | (!mode & BCD_3Y[1]);
    assign new_Y[2]=(mode & BCD_9c[2]) | (!mode & BCD_3Y[2]);
    assign new_Y[3]=(mode & BCD_9c[3]) | (!mode & BCD_3Y[3]);
    assign new_Y[4]=(mode & BCD_9c[4]) | (!mode & BCD_3Y[4]);
    assign new_Y[5]=(mode & BCD_9c[5]) | (!mode & BCD_3Y[5]);
    assign new_Y[6]=(mode & BCD_9c[6]) | (!mode & BCD_3Y[6]);
    assign new_Y[7]=(mode & BCD_9c[7]) | (!mode & BCD_3Y[7]);
    assign new_Y[8]=(mode & BCD_9c[8]) | (!mode & BCD_3Y[8]);
    assign new_Y[9]=(mode & BCD_9c[9]) | (!mode & BCD_3Y[9]);
    assign new_Y[10]=(mode & BCD_9c[10]) | (!mode & BCD_3Y[10]);
    assign new_Y[11]=(mode & BCD_9c[11]) | (!mode & BCD_3Y[11]);
    
    Lab2_BCD_3digit_add Ad1(BCD_3X,new_Y,mode,BCD_3R_tmp,cout);
    
    Lab2_BCD_9c_beh M4(BCD_3R_tmp[3:0],BCD_3R_9c[3:0]);
    Lab2_BCD_9c_beh M5(BCD_3R_tmp[7:4],BCD_3R_9c[7:4]);
    Lab2_BCD_9c_beh M6(BCD_3R_tmp[11:8],BCD_3R_9c[11:8]);
    Lab2_BCD_3digit_add Ad2(BCD_3R_9c, 12'b000000000000, 1'b1, BCD_3R_10c, notuse);
    
    assign kout=mode?(cout?((BCD_3R[0] | BCD_3R[1] | BCD_3R[2] | BCD_3R[3] | BCD_3R[4] | BCD_3R[5] | BCD_3R[6] | BCD_3R[7] | BCD_3R[8] | BCD_3R[9] | BCD_3R[10] | BCD_3R[11])?0:1):1):cout;
    assign BCD_3R[0]=mode?(cout?BCD_3R_tmp[0]:BCD_3R_10c[0]):BCD_3R_tmp[0];
    assign BCD_3R[1]=mode?(cout?BCD_3R_tmp[1]:BCD_3R_10c[1]):BCD_3R_tmp[1];
    assign BCD_3R[2]=mode?(cout?BCD_3R_tmp[2]:BCD_3R_10c[2]):BCD_3R_tmp[2];
    assign BCD_3R[3]=mode?(cout?BCD_3R_tmp[3]:BCD_3R_10c[3]):BCD_3R_tmp[3];
    assign BCD_3R[4]=mode?(cout?BCD_3R_tmp[4]:BCD_3R_10c[4]):BCD_3R_tmp[4];
    assign BCD_3R[5]=mode?(cout?BCD_3R_tmp[5]:BCD_3R_10c[5]):BCD_3R_tmp[5];
    assign BCD_3R[6]=mode?(cout?BCD_3R_tmp[6]:BCD_3R_10c[6]):BCD_3R_tmp[6];
    assign BCD_3R[7]=mode?(cout?BCD_3R_tmp[7]:BCD_3R_10c[7]):BCD_3R_tmp[7];
    assign BCD_3R[8]=mode?(cout?BCD_3R_tmp[8]:BCD_3R_10c[8]):BCD_3R_tmp[8];
    assign BCD_3R[9]=mode?(cout?BCD_3R_tmp[9]:BCD_3R_10c[9]):BCD_3R_tmp[9];
    assign BCD_3R[10]=mode?(cout?BCD_3R_tmp[10]:BCD_3R_10c[10]):BCD_3R_tmp[10];
    assign BCD_3R[11]=mode?(cout?BCD_3R_tmp[11]:BCD_3R_10c[11]):BCD_3R_tmp[11];
endmodule