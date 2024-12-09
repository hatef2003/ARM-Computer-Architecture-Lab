module TB();
    reg clk =0, rst = 0;
    always #5 clk=~clk;
    IF_ID_EXE idididid(clk , rst );
    initial 
    begin
      rst = 1;
      #10
      rst = 0;
      #10000
      $stop;
    end
endmodule