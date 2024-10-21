module IF_TB()

    reg [31:0] Branch_Address;
    reg Branch_Taken, Hazard;
    wire PC, Inst;

    reg clk=0;

    initial begin
        clk=~clk;
        #5;
    end

    IF Instruction_Fetch(clk, Branch_Taken, Hazard, PC, Inst);
    initial begin
        Branch_Address=32'd0;
        Branch_Taken=0;
        Hazard=0;
        #500;
    end

endmodule