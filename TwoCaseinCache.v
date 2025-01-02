// module TwoCaseinCache(  
//     input clk, rst, rd_en_in, wr_en_in, sram_ready_in,
//     input [31:0] adr_in, wdata_in, 
//     input [63:0] sram_read_data_in, 
//     output sram_wr_en_out, ready_out, sram_rd_en_out,
//     output [31:0] rdata_out
// );

// wire [2:0] offset;
// wire [5:0] index;
// wire [9:0] tag;

// assign offset = adr_in[2:0];
// assign index = adr_in[8:3];
// assign tag = adr_in[18:9];

// reg [31:0] way0_f[0:63];
// reg [31:0] way0_s[0:63];
// reg [31:0] way1_f[0:63];
// reg [31:0] way1_s[0:63];
// reg [9:0] way0_tag[0:63];
// reg [9:0] way1_tag[0:63];

// reg [63:0] index_lru;
// wire [31:0] data_way0, data_way1;
// wire [9:0] tag_way0, tag_way1;
// wire valid_way0, valid_way1;

// assign data_way0 = (offset[2] == 1'b0) ? way0_f[index] : way0_s[index];
// assign data_way1 = (offset[2] == 1'b0) ? way1_f[index] : way1_s[index];
// assign tag_way0 = way0_tag[index];
// assign tag_way1 = way1_tag[index];

// reg [63:0] way0_valid;
// reg [63:0] way1_valid;
// assign valid_way0 = way0_valid[index];
// assign valid_way1 = way1_valid[index];

// wire hit;
// wire hit_way0, hit_way1;

// assign hit_way0 = (tag_way0 == tag && valid_way0 == 1'b1);
// assign hit_way1 = (tag_way1 == tag && valid_way1 == 1'b1);
// assign hit = hit_way0 | hit_way1;

// wire [31:0] data;
// wire [31:0] read_data_q;

// assign data = hit_way0 ? data_way0 : hit_way1 ? data_way1 : 32'bz;

// assign read_data_q = hit ? data : sram_ready_in ? (offset[2] == 1'b0 ? sram_read_data_in[31:0] : sram_read_data_in[63:32]) : 32'bz;

// assign rdata_out = (rd_en_in == 1'b1) ? read_data_q : 32'bz;
// assign ready_out = sram_ready_in;

// assign sram_rd_en_out = ~hit & rd_en_in;
// assign sram_wr_en_out = wr_en_in;

// reg [31:0] read_cnt, hit_cnt;

// always @(posedge clk or posedge rst) 
// begin
//     if (rst) begin
//         way0_valid <= 64'd0;
//         way1_valid <= 64'd0;
//         index_lru <= 64'd0;
//         read_cnt <= 32'b0;
//         hit_cnt <= 32'b0;
//     end 
//     else begin//9
//         if (rd_en_in) begin//5
//             if (hit) begin //
//                 index_lru[index] <= hit_way1;
//                 hit_cnt <= hit_cnt + 1;
//                 read_cnt <= read_cnt + 1;
//             end //
//             else begin
//                 if (sram_ready_in) begin //1
//                     read_cnt <= read_cnt + 1;
//                     if (index_lru[index] == 1'b1) begin//2
//                         index_lru[index] <= 1'b0;
//                         {way0_s[index], way0_f[index]} <= sram_read_data_in;
//                         way0_valid[index] <= 1'b1;
//                         way0_tag[index] <= tag;
//                     end//2
//                     else begin//3
//                         index_lru[index] <= 1'b1;
//                         {way1_s[index], way1_f[index]} <= sram_read_data_in;
//                         way1_valid[index] <= 1'b1;
//                         way1_tag[index] <= tag;
//                     end//3
//                 end//1
//             end 
//         end//5
//         if (wr_en_in) begin//8
//             if (hit_way0) begin//6
//                 index_lru[index] <= 1'b0;
//                 if (offset[2] == 1'b0) 
//                     way0_f[index] <= wdata_in;
//                 else 
//                     way0_s[index] <= wdata_in;
//             end //6
//             else if (hit_way1) begin//7
//                 index_lru[index] <= 1'b1;
//                 if (offset[2] == 1'b0)
//                     way1_f[index] <= wdata_in;
//                 else
//                     way1_s[index] <= wdata_in;
//             end//7
//         end //8
//     end //9
// end

// endmodule


module CacheController(clk, rst, rdEnIn, wrEnIn, adrIn, wDataIn, 
                       rDataOut, readyOut, sramReadyIn, sramReadDataIn, 
                       sramWrEnOut, sramRdEnOut);

    input clk, rst, rdEnIn, wrEnIn, sramReadyIn;
    input [31:0] adrIn;
    input [31:0] wDataIn;
    input [63:0] sramReadDataIn;
    output sramWrEnOut, sramRdEnOut, readyOut;
    output [31:0] rDataOut;

    // ------------------ Address Decode ------------------
    wire [2:0] offset;
    wire [5:0] index;
    wire [9:0] tag;

    assign offset = adrIn[2:0];
    assign index = adrIn[8:3];
    assign tag = adrIn[18:9];
    // ----------------------------------------------------


    // ------------------ Way Decode ------------------
    reg [31:0] way0F      [0:63];
    reg [31:0] way0S      [0:63];
    reg [31:0] way1F      [0:63];
    reg [31:0] way1S      [0:63];
    reg [9:0]  way0Tag    [0:63];
    reg [9:0]  way1Tag    [0:63];
    
    reg [63:0] indexLRU;
    wire [31:0] dataWay0, dataWay1;
    wire [9:0] tagWay0, tagWay1;
    wire validWay0, validWay1;

    assign dataWay0  = (offset[2] == 1'b0) ? way0F[index] : way0S[index];
    assign dataWay1  = (offset[2] == 1'b0) ? way1F[index] : way1S[index];
    assign tagWay0   = way0Tag[index];
    assign tagWay1   = way1Tag[index];
    // ------------------------------------------------

    // ------------------ Valid Decode ----------------
    reg [63:0] way0Valid;
    reg [63:0] way1Valid;
    assign validWay0 = way0Valid[index];
    assign validWay1 = way1Valid[index];
    // ------------------------------------------------


    // ------------------ Hit Controller ------------------
    wire hit;
    wire hitWay0, hitWay1;

    assign hitWay0 = (tagWay0 == tag && validWay0 == 1'b1);
    assign hitWay1 = (tagWay1 == tag && validWay1 == 1'b1);
    assign hit = hitWay0 | hitWay1;
    // ----------------------------------------------------

    // ------------------ Data Controller ------------------
    wire [31:0] data;
    wire [31:0] readDataQ;

    assign data = hitWay0 ? dataWay0 :
                  hitWay1 ? dataWay1 : 32'bz;
    
    assign readDataQ = hit         ? data :
                       sramReadyIn ? (offset[2] == 1'b0 ? sramReadDataIn[31:0]   : 
                                                          sramReadDataIn[63:32]) : 32'bz;

    assign rDataOut = (rdEnIn == 1'b1) ? readDataQ : 32'bz;
    assign readyOut = sramReadyIn;
    // ----------------------------------------------------

    // ------------------ Sram Controller ------------------
    assign sramRdEnOut = ~hit & rdEnIn;
    assign sramWrEnOut = wrEnIn;
    // -----------------------------------------------------

    // --------------------- Hit Rate ----------------------
    reg[31:0] readCnt, hitCnt;    
    // -----------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            way0Valid <= 64'd0;
            way1Valid <= 64'd0;
            indexLRU  <= 64'd0;
            readCnt   <= 32'b0;
            hitCnt    <= 32'b0;
        end

        else begin
            if (rdEnIn) begin
                if (hit) begin
                    indexLRU[index] <= hitWay1;
                    hitCnt  <= hitCnt  + 1;
                    readCnt <= readCnt + 1;
                end
                else begin
                    if (sramReadyIn) begin
                        readCnt <= readCnt + 1;
                        if (indexLRU[index] == 1'b1) begin
                            indexLRU[index] <= 1'b0;
                            {way0S[index], way0F[index]} <= sramReadDataIn;
                            way0Valid[index] <= 1'b1;
                            way0Tag[index] <= tag;
                        end
                        else begin
                            indexLRU[index] <= 1'b1;
                            {way1S[index], way1F[index]} <= sramReadDataIn;
                            way1Valid[index] <= 1'b1;
                            way1Tag[index] <= tag;
                        end
                    end
                end
            end

            if (wrEnIn) begin
                if (hitWay0) begin
                    indexLRU[index] <= 1'b0;
                    if(offset[2] == 1'b0) way0F[index] <= wDataIn;
                    else way0S[index] <= wDataIn;
                end
                else if (hitWay1) begin
                    indexLRU[index] <= 1'b1;
                    if(offset[2] == 1'b0) way1F[index] <= wDataIn;
                    else way1S[index] <= wDataIn;
                end
            end
        end
    end

endmodule
