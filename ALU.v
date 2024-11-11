module ALU(input[31:0] val1, val2, 
            input[3:0]cmd, 
            input carryIn,
            output [31:0] out, 
            output carryOut);

    reg[32:0] extendedOut=33'd0;
    
    // TODO: check order 
    assign {carry, out}=extendedOut;

    always@(*)
    begin
        case(cmd)
        4'b0001 extendedOut = val2;
        4'b1001 extendedOut = ~val2;
        4'b0010 extendedOut = val1 + val2;
        4'b0011 extendedOut = val1 + val2 + carryIn;
        4'b0100 extendedOut = val1 - val2;
        4'b0101 extendedOut = val1 - val2 - ~carryIn;
        4'b0110 extendedOut = val1 & val2;
        4'b0111 extendedOut = val1 | val2;
        4'b1000 extendedOut = val1 ^ val2;
        4'b0100 extendedOut = val1 - val2;
        4'b0110 extendedOut = val1 & val2;
        4'b0010 extendedOut = val1 + val2;
        4'b0010 extendedOut = val1 + val2;
        endcase
    end


endmodule