module ForwardingUnit(  input[31:0] src1, src2,
                        input[3:0] Dest, 
                        input WB_EN,
                        output reg sel_src1, sel_src2);
    always @(*)begin
        assign sel_src1=1'b0;
        assign sel_src2=1'b0;
    end
endmodule