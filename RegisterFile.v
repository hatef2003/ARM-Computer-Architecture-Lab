module RegisterFile(input clk, rst,
                    input[3:0] src1, src2, destWB,
                    input[31:0] resultWB,
                    input writeBackEn,
                    output[31:0] reg1, reg2);

    reg[15:0] registers[31:0];
    
    always @(negedge clk , posedge rst) 
    begin
        if (rst)
        begin 
            register[0] = 31'b0;
            register[1] = 31'b0;
            register[2] = 31'b0;
            register[3] = 31'b0;
            register[4] = 31'b0;
            register[5] = 31'b0;
            register[6] = 31'b0;
            register[7] = 31'b0;
            register[8] = 31'b0;
            register[9] = 31'b0;
            register[10] = 31'b0;
            register[11] = 31'b0;
            register[12] = 31'b0;
            register[13] = 31'b0;
            register[14] = 31'b0;
            register[15] = 31'b0;
        end
        registers[destWB]<=resultWB;
    end

    always@(src1 or src2)
    begin
        reg1<=registers[src1];
        reg2<=registers[src2];
    end
endmodule