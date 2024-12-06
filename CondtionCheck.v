module CondtionCheck(input[3:0] cond, input z, c, n, v, output reg flag);
    always@(*)
    begin
        flag <= 1'b0;
        case (cond)
            4'b0000: 
            begin
                flag <= z;
            end 
            4'b0001: 
            begin
                flag <= ~z;
            end 
            4'b0010: 
            begin
                flag <= c;
            end 
            4'b0011: 
            begin
                flag <= ~c;
            end 
            4'b0100: 
            begin
                flag <= n;
            end 
            4'b0101: 
            begin
                flag <= ~n;
            end 
            4'b0110: 
            begin
                flag <= v;
            end 
            4'b0111: 
            begin
                flag <= ~v;
            end 
            4'b1000: 
            begin
                flag <= (z & ~c);
            end 
            4'b1001: 
            begin
                flag <=(~c | z);
            end 
            4'b1010: 
            begin
                // if(n == v)
                flag <= (n == v);
            end 
            4'b1011: 
            begin
                // if(n!=v)
                flag <= (n!=v);
            end 
            4'b1100: 
            begin
                // if(~z &(n==v))
                flag <= (~z &(n==v));
            end 
            4'b1101: 
            begin
                // if(z | (n!=v))
                flag <= (z | (n!=v));
            end 
            4'b1110: 
            begin
                // if(z | (n!=v))
                flag <= (1'b1);
            end 
        endcase
    end
endmodule
