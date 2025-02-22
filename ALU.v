module ALU(input[31:0] val1, val2, 
            input[3:0]cmd, 
            input carryIn,
            output [31:0] out,
            output reg N, 
            output carryOut);

    reg[32:0] extendedOut=33'd0;

    wire [31:0] carry_in_extended, not_carry_in_extended;
    assign carry_in_extended = {{(31){1'b0}}, carryIn};
    assign not_carry_in_extended = {{(31){1'b0}}, ~carryIn};
    // TODO: check order 
    assign {carryOut, out}=extendedOut;

    always @(*)
    begin
      N=1'd0;
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
        if (val1[31]==val2[31] && extendedOut[31]!=val1[31])
            N=1 ;
        end
        4'b0011:
        begin 
        extendedOut = val1 + val2 + carry_in_extended;
        if (val1[31]==val2[31] && extendedOut[31]!=val1[31])
            N=1 ;
        end
        4'b0100:
        begin 
        extendedOut = val1 - val2;
        if (val1[31]!=val2[31] && extendedOut[31]!=val1[31])
            N=1 ;
        end
        4'b0101:
        begin 
        extendedOut = val1 - val2 - not_carry_in_extended;
        if (val1[31]!=val2[31] && extendedOut[31]!=val1[31])
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
        4'b0110:
        begin 
        extendedOut = val1 & val2;
        end
        endcase
    end


endmodule