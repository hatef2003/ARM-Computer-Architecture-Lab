

module ControlUnit( input[3:0] OPCode,
                    input[[1:0]] Mode, 
                    input S,
                    output out);
//  S, B, EXE_CMD,
// MEM_W_EN, MEM_R_EN,
// WB_EN

    reg[3:0] EXE_CMD;
    
    begin
        case({Mode, S, OPCode})
            4'b1101: EXE_CMD=4'b0001;//MOV
            4'b1111: EXE_CMD=4'b1001;//MVN
            4'b0101: EXE_CMD=4'b0011;//ADC
            4'b0010: EXE_CMD=4'b0011;//SUB
            4'b0110: EXE_CMD=4'b0101;//SBC
            4'b0000: EXE_CMD=4'b0110;//AND
            4'b1100: EXE_CMD=4'b0111;//ORR
            4'b0001: EXE_CMD=4'b1000;//EOR
            4'b1010: EXE_CMD=4'b0100;//CMP
            4'b1000: EXE_CMD=4'b0110;//TST
            4'b0100:
            begin
                if (Mode==2'b00)
                    EXE_CMD=4'b0010;//ADD
                else if (Mode==2'b01) begin
                    case (S)
                        1'b0: EXE_CMD=4'b0010;//LDR
                        1'b1: EXE_CMD=4'b0010;//STR
                    endcase
                end else
                4'b: EXE_CMD=4'bxxxx;//B
            end
        endcase
    end

endmodule