module EXE(input clk, rest, MEM_R_EN, MEM_W_EN, 
            input EXE_CMD, B, S,
            input [31:0] PC,
            input [31:0] val1, Rm, 
            input imm,
            input[11:0] shiftOperand, 
            input[23:0] signedIMM, 
            input aluCarryOut,
            output memREnOut, memWEnOut,
            output[31:0] ALURes, valRmOut, branchAddress);



endmodule