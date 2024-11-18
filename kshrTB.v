module kshrTB();
reg clk = 0 ,rst = 0 , branchTaken = 0, freeze = 0, flush = 0, WBWriteEnable = 0 ;
reg [31:0] branchAddress=31'd0 ,WBValue = 31'd0;
reg [3:0] WBDest = 3'd0;
IF_ID_EXE if_id_exe ( clk , rst , branchTaken, freeze, flush ,WBWriteEnable ,
            branchAddress ,WBValue,  
            WBDest);
 always #5 clk=~clk;

initial begin
    rst = 1;
    #10
    rst=0;
    #10000
    $stop;
end

endmodule