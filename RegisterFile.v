module RegisterFile(input clk, rst,
                    input[3:0] src1, src2, destWB,
                    input[31:0] resultWB,
                    input writeBackEn,
                    output reg [31:0] reg1, reg2);

    reg[14:0] registers[31:0];
    
    always @(negedge clk , posedge rst) 
    begin
        if (rst)
        begin 
            registers[0] = 31'b1;
            registers[1] = 31'b1;
            registers[2] = 31'b1;
            registers[3] = 31'b1;
            registers[4] = 31'b1;
            registers[5] = 31'b1;
            registers[6] = 31'b1;
            registers[7] = 31'b1;
            registers[8] = 31'b1;
            registers[9] = 31'b1;
            registers[10] = 31'b1;
            registers[11] = 31'b1;
            registers[12] = 31'b1;
            registers[13] = 31'b1;
            registers[14] = 31'b1;
            registers[15] = 31'b1;
        end
        registers[destWB]<=resultWB;
    end

    always@(src1 or src2)
    begin
        reg1<=registers[src1];
        reg2<=registers[src2];
    end
endmodule