module IF_TB()
    reg [31:0] branchAddress;
    reg branchTaken, hazard;
    wire [31:0] pc, inst;

    reg clk=0, rst=0;

    initial begin
        clk=~clk;
        #5;
    end

    IF instructionFetch(clk, rst, branchTaken, hazard, branchAddress, pc, inst);
    initial begin
        rst=1;
        branchAddress=32'd0;
        branchTaken=0;
        hazard=0;
        #10
        rst=0;
        #500;
    end

endmodule