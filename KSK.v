module KSK (switches, 
				negative, unidade, dezena, centena, milhar, dmilhar, cmilhar, bilhao,
				errorAdd, errorSub, errorDiv,
				Reset, haltButton, Halt, 
				badClock);

	input [15:0] switches;
	input badClock, haltButton, Reset;
	output [6:0] unidade, dezena, centena, milhar, dmilhar, cmilhar, bilhao;
	output negative, errorAdd, errorSub, errorDiv;
	output wire Halt;
	
	wire goodClock, haltOut, haltIn;
	wire Jal, RegWrite, MemWrite, MemRead, OrigPC, Zero, RegDst, MemtoReg, ALUSrc, Jump, Jr, SelectIn, Out;
	wire [3:0] one, ten, hundred, thousand, tthousand, hthousand, billion;
	wire [5:0] ALUOp, OPCode;
	wire [15:0] inst16;
	wire [31:0] pcAddress, instAddress, inst16_32, inst26_32;
	wire [31:0] Instruction, data1, data2, ALU_Out, DM_Out, dataOut;
	wire [31:0] mIM_Out, mRB_Out, mDM_Out, mB_Out, mJ_Out;
	
	Timer 						TM	(.clock(badClock), 
										 .clock_Out(goodClock));
	
	DeBounce_v 					DB	(.clk(badClock),
										 .n_reset(1'b1), 
										 .button_in(haltButton), 
										 .DB_out(haltOut));
										 
	botaoEstados				BE (.clock(goodClock),
										 .dbOut(haltOut),
										 .saida(haltIn));
	
	ProgramCounter 			PC	(.address_In(pcAddress), 
										 .address_Out(instAddress), 
										 .flag_Halt(Halt), 
										 .flag_Reset(Reset), 
										 .clock(goodClock));
	
	InstructionMemory 		IM	(.read_Address(instAddress), 
										 .instruction(Instruction), 
										 .clock(goodClock));
		
	ControlUnit 				CU	(.OPCode(Instruction[31:26]), 
										 .flag_Halt(haltIn), 
										 .PC_Halt(Halt), 
										 .RB_Jal(Jal), 
										 .RB_RegWrite(RegWrite), 
										 .ALU_ALUOp(ALUOp), 
										 .DM_MemWrite(MemWrite), 
										 .DM_MemRead(MemRead), 
										 .MuxB_OrigPC(OrigPC), 
										 .MuxIM_RegDst(RegDst), 
										 .MuxDM_MemtoReg(MemtoReg), 
										 .MuxRB_ALUSrc(ALUSrc), 
										 .MuxJ_Jump(Jump), 
										 .MuxJr_Jr(Jr), 
										 .MuxIn_SelectIn(SelectIn), 
										 .Out(Out));
										 
	Mux_InstructionMemory  mIM (.inst_rt(Instruction[20:16]), 
										 .inst_rd(Instruction[15:11]), 
										 .flag_RegDst(RegDst), 
										 .mux_Out(mIM_Out));
	
	RegisterBank 				RB	(.read_Reg1(Instruction[25:21]), 
										 .read_Reg2(Instruction[20:16]), 
										 .write_Reg(mIM_Out), 
										 .write_Data(mDM_Out), 
										 .data_Reg1(data1), 
										 .data_Reg2(data2), 
										 .address_PC(instAddress), 
										 .flag_Jal(Jal), 
										 .flag_RegWrite(RegWrite), 
										 .clock(goodClock));
										 
	Mux_In 					  mIn (.immediate(Instruction[15:0]), 
										 .switches(switches), 
										 .flag_SelectIn(SelectIn) , 
										 .mux_Out(inst16));
										 	
	Extender_16_to_32 	  E16 (.inst_In(inst16), 
										 .inst_Out(inst16_32));
		
	Mux_RegisterBank 		  mRB	(.read_Data2(data2), 
										 .immediate(inst16_32), 
										 .flag_ALUSrc(ALUSrc), 
										 .mux_Out(mRB_Out));
	
	ALU 						  ULA (.flag_ALUOp(ALUOp), 
										 .data_1(data1), 
										 .data_2(mRB_Out), 
										 .ALU_Result(ALU_Out), 
										 .shamt(Instruction[10:6]), 
										 .zero(Zero), 
										 .error_of(errorAdd), 
										 .error_uf(errorSub), 
										 .error_div(errorDiv));
	
	DataMemory 					DM	(.address(ALU_Out), 
										 .write_Data(data2), 
										 .read_Data(DM_Out), 
										 .flag_MemWrite(MemWrite), 
										 .flag_MemRead(MemRead), 
										 .clock(goodClock));
	
	Mux_DataMemory 		  mDM (.ALU_Result(ALU_Out), 
										 .read_Data(DM_Out), 
										 .flag_MemtoReg(MemtoReg), 
										 .mux_Out(mDM_Out));
	
	Mux_Branch 					mB	(.pc_In(instAddress), 
										 .offset_Branch(inst16_32), 
										 .flag_OrigPC(OrigPC), 
										 .flag_Zero(Zero), 
										 .mux_Out(mB_Out));
	
	Extender_26_to_32 	  E26 (.inst_In(Instruction[25:0]), 
										 .inst_Out(inst26_32));
	
	Mux_Jump 					mJ	(.jump_Address(inst26_32), 
										 .mux_Branch(mB_Out), 
										 .flag_Jump(Jump), 
										 .mux_Out(mJ_Out));
	
	Mux_Jr 					  mJr (.mux_Jump(mJ_Out), 
										 .register_Address(data1), 
										 .flag_Jr(Jr), 
										 .mux_Out(pcAddress));
	
	Out 						 POut (.address(ALU_Out), 
										 .write_Data(data2), 
										 .flag_Write(MemWrite), 
										 .flag_Out(Out), 
										 .flag_Reset(Reset), 
										 .data_Out(dataOut), 
										 .clock(goodClock));
	
	BinaryToBCD_Converter 	 C (.binary(dataOut), 
										 .negative(negative), 
										 .first(one), 
										 .second(ten), 
										 .third(hundred),
										 .fourth(thousand),
										 .fifth(tthousand),
										 .sixth(hthousand),
										 .seventh(billion));
	
	Display 					   D1 (.entrada(one), 
										 .saida(unidade));
	
	Display 					   D2 (.entrada(ten), 
										 .saida(dezena));
	
	Display		 			   D3 (.entrada(hundred), 
										 .saida(centena));
										 
	Display						D4 (.entrada(thousand), 
										 .saida(milhar));
	
	Display						D5 (.entrada(tthousand), 
										 .saida(dmilhar));
	
	Display						D6 (.entrada(hthousand), 
										 .saida(cmilhar));
	
	Display						D7(.entrada(billion), 
										 .saida(bilhao));
	
endmodule
