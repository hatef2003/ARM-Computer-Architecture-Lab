module SramController(input clk, rst, wr_en, rd_en,
                        input [31:0] address, writeData,
                        output [31:0] readData,
                        output ready,
                        inout [15:0] SRAM_DQ,
                        output [17:0] SRAM_ADDR,
                        output SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N);
    // ready = 0
    // addr low, data low, sram_we=0
    // addr high, data high, read low
    // sram_we=1, read high
    //
    // ready=1
    wire[31:0] address_1024;
    assign address_1024 = address-32'd1024;

    reg [2:0] ps, ns;

    always @(posedge clk) ps<=ns;
    always @(posedge rst) ps<=3'd0;
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

    always @(*)
    begin
        case (ps)
        3'b000:
        3'b001:
        3'b010:
        3'b011:
        3'b100:
        3'b101: assign ready<=1'd1;
        endcase
    end

endmodule