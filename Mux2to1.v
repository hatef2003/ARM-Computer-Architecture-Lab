module Mux2to1( input select, 
                input[31:0] in0, 
                in1,
                output [31:0] out);
    assign out = (select==1'b1)?in1:in0;
endmodule