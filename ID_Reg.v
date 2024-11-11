module ID_Reg(input clk, rest,
                input WB_EN, MEM_R_EN, MEM_W_EN, 
                input[3:0] EXE_CMD,
                input B, S,
                input [31:0] PC,
                input [31:0] valRn, valRm, 
                input imm,
                input[11:0] shiftOperand, 
                input[23:0] signedIMM, 
                input[3:0] dest,
                
                output WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT, 
                output[3:0] EXE_CMD_OUT,
                output B_OUT, S_OUT,
                output [31:0] PC_OUT,
                output [31:0] val1, valRmOut, 
                output immOut,
                output[11:0] shiftOperandOut, 
                output[23:0] signedIMMOut,
                output[3:0] destOut);

    register #(1) Reg1(clk, rst, 1,  WB_EN, WB_EN_OUT);
    register #(1) Reg2(clk, rst, 1,  MEM_R_EN, MEM_R_EN_OUT);
    register #(1) Reg3(clk, rst, 1,  MEM_W_EN, MEM_W_EN_OUT);
    register #(4) Reg4(clk, rst, 1,  EXE_CMD, EXE_CMD_OUT);
    register #(1) Reg5(clk, rst, 1,  B, B_OUT);
    register #(1) Reg6(clk, rst, 1,  S, S_OUT);
    register #(32) Reg7(clk, rst, 1,  PC, PC_OUT);
    register #(32) Reg8(clk, rst, 1,  valRn, val1);
    register #(32) Reg9(clk, rst, 1,  valRm, valRmOut);
    register #(1) Reg10(clk, rst, 1,  imm, immOut);
    register #(12) Reg11(clk, rst, 1,  shiftOperand, shiftOperandOut);
    register #(24) Reg12(clk, rst, 1,  signedIMM, signedIMMOut);
    register #(4) Reg13(clk, rst, 1,  dest, destOut);

endmodule