module register #(parameter WIDTH = 32) (
    input clk, 
    input rst, 
    input loaden, 
    input [WIDTH-1:0] pin, 
    output [WIDTH-1:0] pout
);
    reg [WIDTH-1:0] regVal;
    always @(posedge clk or posedge rst) begin
        if (rst) 
            regVal <= {WIDTH{1'b0}};
        else if (loaden)
            regVal <= pin;
    end
    assign pout = regVal;
endmodule
