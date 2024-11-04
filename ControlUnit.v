

module ControlUnit( input[3:0] OPCode,
                    input[[1:0]] Mode, 
                    input S,
                    output out);
//  S, B, EXE_CMD,
// MEM_W_EN, MEM_R_EN,
// WB_EN

    reg[3:0] EXE_CMD;
    reg S, B, MEM_WB_EN, MEM_R_EN, WB_EN;

   always @(*)
    begin
        case(OPCode)
            4'b1101: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0001;//MOV
                 S=S;
                 B=0;
                 end
            4'b1111: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b1001;//MVN
                 S=S;
                 B=0;
                 end
            4'b0101: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0011;//ADC
                 S=S;
                 B=0;
                 end
            4'b0010: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0011;//SUB
                 S=S;
                 B=0;
                 end
            4'b0110: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0101;//SBC
                 S=S;
                 B=0;
                 end
            4'b0000: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0110;//AND
                 S=S;
                 B=0;
                 end
            4'b1100: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0111;//ORR
                 S=S;
                 B=0;
                 end
            4'b0001: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b1000;//EOR
                 S=S;
                 B=0;
                 end
            4'b1010: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0100;//CMP
                 S=1;
                 B=0;
                 end
            4'b1000: begin
                MEM_WB_EN=0;
                MEM_R_EN=0;
                WB_EN=1;
                 EXE_CMD=4'b0110;//TST
                 S=1;
                 B=0;
                 end
            4'b0100:
            begin
                if (Mode==2'b00) begin
                    MEM_WB_EN=0;
                    MEM_R_EN=0;
                    WB_EN=1;
                    EXE_CMD=4'b0010;//ADD
                    S=S;
                    B=0;
                    end
                else if (Mode==2'b01) begin
                    case (S)
                        1'b0: begin
                            MEM_WB_EN=0;
                            MEM_R_EN=1;
                            WB_EN=1; 
                            EXE_CMD=4'b0010;//LDR
                            S=1;
                            B=0;
                        end
                        1'b1: begin
                            MEM_WB_EN=1;
                            MEM_R_EN=0;
                            WB_EN=1; 
                            EXE_CMD=4'b0010;//STR
                            S=0;
                            B=0;
                        end
                    endcase
                end else begin
                    4'b: EXE_CMD=4'b0000;//B
                    S=0;
                    B=1;
                    MEM_WB_EN=0;
                    MEM_R_EN=0;
                    WB_EN=0;
                end
            end
            default:
            //hamec hi sabet
        endcase
    end

    assign out={S, B, EXE_CMD,MEM_W_EN, MEM_R_EN,WB_EN}

endmodule