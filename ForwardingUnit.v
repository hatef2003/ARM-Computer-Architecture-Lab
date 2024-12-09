module ForwardingUnit(  input[3:0] src1, src2,
                        input[3:0] mem_Dest, wb_Dest,
                        input mem_WB_EN, wb_WB_EN,
                        output reg [1:0] sel_src1, sel_src2);
    always @(*)begin
        if (mem_WB_EN&&mem_Dest==src1) begin
            sel_src1=2'd1;
        end
        else if (wb_WB_EN&&wb_Dest==src1) begin
            sel_src1=2'd2;
        end
        else
            sel_src1=2'd0;

        if (mem_WB_EN&&mem_Dest==src2) begin
            sel_src2=2'd1;
        end
        else if (wb_WB_EN&&wb_Dest==src2) begin
            sel_src2=2'd2;
        end
        else
            sel_src2=2'd0;
    end
endmodule