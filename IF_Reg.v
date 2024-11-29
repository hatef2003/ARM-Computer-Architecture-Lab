module IF_Reg(  input clk, rst, freeze, flush,
                input [31:0] pcIn, instructionIn,
                output [31:0] pc, Instruction);
    registerWithFlush PCReg(clk , rst ,flush, ~freeze , pcIn , pc);
    registerWithFlush INSReg(clk , rst ,flush, ~freeze ,  instructionIn , Instruction);

    
endmodule