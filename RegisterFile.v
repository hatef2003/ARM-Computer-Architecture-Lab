module RegisterFile(input clk, rst,
                    input[3:0] src1, src2, destWB,
                    input[31:0] resultWB,
                    input writeBackEn,
                    output reg [31:0] reg1, reg2);

    reg[31:0] registers[0:15];
    
    always @(negedge clk , posedge rst) 
    begin
        if (rst)
        begin 
            registers[0] = 32'b0;
            registers[1] = 32'b0;
            registers[2] = 32'b0;
            registers[3] = 32'b0;
            registers[4] = 32'b0;
            registers[5] = 32'b0;
            registers[6] = 32'b0;
            registers[7] = 32'b0;
            registers[8] = 32'b0;
            registers[9] = 32'b0;
            registers[10] = 32'b0;
            registers[11] = 32'b0;
            registers[12] = 32'b0;
            registers[13] = 32'b0;
            registers[14] = 32'b0;            
            registers[15] = 32'b0;            
        end
        else if (writeBackEn)
        begin
		  registers[destWB]<=resultWB;
		  end
    end
    always@(*)
    begin
        reg1=registers[src1];
        reg2=registers[src2];
    end
endmodule