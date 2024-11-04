module ID(input clk, rst, C, V, Z, N, WBWriteEnable input [31:0] pc, instruction, WBValue,  input[3:0] WBDest , output [31:0] Rn, Rm, output imm ,COUT, ZOUT, VOUT, NOUT, output[23:0] signedIMM , output[11:0] valGeneratorIMM, )
wire condtionChechOut;

RegisterFile registerFile(clk, rst, /*src1,src2*/,WBDest, WBValue, WBWriteEnable, Rn, Rm);

CondtionCheck conditionCheck(/*opcode*/ , Z, C, N, V , CondtionCheck)

endmodule