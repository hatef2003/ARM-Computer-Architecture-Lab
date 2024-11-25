module IF_ID_EXE(input clk , rst , branchTaken, freeze, flush ,WBWriteEnable ,
            input[31:0] branchAddress ,WBValue,  
            input[3:0] WBDest, output [31:0] ALURes );




wire C,V,Z,N ;
assign C = 1;
wire [31:0] Rn, Rm ; 
wire imm ,COUT, ZOUT, VOUT, NOUT ;
wire[23:0] signedIMM  ;
wire[11:0] valGeneratorIMM  ;
wire[8:0] controlsignals ;
wire [31:0] IF_PC , IF_instruction;
wire [31:0] PC_ID , instruction_ID;
IF intructionFetch(clk , rst ,branchTaken, freeze, branchAddress , IF_PC , IF_instruction);
// (  input clk, rst, freeze, flush,input [31:0] pcIn, instructionIn,output [31:0] pc, Instruction);
IF_Reg intructionFetchRegister(clk,rst , freeze , flush , IF_PC , IF_instruction , PC_ID , instruction_ID);
//

ID instructionDecode (clk, rst,C,V,Z,N, WBWriteEnable,PC_ID, instruction_ID, WBValue,
     WBDest, Rn, Rm , imm ,COUT, ZOUT, VOUT, NOUT,signedIMM, valGeneratorIMM , controlsignals );
wire [31:0] RnOut, RmOut ; 
wire[23:0] signedIMMOut  ;
wire[11:0] valGeneratorIMMOut  ;
wire[8:0] controlsignalsOut; 
wire [31:0] IF_PCOut , IF_instructionOut;
wire [31:0] PC_IDOut , instruction_IDOut;
wire immOut,CoutOut;
wire [3:0] WBDestOut;
//out={SOUT, B, EXE_CMD,MEM_WB_EN, MEM_R_EN,WB_EN};
ID_Reg id_reg(clk, rst, controlsignals[0], controlsignals[1],controlsignals[2],controlsignals[6:3],controlsignals[7],controlsignals[8] , PC_ID ,Rn,Rm,imm,valGeneratorIMM,signedIMM,instruction_ID[15:12],
         controlsignalsOut[0], controlsignalsOut[1],controlsignalsOut[2],controlsignalsOut[6:3],controlsignalsOut[7],controlsignalsOut[8] , PC_IDOut ,RnOut,RmOut,immOut,valGeneratorIMMOut,signedIMMOut,WBDestOut,freeze,COUT,CoutOut);   
wire memREnOut, memWEnOut, WEout;
wire[31:0] valRmOut, branchAddressEXE;
wire statusBits;
EXE exe(clk, rst,
        controlsignalsOut[1], controlsignalsOut[2], controlsignalsOut[0] , controlsignalsOut[6:3], PC_IDOut, RnOut, RmOut, immOut, valGeneratorIMMOut,signedIMMOut,CoutOut, memREnOut, memWEnOut , WEout ,ALURes, valRmOut, branchAddressEXE,statusBits);
// module EXE_Reg(input clk, rst,
//         input WB_EN, MEM_R_EN, MEM_W_EN,
//         input[31:0] ALURes, valRm,
//         input[3:0] dest,


//         output WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT,
//         output[31:0] ALUResOut, valRmOut,
//         output[3:0] dest);
wire WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT;
wire [31:0] ALUResOut, valRmOut;
wire [3:0] dest;
EXE_Reg exeReg (clk ,rst WEout , memREnOut , memWEnOut , ALU_Res , WBDestOut, WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT,
        ALUResOut , valRmOut , dest);
        wire [31:0] memOut;
DataMemory dataMemory (clk , rst ,MEM_W_EN_OUT , MEM_R_EN_OUT , ALUResOut,valRmOut, memOut);
endmodule