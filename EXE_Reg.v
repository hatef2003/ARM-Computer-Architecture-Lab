module (input clk, rst,
        input WB_EN, MEM_R_EN, MEM_W_EN,
        input[31:0] ALURes, valRm,
        input[11:0] dest,


        output WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT,
        output[31:0] ALUResOut, valRmOut,
        output[11:0] dest);


    register #(1) Reg1(clk, rst, 1,  WB_EN, WB_EN_OUT);
    register #(1) Reg2(clk, rst, 1,  MEM_R_EN, MEM_R_EN_OUT);
    register #(1) Reg3(clk, rst, 1,  MEM_W_EN, MEM_W_EN_OUT);
    register #(32) Reg4(clk, rst, 1,  ALURes, ALUResOut);
    register #(32) Reg9(clk, rst, 1,  valRm, valRmOut);
    register #(4) Reg13(clk, rst, 1,  dest, destOut);

endmodule