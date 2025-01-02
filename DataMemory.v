// module DataMemory( input clk , rst , MEM_W_EN, MEM_R_EN,
//                     input[31:0] ALU_Res, Val_Rm,
//                     output [31:0] out);

//     reg[31:0] mem[0:63];

//     wire[31:0] addr , temp;
//     assign temp = ALU_Res-32'd1024;
      
//     assign addr={2'b00 , temp[31:2]};

//     always@ (posedge clk, posedge rst)
//     begin

//       if (MEM_W_EN)
//       begin
//         mem[addr] <= Val_Rm;
//       end
//     end
//     assign out =(MEM_R_EN)? mem[addr] : 32'd0   ;
//     // always@(*) begin
//     //     if (MEM_W_EN==1'b1) begin
//     //         mem[addr]=Val_Rm;
//     //     end
//     //     if (MEM_R_EN==1'b1) begin
//     //       out=mem[addr];
//     //     end
//     // end
// endmodule

module DataMemory( input clk , rst , MEM_W_EN, MEM_R_EN,
                    input[31:0] ALU_Res, Val_Rm,
                    output [31:0] out,
                    output ready);
    wire [63:0] sram_data_out;
    wire [17:0] SRAM_ADDR;
    wire [15:0] SRAM_DQ;
    wire sram_ready , SramWriteEn, SramReadEn;
    TwoCaseinCache cache(clk, rst, MEM_R_EN,MEM_W_EN, sram_ready,ALU_Res,Val_Rm,sram_data_out,SramWriteEn,ready , SramReadEn,out);
        
    
    
    SramController sram_ctrl(clk, rst, SramWriteEn, SramReadEn,
                        ALU_Res, Val_Rm,
                        sram_data_out,
                        sram_ready,
                        SRAM_DQ,
                        SRAM_ADDR,
                        SRAM_WE_N,
                        SRAM_UB_N, SRAM_LB_N, SRAM_CE_N, SRAM_OE_N);


  Sram sram (clk, rst, SRAM_WE_N,
            SRAM_ADDR,
            SRAM_DQ);
endmodule