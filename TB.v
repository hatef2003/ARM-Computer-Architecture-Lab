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
    wire [15:0]SRAM_DQ;
    wire [17:0]SRAM_ADDR;
    wire SRAM_UB_N, SRAM_LB_N, SRAM_CE_N, SRAM_OE_N;
    wire SRAM_WE_N;
    assign newCLK = divider[0] & divider[1] & divider[0];
    IF_ID_EXE_MEM abbas(clk , rst , forward_en,SRAM_DQ, SRAM_ADDR,
                     SRAM_UB_N, SRAM_LB_N, SRAM_CE_N, SRAM_OE_N,
                    SRAM_WE_N);
     Sram sram (clk, rst, SRAM_WE_N,
             SRAM_ADDR,
             SRAM_DQ);
    initial 
    begin
      rst = 1;
      #10
      rst = 0;
     #100000
      $stop;
    end
endmodule