module EXE(input clk, rest, MEM_R_EN, MEM_W_EN, WB_EN,
            input[3:0] EXE_CMD,
            input [31:0] PC,
            input [31:0] val1, Rm, 
            input imm,
            input[11:0] shiftOperand, 
            input[23:0] signedIMM, 
            input aluCarryOut,
            output memREnOut, memWEnOut, WEout,N,
            output[31:0] ALURes, valRmOut, branchAddress,
            output statusBits);

    wire[31:0]val2_gen_out;
    wire memCommand;

    assign memREnOut=MEM_R_EN;
    assign memWEnOut=MEM_W_EN;
    assign WEout = WB_EN;
    assign valRmOut=Rm;
    assign memCommand=MEM_R_EN|MEM_W_EN;

    // adder
    assign branchAddress=PC+{{6{signedIMM[23]}}, signedIMM, 2'b00};

    ALU alu(val1, val2_gen_out, EXE_CMD, aluCarryOut, ALURes,N, statusBits);
    ValGenerator val2generator(Rm, imm, memCommand, shiftOperand, val2_gen_out);

endmodule