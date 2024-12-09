module IF ( input clk , rst, branchTaken, freeze,
            input[31:0] branchAddress,
            output [31:0] PC, instruction);

    wire [31:0] PCIn, PCOut;

    Mux2to1 mux (branchTaken, PC, branchAddress, PCIn);
    
    register pc(clk , rst, (~freeze) | (branchTaken), PCIn, PCOut);
    ProgramCounter programCounter(PCOut, PC);    
    InstructionMemory instructionMem(PCOut, instruction);

endmodule
