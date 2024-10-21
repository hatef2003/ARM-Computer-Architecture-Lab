module ProgramCounter(input clk  , branchTaken,freeze ,input[31:0]branchAddress , output  instructionAddress);
    reg [31:0] counter ;
    always @(posedge clk)
    begin
      if(branchTaken)
        counter <= branchAddress;
      else
        counter <=counter + 31'd4;
    end
    assign instructionAddress = counter;
endmodule
