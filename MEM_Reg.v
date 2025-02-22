module MEM_Reg( input clk, rst, freeze,
                input WB_EN, MEM_R_EN, 
                input [31:0] AluRes,
                input[31:0] DataMemoryOutput32Bit, 
                input[3:0] dest,

                output WB_EN_OUT, MEM_R_EN_OUT, 
                output [31:0] AluRes_OUT, 
                output[31:0] DataMemoryOutput32Bit_Out,
                output[3:0] destOut);

    register #(1) Reg1(clk, rst, ~freeze,  WB_EN, WB_EN_OUT);
    register #(1) Reg2(clk, rst, ~freeze,  MEM_R_EN, MEM_R_EN_OUT);
    register #(32) Reg3(clk, rst, ~freeze,  AluRes, AluRes_OUT);
    register #(32) DataMemoryOutput32BitReg(clk, rst, ~freeze,  DataMemoryOutput32Bit, DataMemoryOutput32Bit_Out);
    register #(4) Reg13(clk, rst, ~freeze,  dest, destOut);

endmodule