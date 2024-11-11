module TB();
    reg [31:0] branchAddress;
    reg branchTaken, hazard;
    wire [31:0] pc, inst;
    wire[23:0] signedIMM;
    wire[11:0] valGeneratorIMM;
    wire[9:0] controlsignals;
    wire imm ,COUT, ZOUT, VOUT, NOUT;
    wire [31:0] Rn, Rm;

    reg clk=0, rst=0;
    reg C=0, V=0, Z=0, N=0;
    reg WB_WB_EN=0;
    reg[3:0] WBDest=4'd0;
    reg[31:0] WBValue=31'd0;

    always #5 clk=~clk;

    // IF instructionFetch(clk, rst, branchTaken, hazard, branchAddress, pc, inst);
    // ID instructionDecode(clk, rst, C, V, Z, N, WB_WB_EN, pc, inst, WBValue, WBDest, 
    //                     Rn, Rm, imm, COUT, ZOUT, VOUT, NOUT, signedIMM, valGeneratorIMM, controlsignals);
    IF instructionFetch(clk, rst, 1'd0, 1'b0, 32'd0, pc, inst);
    ID instructionDecode(clk, rst, 1'd0, 1'd0, 1'd0, 1'd0, 1'd0, pc, inst, 31'd0, 4'd0, 
                        Rn, Rm, imm, COUT, ZOUT, VOUT, NOUT, signedIMM, valGeneratorIMM, controlsignals);
    initial begin
        rst=1;
        // branchAddress=32'd0;
        // branchTaken=0;
        // hazard=0;
        #10
        rst=0;
        #1000
        // #50
        // {C,V,Z,N}=4'b1111;
        // #100
        $stop;
    end

endmodule