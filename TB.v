module TB();
    reg clk =0, rst = 0;
    always #5 clk=~clk;
    reg forward_en = 1'b1;
    reg [2:0] divider;
    wire newCLK;
    always @(posedge clk , posedge rst)
    begin
    	if(rst)
    	begin
    		divider <= 0 ;
    	end
    	else 
    	begin 
    		divider<=divider+3'd1;
    	end
    end 
    assign newCLK = divider[0] & divider[1] & divider[0];
 IF_ID_EXE_MEM abbas(clk , rst , forward_en);

    initial 
    begin
      rst = 1;
      #10
      rst = 0;
      #100000
      $stop;
    end
endmodule