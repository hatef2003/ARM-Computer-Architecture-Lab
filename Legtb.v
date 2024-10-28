module Legtb();

//module LEG   (input clk, rst , output[31:0] branchAddress,IFPC, instruction, IDPC, IDInstruction , EPC, EI , MEMPC,MEMI, WBPC,WBI);
reg clk =1'b0, rst= 1'b0;
wire [31:0] branchAddress,IFPC, instruction, IDPC, IDInstruction , EPC, EI , MEMPC,MEMI, WBPC,WBI;
LEG leg(clk,rst , branchAddress,IFPC, instruction, IDPC, IDInstruction , EPC, EI , MEMPC,MEMI, WBPC,WBI);
always #5 clk = ~clk;
initial 
begin
rst = 1;
#10
rst=0;
#10000
$stop;
end
endmodule
