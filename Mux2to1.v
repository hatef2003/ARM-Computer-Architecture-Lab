module Mux2to1( input select, 
                input[31:0] in0, 
                in1,
                output [31:0] out);
    assign out = (select==1'b1)?in1:in0;
endmodule

module Mux3to1( input[1:0] select, 
                input[31:0] in0, in1, in2,
                output [31:0] out);
    assign out = (select==2'b00)?in0:(select==2'b01) ? in1:in2;
endmodule