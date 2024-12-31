module TwoCaseinCache(  
    input clk, rst, rd_en_in, wr_en_in, sram_ready_in,
    input [31:0] adr_in, wdata_in, 
    input [63:0] sram_read_data_in, 
    output sram_wr_en_out, ready_out, sram_rd_en_out,
    output [31:0] rdata_out
);

wire [2:0] offset;
wire [5:0] index;
wire [9:0] tag;

assign offset = adr_in[2:0];
assign index = adr_in[8:3];
assign tag = adr_in[18:9];

reg [31:0] way0_f[0:63];
reg [31:0] way0_s[0:63];
reg [31:0] way1_f[0:63];
reg [31:0] way1_s[0:63];
reg [9:0] way0_tag[0:63];
reg [9:0] way1_tag[0:63];

reg [63:0] index_lru;
wire [31:0] data_way0, data_way1;
wire [9:0] tag_way0, tag_way1;
wire valid_way0, valid_way1;

assign data_way0 = (offset[2] == 1'b0) ? way0_f[index] : way0_s[index];
assign data_way1 = (offset[2] == 1'b0) ? way1_f[index] : way1_s[index];
assign tag_way0 = way0_tag[index];
assign tag_way1 = way1_tag[index];

reg [63:0] way0_valid;
reg [63:0] way1_valid;
assign valid_way0 = way0_valid[index];
assign valid_way1 = way1_valid[index];

wire hit;
wire hit_way0, hit_way1;

assign hit_way0 = (tag_way0 == tag && valid_way0 == 1'b1);
assign hit_way1 = (tag_way1 == tag && valid_way1 == 1'b1);
assign hit = hit_way0 | hit_way1;

wire [31:0] data;
wire [31:0] read_data_q;

assign data = hit_way0 ? data_way0 : hit_way1 ? data_way1 : 32'bz;

assign read_data_q = hit ? data : sram_ready_in ? (offset[2] == 1'b0 ? sram_read_data_in[31:0] : sram_read_data_in[63:32]) : 32'bz;

assign rdata_out = (rd_en_in == 1'b1) ? read_data_q : 32'bz;
assign ready_out = sram_ready_in;

assign sram_rd_en_out = ~hit & rd_en_in;
assign sram_wr_en_out = wr_en_in;

reg [31:0] read_cnt, hit_cnt;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        way0_valid <= 64'd0;
        way1_valid <= 64'd0;
        index_lru <= 64'd0;
        read_cnt <= 32'b0;
        hit_cnt <= 32'b0;
    end else begin
        if (rd_en_in) begin
            if (hit) begin
                index_lru[index] <= hit_way1;
                hit_cnt <= hit_cnt + 1;
                read_cnt <= read_cnt + 1;
            end else if (sram_ready_in) begin
                read_cnt <= read_cnt + 1;
                if (index_lru[index] == 1'b1) begin
                    index_lru[index] <= 1'b0;
                    {way0_s[index], way0_f[index]} <= sram_read_data_in;
                    way0_valid[index] <= 1'b1;
                    way0_tag[index] <= tag;
                end else begin
                    index_lru[index] <= 1'b1;
                    {way1_s[index], way1_f[index]} <= sram_read_data_in;
                    way1_valid[index] <= 1'b1;
                    way1_tag[index] <= tag;
                end
            end
        end

        if (wr_en_in) begin
            if (hit_way0)
                index_lru[index] <= 1'b0;
                if (offset[2] == 1'b0) way0_f[index] <= wdata_in;
                else way0_s[index] <= wdata_in;
            end else if (hit_way1)
                index_lru[index] <= 1'b1;
                if (offset[2] == 1'b0) way1_f[index] <= wdata_in;
                else way1_s[index] <= wdata_in;
            end
        end
    end
end

endmodule
