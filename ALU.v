module ALU(input[31:0] val1, val2, 
            input[3:0]cmd, 
            input carryIn,
            output [31:0] out,
            output reg N, 
            output carryOut);

    reg[32:0] extendedOut=33'd0;
    
    // TODO: check order 
    assign {carryOut, out}=extendedOut;

    always @(*)
    begin
        case(cmd)
        4'b0001:
        begin 
        extendedOut = val2;
        end
        4'b1001:
        begin 
        extendedOut = ~val2;
        end
        4'b0010:
        begin 
        extendedOut = val1 + val2; 
        if (val1[31]==val2[31] && extendedOut[32]!=val1[31])
            N=1 ;
        end
        4'b0011:
        begin 
        extendedOut = val1 + val2 + carryIn;
        if (val1[31]==val2[31] && extendedOut[32]!=val1[31])
            N=1 ;
        end
        4'b0100:
        begin 
        extendedOut = val1 - val2;
        if (val1[31]!=val2[31] && extendedOut[32]!=val1[31])
            N=1 ;
        end
        4'b0101:
        begin 
        extendedOut = val1 - val2 - ~carryIn;
        if (val1[31]!=val2[31] && extendedOut[32]!=val1[31])
            N=1 ;
        end
        4'b0110:
        begin 
        extendedOut = val1 & val2;
        end
        4'b0111:
        begin 
        extendedOut = val1 | val2;
        end
        4'b1000:
        begin 
        extendedOut = val1 ^ val2;
        end
        4'b0100:
        begin 
        extendedOut = val1 - val2;
        end
        4'b0110:
        begin 
        extendedOut = val1 & val2;
        end
        endcase
    end


endmodule