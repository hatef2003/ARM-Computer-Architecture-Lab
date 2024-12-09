module ID_Reg(input clk, rst, flush,
                input WB_EN, MEM_R_EN, MEM_W_EN, 
                input[3:0] EXE_CMD,
                input B, S,
                input [31:0] PC,
                input [31:0] valRn, valRm, 
                input imm,
                input[11:0] shiftOperand, 
                input[23:0] signedIMM, 
                input[3:0] dest,
                input[3:0] src1, src2,
                
                output WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT, 
                output[3:0] EXE_CMD_OUT,
                output B_OUT, S_OUT,
                output [31:0] PC_OUT,
                output [31:0] val1, valRmOut, 
                output immOut,
                output[11:0] shiftOperandOut, 
                output[23:0] signedIMMOut,
                output[3:0] destOut,
                input freeze,
                input C,
                output Cout,
                output[3:0] fu_src1, fu_src2);

    registerWithFlush #(1) Reg1(clk, rst,flush, ~freeze,  WB_EN, WB_EN_OUT);
    registerWithFlush #(1) Reg2(clk, rst,flush, ~freeze,  MEM_R_EN, MEM_R_EN_OUT);
    registerWithFlush #(1) Reg3(clk, rst,flush, ~freeze,  MEM_W_EN, MEM_W_EN_OUT);
    registerWithFlush #(4) Reg4(clk, rst,flush, ~freeze,  EXE_CMD, EXE_CMD_OUT);
    registerWithFlush #(1) Reg5(clk, rst,flush, ~freeze,  B, B_OUT);
    registerWithFlush #(1) Reg6(clk, rst,flush, ~freeze,  S, S_OUT);
    registerWithFlush #(32) Reg7(clk, rst,flush, ~freeze,  PC, PC_OUT);
    registerWithFlush #(32) Reg8(clk, rst,flush, ~freeze,  valRn, val1);
    registerWithFlush #(32) Reg9(clk, rst,flush, ~freeze,  valRm, valRmOut);
    registerWithFlush #(1) Reg10(clk, rst,flush, ~freeze,  imm, immOut);
    registerWithFlush #(12) Reg11(clk, rst,flush, ~freeze, shiftOperand, shiftOperandOut);
    registerWithFlush #(24) Reg12(clk, rst,flush, ~freeze,  signedIMM, signedIMMOut);
    registerWithFlush #(4) Reg13(clk, rst,flush, ~freeze,  dest, destOut);
    registerWithFlush #(1) Reg14(clk, rst,flush, ~freeze,  C, Cout);

    registerWithFlush #(4) Reg15(clk, rst,flush, ~freeze,  src1, fu_src1);
    registerWithFlush #(4) Reg16(clk, rst,flush, ~freeze,  src2, fu_src2);

endmodule