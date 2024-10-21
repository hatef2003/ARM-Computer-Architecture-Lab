module IF_Reg(  input clk, rst, freeze, flush,
                input [31:0] pcIn, instructionIn,
                output reg [31:0] pc, Instruction);
    // module register(input clk, rst ,loaden ,input[31:0] pin , output [31:0]pout );
    register PCReg(clk , rst , ~freeze , (flush)? pcIn:32'd0 , pc);
    register INSReg(clk , rst , ~freeze , (flush)? instructionIn:32'd0 , Instruction);

    
endmodule