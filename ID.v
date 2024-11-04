module ID(input clk, rst, C, V, Z, N, WBWriteEnable ,
            input [31:0] pc, instruction, WBValue,  
            input[3:0] WBDest , 
            output [31:0] Rn, Rm, 
            output imm ,COUT, ZOUT, VOUT, NOUT, 
            output[23:0] signedIMM , 
            output[11:0] valGeneratorIMM, 
            output[9:0] controlsignals);
wire condtionChechOut;
wire [9:0] controlUnitOut;
RegisterFile registerFile(clk, rst, instruction[19:16],src2,WBDest, WBValue, WBWriteEnable, Rn, Rm);
wire[3:0] src2 ; 
assign srs2 = (controlUnitOut[2])? instruction[3:0] : instruction[15:12];
//module ControlUnit( input[3:0] OPCode,
                    // input[[1:0]] Mode, 
                    // input S,
                    // output [5:0] out);
ControlUnit controUnit(instruction[24:21], instruction[27:26], instruction[20],controlUnitOut);

CondtionCheck conditionCheck(/*opcode*/ , Z, C, N, V , condtionChechOut);
assign controlsignals = (condtionChechOut)? controlUnitOut : 10'b0;
endmodule