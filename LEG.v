module LEG   (input clk, rst , output[31:0] branchAddress,IFPC, instruction, IDPC, IDInstruction , EPC, EI , MEMPC,MEMI, WBPC,WBI);
    wire branchTaken, freeze;
   
    IF instructionFetch( clk , rst, 1'b0,1'b0, 32'b0, IFPC, instruction);
    IF_Reg ifReg(clk, rst,1'b0, 1'b0, IFPC, instruction, IDPC, IDInstruction);
    IF_Reg idReg(clk, rst,1'b0, 1'b0, IDPC, IDInstruction, EPC, EI);
    IF_Reg eReg(clk, rst,1'b0, 1'b0, EPC, EI, MEMPC, MEMI);
    IF_Reg mReg(clk, rst,1'b0, 1'b0, MEMPC, MEMI, WBPC, WBI);
endmodule
