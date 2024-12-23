module DataMemory( input clk , rst , MEM_W_EN, MEM_R_EN,
                    input[31:0] ALU_Res, Val_Rm,
                    output [31:0] out);

    reg[31:0] mem[0:63];

    wire[31:0] addr , temp;
    assign temp = ALU_Res-32'd1024;
      
    assign addr={2'b00 , temp[31:2]};

    always@ (posedge clk)
    begin
      if(MEM_W_EN)
      begin
        mem[addr] <= Val_Rm;
      end
		else ;
    end
    assign out =(MEM_R_EN)? mem[addr] : 32'd0   ;
    // always@(*) begin
    //     if (MEM_W_EN==1'b1) begin
    //         mem[addr]=Val_Rm;
    //     end
    //     if (MEM_R_EN==1'b1) begin
    //       out=mem[addr];
    //     end
    // end
endmodule