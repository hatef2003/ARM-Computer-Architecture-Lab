onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TOP /LGBT/idididid/ALURes
add wave -noupdate -group TOP /LGBT/idididid/ALUResOut
add wave -noupdate -group TOP /LGBT/idididid/branchAddress
add wave -noupdate -group TOP /LGBT/idididid/branchTaken
add wave -noupdate -group TOP /LGBT/idididid/C
add wave -noupdate -group TOP /LGBT/idididid/clk
add wave -noupdate -group TOP /LGBT/idididid/controlsignals
add wave -noupdate -group TOP /LGBT/idididid/controlsignalsOut
add wave -noupdate -group TOP /LGBT/idididid/COUT
add wave -noupdate -group TOP /LGBT/idididid/CoutOut
add wave -noupdate -group TOP /LGBT/idididid/dest
add wave -noupdate -group TOP /LGBT/idididid/flush
add wave -noupdate -group TOP /LGBT/idididid/freeze
add wave -noupdate -group TOP /LGBT/idididid/Gen_C
add wave -noupdate -group TOP /LGBT/idididid/Gen_N
add wave -noupdate -group TOP /LGBT/idididid/Gen_V
add wave -noupdate -group TOP /LGBT/idididid/Gen_Z
add wave -noupdate -group TOP /LGBT/idididid/hazard_src2
add wave -noupdate -group TOP /LGBT/idididid/IF_instruction
add wave -noupdate -group TOP /LGBT/idididid/IF_instructionOut
add wave -noupdate -group TOP /LGBT/idididid/IF_PC
add wave -noupdate -group TOP /LGBT/idididid/IF_PCOut
add wave -noupdate -group TOP /LGBT/idididid/imm
add wave -noupdate -group TOP /LGBT/idididid/immOut
add wave -noupdate -group TOP /LGBT/idididid/instruction_ID
add wave -noupdate -group TOP /LGBT/idididid/instruction_IDOut
add wave -noupdate -group TOP /LGBT/idididid/MEM_R_EN_OUT
add wave -noupdate -group TOP /LGBT/idididid/MEM_W_EN_OUT
add wave -noupdate -group TOP /LGBT/idididid/memOut
add wave -noupdate -group TOP /LGBT/idididid/MEMReg_ALUResOut
add wave -noupdate -group TOP /LGBT/idididid/MEMReg_DataMemoryOutput32Bit_Out
add wave -noupdate -group TOP /LGBT/idididid/MEMReg_MEM_R_EN_OUT
add wave -noupdate -group TOP /LGBT/idididid/memREnOut
add wave -noupdate -group TOP /LGBT/idididid/memWEnOut
add wave -noupdate -group TOP /LGBT/idididid/N
add wave -noupdate -group TOP /LGBT/idididid/NOUT
add wave -noupdate -group TOP /LGBT/idididid/PC_ID
add wave -noupdate -group TOP /LGBT/idididid/PC_IDOut
add wave -noupdate -group TOP /LGBT/idididid/Rm
add wave -noupdate -group TOP /LGBT/idididid/RmOut
add wave -noupdate -group TOP /LGBT/idididid/Rn
add wave -noupdate -group TOP /LGBT/idididid/RnOut
add wave -noupdate -group TOP /LGBT/idididid/rst
add wave -noupdate -group TOP /LGBT/idididid/signedIMM
add wave -noupdate -group TOP /LGBT/idididid/signedIMMOut
add wave -noupdate -group TOP /LGBT/idididid/statOut
add wave -noupdate -group TOP /LGBT/idididid/statusBits
add wave -noupdate -group TOP /LGBT/idididid/Two_src
add wave -noupdate -group TOP /LGBT/idididid/V
add wave -noupdate -group TOP /LGBT/idididid/valGeneratorIMM
add wave -noupdate -group TOP /LGBT/idididid/valGeneratorIMMOut
add wave -noupdate -group TOP /LGBT/idididid/valRmOut
add wave -noupdate -group TOP /LGBT/idididid/valRmOut2
add wave -noupdate -group TOP /LGBT/idididid/VOUT
add wave -noupdate -group TOP /LGBT/idididid/WB_Dest
add wave -noupdate -group TOP /LGBT/idididid/WB_EN_OUT
add wave -noupdate -group TOP /LGBT/idididid/WB_Value
add wave -noupdate -group TOP /LGBT/idididid/WB_WB_EN
add wave -noupdate -group TOP /LGBT/idididid/WBDest
add wave -noupdate -group TOP /LGBT/idididid/WBDestOut
add wave -noupdate -group TOP /LGBT/idididid/WEout
add wave -noupdate -group TOP /LGBT/idididid/Z
add wave -noupdate -group TOP /LGBT/idididid/ZOUT
add wave -noupdate -group IF /LGBT/idididid/intructionFetch/branchAddress
add wave -noupdate -group IF /LGBT/idididid/intructionFetch/branchTaken
add wave -noupdate -group IF /LGBT/idididid/intructionFetch/clk
add wave -noupdate -group IF /LGBT/idididid/intructionFetch/freeze
add wave -noupdate -group IF -radix decimal /LGBT/idididid/intructionFetch/instruction
add wave -noupdate -group IF -radix unsigned /LGBT/idididid/intructionFetch/PC
add wave -noupdate -group IF -radix unsigned /LGBT/idididid/intructionFetch/PCIn
add wave -noupdate -group IF /LGBT/idididid/intructionFetch/rst
add wave -noupdate -expand -group IF_REG /LGBT/idididid/intructionFetchRegister/clk
add wave -noupdate -expand -group IF_REG /LGBT/idididid/intructionFetchRegister/flush
add wave -noupdate -expand -group IF_REG /LGBT/idididid/intructionFetchRegister/freeze
add wave -noupdate -expand -group IF_REG /LGBT/idididid/intructionFetchRegister/Instruction
add wave -noupdate -expand -group IF_REG /LGBT/idididid/intructionFetchRegister/instructionIn
add wave -noupdate -expand -group IF_REG -radix unsigned /LGBT/idididid/intructionFetchRegister/pc
add wave -noupdate -expand -group IF_REG -radix unsigned /LGBT/idididid/intructionFetchRegister/pcIn
add wave -noupdate -expand -group IF_REG /LGBT/idididid/intructionFetchRegister/rst
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/C
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/clk
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/condtionChechOut
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/controlsignals
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/controlUnitOut
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/COUT
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/imm
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/instruction
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/N
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/NOUT
add wave -noupdate -group ID -radix unsigned /LGBT/idididid/instructionDecode/pc
add wave -noupdate -group ID -radix decimal /LGBT/idididid/instructionDecode/Rm
add wave -noupdate -group ID -radix decimal /LGBT/idididid/instructionDecode/Rn
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/rst
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/signedIMM
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/src2
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/src2_out
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/Two_src
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/V
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/valGeneratorIMM
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/VOUT
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/WBDest
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/WBValue
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/WBWriteEnable
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/Z
add wave -noupdate -group ID /LGBT/idididid/instructionDecode/ZOUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/B
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/B_OUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/C
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/clk
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/Cout
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/dest
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/destOut
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/EXE_CMD
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/EXE_CMD_OUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/flush
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/freeze
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/imm
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/immOut
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/MEM_R_EN
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/MEM_R_EN_OUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/MEM_W_EN
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/MEM_W_EN_OUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/PC
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/PC_OUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/rst
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/S
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/S_OUT
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/shiftOperand
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/shiftOperandOut
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/signedIMM
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/signedIMMOut
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/val1
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/valRm
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/valRmOut
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/valRn
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/WB_EN
add wave -noupdate -group ID_REG /LGBT/idididid/id_reg/WB_EN_OUT
add wave -noupdate -group EXE /LGBT/idididid/exe/aluCarryOut
add wave -noupdate -group EXE /LGBT/idididid/exe/ALURes
add wave -noupdate -group EXE /LGBT/idididid/exe/branchAddress
add wave -noupdate -group EXE /LGBT/idididid/exe/clk
add wave -noupdate -group EXE /LGBT/idididid/exe/EXE_CMD
add wave -noupdate -group EXE /LGBT/idididid/exe/imm
add wave -noupdate -group EXE /LGBT/idididid/exe/MEM_R_EN
add wave -noupdate -group EXE /LGBT/idididid/exe/MEM_W_EN
add wave -noupdate -group EXE /LGBT/idididid/exe/memCommand
add wave -noupdate -group EXE /LGBT/idididid/exe/memREnOut
add wave -noupdate -group EXE /LGBT/idididid/exe/memWEnOut
add wave -noupdate -group EXE /LGBT/idididid/exe/N
add wave -noupdate -group EXE /LGBT/idididid/exe/PC
add wave -noupdate -group EXE /LGBT/idididid/exe/rest
add wave -noupdate -group EXE /LGBT/idididid/exe/Rm
add wave -noupdate -group EXE /LGBT/idididid/exe/shiftOperand
add wave -noupdate -group EXE /LGBT/idididid/exe/signedIMM
add wave -noupdate -group EXE /LGBT/idididid/exe/statusBits
add wave -noupdate -group EXE /LGBT/idididid/exe/val1
add wave -noupdate -group EXE /LGBT/idididid/exe/val2_gen_out
add wave -noupdate -group EXE /LGBT/idididid/exe/valRmOut
add wave -noupdate -group EXE /LGBT/idididid/exe/WB_EN
add wave -noupdate -group EXE /LGBT/idididid/exe/WEout
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/ALURes
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/ALUResOut
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/clk
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/dest
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/destOut
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/MEM_R_EN
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/MEM_R_EN_OUT
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/MEM_W_EN
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/MEM_W_EN_OUT
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/rst
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/valRm
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/valRmOut
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/WB_EN
add wave -noupdate -group EXE_REG /LGBT/idididid/exeReg/WB_EN_OUT
add wave -noupdate -group DM /LGBT/idididid/dataMemory/addr
add wave -noupdate -group DM /LGBT/idididid/dataMemory/ALU_Res
add wave -noupdate -group DM /LGBT/idididid/dataMemory/clk
add wave -noupdate -group DM /LGBT/idididid/dataMemory/i
add wave -noupdate -group DM /LGBT/idididid/dataMemory/mem
add wave -noupdate -group DM /LGBT/idididid/dataMemory/MEM_R_EN
add wave -noupdate -group DM /LGBT/idididid/dataMemory/MEM_W_EN
add wave -noupdate -group DM /LGBT/idididid/dataMemory/out
add wave -noupdate -group DM /LGBT/idididid/dataMemory/rst
add wave -noupdate -group DM /LGBT/idididid/dataMemory/temp
add wave -noupdate -group DM /LGBT/idididid/dataMemory/Val_Rm
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/AluRes
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/AluRes_OUT
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/clk
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/DataMemoryOutput32Bit
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/DataMemoryOutput32Bit_Out
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/dest
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/destOut
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/freeze
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/MEM_R_EN
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/MEM_R_EN_OUT
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/rst
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/WB_EN
add wave -noupdate -group MEM_REG /LGBT/idididid/memReg/WB_EN_OUT
add wave -noupdate -group WB /LGBT/idididid/wbStage/in0
add wave -noupdate -group WB /LGBT/idididid/wbStage/in1
add wave -noupdate -group WB /LGBT/idididid/wbStage/out
add wave -noupdate -group WB /LGBT/idididid/wbStage/select
add wave -noupdate -group Status /LGBT/idididid/StReg/clk
add wave -noupdate -group Status /LGBT/idididid/StReg/en
add wave -noupdate -group Status /LGBT/idididid/StReg/rst
add wave -noupdate -group Status /LGBT/idididid/StReg/statIn
add wave -noupdate -group Status /LGBT/idididid/StReg/statOut
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/MEM_Dest
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/MEM_WB_EN
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/EXE_Dest
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/EXE_WB_EN
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/Rn
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/Rm
add wave -noupdate -group HAZARD /LGBT/idididid/hazard/Two_src
add wave -noupdate -group HAZARD -color {Cornflower Blue} -itemcolor {Cornflower Blue} /LGBT/idididid/hazard/freeze
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/BOut
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/EXE_CMDOut
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/MEM_R_ENOut
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/MEM_W_ENOut
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/modeIn
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/opCodeIn
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/out
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/SIn
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/SOut
add wave -noupdate -group CU /LGBT/idididid/instructionDecode/controUnit/WB_ENOut
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/clk
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/loaden
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/pin
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/pout
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/regVal
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/rst
add wave -noupdate -group IF_PC /LGBT/idididid/intructionFetch/pc/WIDTH
add wave -noupdate -group PC /LGBT/idididid/intructionFetch/programCounter/pcIn
add wave -noupdate -group PC /LGBT/idididid/intructionFetch/programCounter/pcOut
add wave -noupdate -group IF_IM /LGBT/idididid/intructionFetch/instructionMem/mem
add wave -noupdate -group IF_IM /LGBT/idididid/intructionFetch/instructionMem/memAddr
add wave -noupdate -group IF_IM /LGBT/idididid/intructionFetch/instructionMem/mem
add wave -noupdate -group IF_IM /LGBT/idididid/intructionFetch/instructionMem/memAddr
add wave -noupdate -group IF_MUX /LGBT/idididid/intructionFetch/mux/in0
add wave -noupdate -group IF_MUX /LGBT/idididid/intructionFetch/mux/in1
add wave -noupdate -group IF_MUX /LGBT/idididid/intructionFetch/mux/out
add wave -noupdate -group IF_MUX /LGBT/idididid/intructionFetch/mux/select
add wave -noupdate -group Con_Check /LGBT/idididid/instructionDecode/conditionCheck/c
add wave -noupdate -group Con_Check /LGBT/idididid/instructionDecode/conditionCheck/cond
add wave -noupdate -group Con_Check /LGBT/idididid/instructionDecode/conditionCheck/flag
add wave -noupdate -group Con_Check /LGBT/idididid/instructionDecode/conditionCheck/n
add wave -noupdate -group Con_Check /LGBT/idididid/instructionDecode/conditionCheck/v
add wave -noupdate -group Con_Check /LGBT/idididid/instructionDecode/conditionCheck/z
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/clk
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/destWB
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/reg1
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/reg2
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/resultWB
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/rst
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/src1
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/src2
add wave -noupdate -group RF -group RF_Sigs /LGBT/idididid/instructionDecode/registerFile/writeBackEn
add wave -noupdate -group RF -childformat {{{/LGBT/idididid/instructionDecode/registerFile/registers[0]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[1]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[2]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[3]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[4]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[5]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[6]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[7]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[8]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[9]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[10]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[11]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[12]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[13]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[14]} -radix decimal} {{/LGBT/idididid/instructionDecode/registerFile/registers[15]} -radix decimal}} -expand -subitemconfig {{/LGBT/idididid/instructionDecode/registerFile/registers[0]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[1]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[2]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[3]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[4]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[5]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[6]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[7]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[8]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[9]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[10]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[11]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[12]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[13]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[14]} {-height 16 -radix decimal} {/LGBT/idididid/instructionDecode/registerFile/registers[15]} {-height 16 -radix decimal}} /LGBT/idididid/instructionDecode/registerFile/registers
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {145 ns} 1} {{Cursor 2} {155 ns} 1}
quietly wave cursor active 1
configure wave -namecolwidth 188
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {239 ns}
