module IF_ID_EXE(input clk , rst , branchTaken, freeze, flush ,WBWriteEnable ,
            input[31:0] branchAddress WBValue,  
            input[3:0] WBDest);




wire C,V,Z,N ;
wire [31:0] Rn, Rm ; 
wire imm ,COUT, ZOUT, VOUT, NOUT ;
wire[23:0] signedIMM  ;
wire[11:0] valGeneratorIMM  ;
wire[9:0] controlsignals 
wire [31:0] IF_PC , IF_instruction;
wire [31:0] PC_ID , instruction_ID;
IF intructionFetch(clk , rst ,branchTaken, freeze, branchAddress , IF_PC , IF_instruction);
// (  input clk, rst, freeze, flush,input [31:0] pcIn, instructionIn,output [31:0] pc, Instruction);
IF_Reg intructionFetchRegister(clk,rst , freeze , flush , IF_PC , IF_instruction , PC_ID , instruction_ID);
ID instructionDecode (clk, rst,C,V,Z,N, PC_ID, instruction_ID, WBValue , WBDest);

endmodule