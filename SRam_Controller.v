module SramController(input clk, rst, wr_en, rd_en,
                        input [31:0] ALU_Res, writeData,
                        output reg [31:0] readData,
                        output reg ready,
                        inout [15:0] SRAM_DQ,
                        output reg [17:0] SRAM_ADDR,
                        output reg SRAM_WE_N,
                        output SRAM_UB_N, SRAM_LB_N, SRAM_CE_N, SRAM_OE_N);

    wire[31:0]  temp;
    wire [17:0] addr , read_addr ;
    wire idel_ready;
    assign idel_ready = ~(wr_en | rd_en);
    assign temp = ALU_Res-32'd1024;
    assign addr={temp[18:2],1'b0};
    assign read_addr = {temp[18:3] ,2'b00 };
    reg [15:0] SRAM_DQ_Reg;
    assign SRAM_DQ= wr_en ?SRAM_DQ_Reg:16'bz;
    
    reg [2:0] ps, ns;

    always @(posedge clk , posedge rst)
    begin 
        if (rst)
            ps<= 3'd0;
        else
            ps<=ns;
    end
    always @(ps or wr_en or rd_en) begin
        case (ps)
            3'b000: ns = (wr_en == 1'b1 || rd_en == 1'b1) ? 3'b001 : 3'b000;
            3'b001: ns=3'b010;
            3'b010: ns=3'b011;
            3'b011: ns=3'b100;
            3'b100: ns=3'b101;
            3'b101: ns=3'b000;
        endcase
    end

   always @(ps, rd_en, wr_en)
begin
    ready = 1'b1;
    SRAM_WE_N = 1'b1;
    SRAM_DQ_Reg = 16'd0;
    SRAM_ADDR = 18'd0;
    case (ps)
    3'b000:
        ready = idel_ready;
    3'b001: 
    begin
        ready = 1'b0;
        SRAM_WE_N = ~wr_en;
        if (wr_en == 1'b1) begin
            SRAM_ADDR = addr;
            SRAM_DQ_Reg = writeData[15:0];
        end else begin
            SRAM_ADDR = addr;
        end
    end
    3'b010:
    begin
        SRAM_WE_N = ~wr_en;
        ready = 1'b0 ;
        if (wr_en == 1'b1) begin
            SRAM_ADDR = addr + 18'd1;
            SRAM_DQ_Reg = writeData[31:16];
        end else begin
            SRAM_ADDR = addr + 18'd1;
            readData[15:0] = SRAM_DQ;
        end
    end
    3'b011:
    begin
        SRAM_WE_N = 1'b1;
        ready = 1'b0;
        if (wr_en == 1'b0) begin
            readData[31:16] = SRAM_DQ;
        end
    end
    3'b100:begin
        SRAM_WE_N = 1'b1;
        ready = 1'b0;
    end
    3'b101: 
    begin 
        SRAM_WE_N = 1'b1;
        ready = 1'b1;
    end
    endcase
end


    assign {SRAM_UB_N, SRAM_LB_N, SRAM_CE_N, SRAM_OE_N} = 4'd0;

endmodule