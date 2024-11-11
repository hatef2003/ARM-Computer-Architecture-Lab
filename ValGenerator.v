module ValGenerator(input Rm[31:0], input imm, memCommand, input [11:0] shiftOprand , output reg [31:0] ALUVal2);
    integer i;
    wire [7:0] immed_8;
    wire[3:0] rotate_imm;
    assign immed_8 = shiftOprand[7:0];
    assign rotate_imm = shiftOprand[11:8];
        ALUVal2 = {{20{shiftOprand[11]}, shiftOprand}};
    always @(*)
    begin
    if (memCommand)
        ALUVal2 = 
    else
        if(imm)
        begin
           ALUVal2 = {24'b0, immed_8};
              for (i = 0; i < 2 * rotate_imm; i = i + 1) begin
                  ALUVal2 = {ALUVal2[0], ALUVal2[31:1]};
              end
        end
        else
        begin
            case (shiftOprand[6:5])
            2'b00:
            begin
                ALUVal2 = Rm << shiftOprand[11:7];
            end
            2'b01:
            begin
                ALUVal2 = Rm >>shiftOprand[11:7];
            end
            2'b10:
            begin
                 $signed(Rm) >>> shiftOprand[11:7];
            end
            2'b11:
            begin
                ALUVal2 = valRmIn;
                    for (i = 0; i < shiftOprand[11:7]; i = i + 1) begin
                        valOut = {valOut[0], valOut[31:1]};
            end
        end
    end
endmodule