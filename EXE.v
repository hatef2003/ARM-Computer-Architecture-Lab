module EXE(input clk, rest, MEM_R_EN, MEM_W_EN, WB_EN,
            input[3:0] EXE_CMD,
            input [31:0] PC,
            input [31:0] val1, Rm, 
            input imm,
            input[11:0] shiftOperand, 
            input[23:0] signedIMM, 
            input aluCarryOut,
            input[1:0] sel_src1, sel_src2,
            input [31:0]wb_value,alu_res_mem,


            output memREnOut, memWEnOut, WEout,N,
            output[31:0] ALURes, valRmOut, branchAddress,
            output statusBits);

    wire[31:0]val2_gen_out;
    wire[31:0]mux1_out;
    wire[31:0]mux2_out;
    wire memCommand;

    assign memREnOut=MEM_R_EN;
    assign memWEnOut=MEM_W_EN;
    assign WEout = WB_EN;
    assign valRmOut=mux2_out;
    assign memCommand=MEM_R_EN|MEM_W_EN;

    // adder
    assign branchAddress=PC+{{6{signedIMM[23]}}, signedIMM, 2'b00};

    ALU alu(mux1_out, val2_gen_out, EXE_CMD, aluCarryOut, ALURes,N, statusBits);
    ValGenerator val2generator(mux2_out, imm, memCommand, shiftOperand, val2_gen_out);

    Mux3to1 MUX_1(sel_src1,val1,alu_res_mem, wb_value, mux1_out);
    Mux3to1 MUX_2(sel_src2,Rm,alu_res_mem, wb_value, mux2_out);
endmodule