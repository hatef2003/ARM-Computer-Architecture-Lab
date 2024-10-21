module register(input clk, rst ,loaden ,input[31:0] pin , output [31:0]pout );
    reg [31:0] regVal;
    always @(posedge clk ,posedge rst)
    begin
        if(rst)
            regVal <= 32'd0;
        else if(loaden)
            regVal  <= pin;

    end
    assign pout = regVal;
endmodule
