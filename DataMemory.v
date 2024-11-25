module DataMemory( input clk , rst , MEM_W_EN, MEM_R_EN,
                    input[31:0] ALU_Res, Val_Rm,
                    output [31:0] out);

    reg[31:0] mem[0:63];

    wire[31:0] addr;
    assign addr=(ALU_Res-1024)>>2;

    always@ (posedge clk, negedge rst)
    begin
      if (MEM_W_EN)
      begin
        mem[addr] = Val_Rm;
      end
    end
    assign out = mem[addr];
    // always@(*) begin
    //     if (MEM_W_EN==1'b1) begin
    //         mem[addr]=Val_Rm;
    //     end
    //     if (MEM_R_EN==1'b1) begin
    //       out=mem[addr];
    //     end
    // end
endmodule