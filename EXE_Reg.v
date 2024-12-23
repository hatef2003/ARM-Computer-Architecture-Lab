module EXE_Reg(input clk, rst, freeze,
        input WB_EN, MEM_R_EN, MEM_W_EN,
        input[31:0] ALURes, valRm,
        input[3:0] dest,


        output WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT,
        output[31:0] ALUResOut, valRmOut,
        output[3:0] destOut);


    register #(1) Reg1(clk, rst, ~freeze,  WB_EN, WB_EN_OUT);
    register #(1) Reg2(clk, rst, ~freeze,  MEM_R_EN, MEM_R_EN_OUT);
    register #(1) Reg3(clk, rst, ~freeze,  MEM_W_EN, MEM_W_EN_OUT);
    register #(32) Reg4(clk, rst, ~freeze,  ALURes, ALUResOut);
    register #(32) Reg9(clk, rst, ~freeze,  valRm, valRmOut);
    register #(4) Reg13(clk, rst, ~freeze,  dest, destOut);

endmodule