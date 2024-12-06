module Hazard(  input MEM_WB_EN, EXE_WB_EN, Two_src,
                input[3:0] MEM_Dest, EXE_Dest,
                input[3:0] Rn, Rm,
                output reg freeze);
// read after write
// assign freeze=1'b0;

always @(*) begin
    freeze <= 0;
    if (EXE_WB_EN && (EXE_Dest==Rn || (Two_src && (EXE_Dest==Rm) ) ) )
        freeze <= 1;
    if (MEM_WB_EN && (MEM_Dest==Rn || (Two_src && (MEM_Dest==Rm) ) ) )
        freeze <= 1;
end

endmodule