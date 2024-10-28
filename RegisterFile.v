module RegisterFile(input clk, rst,
                    input[3:0] src1, src2, destWB,
                    input[31:0] resultWB,
                    input writeBackEn,
                    output[31:0] reg1, reg2);

    reg[3:0] mem[31:0];
    
    always @(negedge clk) 
    begin
        mem[destWB]<=resultWB;
    end

    always@(src1 or src2)
    begin
        reg1<=mem[src1];
        reg2<=mem[src2];
    end
    // WTF IS RESET
endmodule