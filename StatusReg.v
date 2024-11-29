
module StatusReg(clk, rst, en, statIn, statOut);

    input [0:0] clk, rst, en;
    input [3:0] statIn;

    output reg[3:0] statOut;


    always@(negedge clk or posedge rst) begin
        if(rst) 
            statOut <= 4'b0;
        else if(en) 
            statOut <= statIn;
    end

endmodule