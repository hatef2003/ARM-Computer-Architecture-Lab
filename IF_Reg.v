module IF_Reg(  input clk, rst, freeze, flush,
                input [31:0] pcIn, instructionIn,
                output [31:0] pc, Instruction);
    register PCReg(clk , rst , ~freeze , pcIn , pc);
    register INSReg(clk , rst , ~freeze ,  instructionIn , Instruction);

    
endmodule