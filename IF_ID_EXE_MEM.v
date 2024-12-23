module IF_ID_EXE_MEM(input clk , rst);

wire [31:0] ALURes;

wire C,V,Z,N ;
wire Gen_C,Gen_V,Gen_Z,Gen_N;
wire [31:0] WB_Value;
wire [3:0] WB_Dest;
wire WB_WB_EN, Two_src; 
wire branchTaken, freeze, flush;
wire[31:0] branchAddress;
wire WB_EN_OUT, MEM_R_EN_OUT;   
wire[3:0] WBDest;
wire [31:0] Rn, Rm ; 
wire imm ,COUT, ZOUT, VOUT, NOUT ;
wire[23:0] signedIMM  ;
wire[11:0] valGeneratorIMM  ;
wire[8:0] controlsignals ;
wire [31:0] IF_PC , IF_instruction;
wire [31:0] PC_ID , instruction_ID;
wire[3:0] hazard_src2;
wire [3:0] dest;
wire [3:0] WBDestOut;
wire[8:0] controlsignalsOut;

assign branchTaken=controlsignalsOut[7];

wire[3:0] fu_src1, fu_src2;
wire [1:0] sel_src1, sel_src2;
wire [31:0] ALUResOut, valRmOut2;

wire [31:0] RnOut, RmOut ; 
wire[23:0] signedIMMOut  ;
wire[11:0] valGeneratorIMMOut  ;
wire [31:0] IF_PCOut, IF_instructionOut;
wire [31:0] PC_IDOut, instruction_IDOut;
wire immOut,CoutOut;

wire memREnOut, WEout;
wire[31:0] valRmOut;
wire statusBits;

assign Gen_Z = (ALURes==0)? 1 : 0;
assign Gen_N = (ALURes[31] == 1)? 1:0;
assign Gen_C = statusBits;
//  assign out={SOUT, B, EXE_CMD,MEM_WB_EN, MEM_R_EN,WB_EN}; DONOT DELETE THIS
wire [3:0] statOut;

assign C = statOut[3];
assign V = statOut[2];
assign Z = statOut[1];
assign N = statOut[0];
wire MEM_W_EN_OUT, memWEnOut;

wire [31:0] memOut;
wire MEMReg_MEM_R_EN_OUT; 
wire [31:0] MEMReg_ALUResOut; 
wire [31:0] MEMReg_DataMemoryOutput32Bit_Out; 

// modules
IF intructionFetch(     clk, rst, branchTaken, freeze, branchAddress, 
                        IF_PC , IF_instruction);

IF_Reg intructionFetchRegister( clk, rst, freeze, branchTaken, IF_PC, IF_instruction, 
                                PC_ID, instruction_ID);

ID instructionDecode (  clk, rst,C,V,Z,N, WB_WB_EN, freeze, PC_ID, instruction_ID, WB_Value, WBDest, 
                        Rn, Rm , imm ,COUT, ZOUT, VOUT, NOUT,signedIMM, valGeneratorIMM , controlsignals, Two_src, hazard_src2);


Hazard hazard(  WB_EN_OUT, controlsignalsOut[0], Two_src, dest, WBDestOut, instruction_ID[19:16], hazard_src2,
                freeze);

ID_Reg id_reg(clk, rst,branchTaken, controlsignals[0], controlsignals[1],controlsignals[2],controlsignals[6:3],controlsignals[7],controlsignals[8] , PC_ID ,Rn,Rm,imm,valGeneratorIMM,signedIMM,instruction_ID[15:12], instruction_ID[19:16], hazard_src2,
                controlsignalsOut[0], controlsignalsOut[1],controlsignalsOut[2],controlsignalsOut[6:3],controlsignalsOut[7],controlsignalsOut[8] , PC_IDOut ,RnOut,RmOut,immOut,valGeneratorIMMOut,signedIMMOut,WBDestOut,1'b0,COUT,CoutOut, fu_src1, fu_src2);   

EXE exe(clk, rst,
        controlsignalsOut[1], controlsignalsOut[2], controlsignalsOut[0] ,
        controlsignalsOut[6:3], PC_IDOut, RnOut, RmOut, immOut, valGeneratorIMMOut,
        signedIMMOut,CoutOut, sel_src1, sel_src2, WB_Value, ALUResOut, 
        
        memREnOut, memWEnOut , WEout, Gen_V,ALURes, valRmOut,
        branchAddress,statusBits);

StatusReg StReg(clk, rst,controlsignalsOut[8] ,{Gen_C , Gen_V, Gen_Z, Gen_N},
                statOut);

EXE_Reg exeReg (clk ,rst, 
        WEout , memREnOut , memWEnOut ,
        ALURes , valRmOut,
        WBDestOut, 

        WB_EN_OUT, MEM_R_EN_OUT, MEM_W_EN_OUT,
        ALUResOut , valRmOut2 , dest);

DataMemory dataMemory ( clk, rst, MEM_W_EN_OUT, MEM_R_EN_OUT, ALUResOut, valRmOut2, 
                        memOut);

MEM_Reg memReg( clk, rst, 1'b0, WB_EN_OUT, MEM_R_EN_OUT, ALUResOut, memOut, dest,
                WB_WB_EN, MEMReg_MEM_R_EN_OUT, MEMReg_ALUResOut, MEMReg_DataMemoryOutput32Bit_Out, WBDest);

Mux2to1 wbStage(MEMReg_MEM_R_EN_OUT, MEMReg_ALUResOut, MEMReg_DataMemoryOutput32Bit_Out, WB_Value);

// forwarding
ForwardingUnit fu(      fu_src1, fu_src2, dest, WBDest, WB_EN_OUT, WB_WB_EN,
                        sel_src1, sel_src2);

endmodule