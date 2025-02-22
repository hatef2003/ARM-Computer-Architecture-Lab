module ID(input clk, rst, C, V, Z, N, WBWriteEnable ,freeze,
            input [31:0] pc, instruction, WBValue,  
            input[3:0] WBDest , 
            output [31:0] Rn, Rm, 
            output imm ,COUT, ZOUT, VOUT, NOUT, 
            output[23:0] signedIMM , 
            output[11:0] valGeneratorIMM, // 
            output[8:0] controlsignals,
            output Two_src,
            output[3:0] src2_out);


wire condtionChechOut;
wire [3:0] src2 ; 
assign src2_out = src2;


wire [8:0] controlUnitOut;
assign Two_src = (controlUnitOut[2])||(~instruction[25]);
RegisterFile registerFile(clk, rst, instruction[19:16],src2,WBDest, WBValue, WBWriteEnable, Rn, Rm);
assign src2 = (controlUnitOut[2]==1'b0)? instruction[3:0] : instruction[15:12];
//module ControlUnit( input[3:0] OPCode,
                    // input[[1:0]] Mode, 
                    // input S,
                    // output [5:0] out);
ControlUnit controUnit(instruction[24:21], instruction[27:26], instruction[20],controlUnitOut);

CondtionCheck conditionCheck(instruction[31:28] , Z, C, N, V , condtionChechOut);
wire controlUnitCheck;
assign controlUnitCheck = (~condtionChechOut) | freeze;
assign controlsignals = (~controlUnitCheck)? controlUnitOut : 9'b0;
assign valGeneratorIMM = instruction[11:0];
assign signedIMM = instruction[23:0];
assign imm = instruction[25];
assign COUT = C;
assign VOUT = V;
assign ZOUT = Z;
assign NOUT = N;
endmodule