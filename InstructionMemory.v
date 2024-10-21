module InstructionMemory(   input [31:0] memAddr,
                            output reg [31:0] mem);
    
    always @(memAddr) begin
        case (memAddr)
            32'd0: mem=32'b000000_00001_00010_00000_00000000000;    //space is good
            32'd4: mem=32'b000000_00011_00100_00000_00000000000;    //space is good
            32'd8: mem=32'b000000_00101_00110_00000_00000000000;    //space is good
            32'd12: mem=32'b000000_00111_01000_00010_00000000000;    //space is good
            32'd16: mem=32'b000000_01001_01010_00011_00000000000;    //space is good
            32'd20: mem=32'b000000_01011_01100_00000_00000000000;    //space is good
            32'd24: mem=32'b000000_01101_01110_00000_00000000000;    //space is good
            default: mem=32'd0;
        endcase
    end

endmodule