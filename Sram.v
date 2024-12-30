module Sram(input clk, rst, Sram_WE,
            input[17:0] Sram_addr,
            inout[15:0] Sram_DQ);
    reg[15:0] mem [0:511];

    assign Sram_DQ = (Sram_WE == 1'b1) ? mem[Sram_addr]: 16'bz;

    always @(posedge clk)
        if (Sram_WE == 1'b0) 
            mem[Sram_addr] = Sram_DQ;
endmodule