module ID(input clk, rst, C, V, Z, N, WBWriteEnable input [31:0] pc, instruction, WBValue,  input[3:0] WBDest , output [31:0] Rn, Rm, output imm ,COUT, ZOUT, VOUT, NOUT, output[23:0] signedIMM , output[11:0] valGeneratorIMM, output[5:0] controlsignals);
wire condtionChechOut;
wire [5:0] controlUnitOut;
RegisterFile registerFile(clk, rst, /*src1,src2*/,WBDest, WBValue, WBWriteEnable, Rn, Rm);

CondtionCheck conditionCheck(/*opcode*/ , Z, C, N, V , condtionChechOut);
assign controlsignals = (condtionChechOut)? controlUnitOut : 6'b0;
endmodule