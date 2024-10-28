module CondtionCheck(input[3:0] opcode, input z, c, n, v, output reg flag);
    always@(*)
    begin
        flag = 1'b0;
        case (opcode)
            4'd0000: 
            begin
                if (z) 
                    flag = 1'b1;
            end 
            4'd0001: 
            begin
                if(~z) 
                    flag = 1'b1;
            end 
            4'd0010: 
            begin
                if(c) 
                    flag = 1'b1;
            end 
            4'd0011: 
            begin
                if(~c) 
                    flag = 1'b1;
            end 
            4'd0100: 
            begin
                if(n) 
                    flag = 1'b1;
            end 
            4'd0101: 
            begin
                if(~n) 
                    flag = 1'b1;
            end 
            4'd0110: 
            begin
                if(v) 
                    flag = 1'b1;
            end 
            4'd0111: 
            begin
                if(~v)
                    flag = 1'b1;
            end 
            4'd1000: 
            begin
                if(z & ~c)
                    flag = 1'b1;
            end 
            4'd1001: 
            begin
                if(~c | z)
                    flag = 1'b1;
            end 
            4'd1010: 
            begin
                if(n == v)
                    flag = 1'b1;
            end 
            4'd1011: 
            begin
                if(n!=v)
                    flag = 1'b1;
            end 
            4'd1100: 
            begin
                if(~z &(n==v))
                    flag = 1'b1;
            end 
            4'd1101: 
            begin
                if(z | (n!=v))
                    flag = 1'b1;
            end 
          
        endcase
    end
endmodule
