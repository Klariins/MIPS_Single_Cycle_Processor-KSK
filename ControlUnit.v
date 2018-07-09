module ControlUnit (OPCode, flag_Halt, PC_Halt, RB_Jal, RB_RegWrite, ALU_ALUOp, DM_MemWrite, DM_MemRead, MuxB_OrigPC, MuxIM_RegDst, MuxDM_MemtoReg, MuxRB_ALUSrc, MuxJ_Jump, MuxJr_Jr, MuxIn_SelectIn, Out);

	input [5:0] OPCode;
	input flag_Halt;
	output reg [5:0] ALU_ALUOp;
	output reg 	PC_Halt,
					MuxIM_RegDst,
					RB_Jal,
					RB_RegWrite,
					MuxRB_ALUSrc,
					DM_MemWrite,
					DM_MemRead,
					MuxDM_MemtoReg,
					MuxB_OrigPC,
					MuxJ_Jump,
					MuxJr_Jr,
					MuxIn_SelectIn,
					Out;

	parameter S0 = 6'b000000,	// add
				 S1 = 6'b000001,	// addi
				 S2 = 6'b000010,	// sub
				 S3 = 6'b000011,	// subi
				 S4 = 6'b000100,	// mult
				 S5 = 6'b000101,	// div
				 S6 = 6'b000110,	// and
				 S7 = 6'b000111,	// andi
				 S8 = 6'b001000,	// or
				 S9 = 6'b001001,	// ori
				 S10 = 6'b001010,	// xor
				 S11 = 6'b001011,	// xori
				 S12 = 6'b001100,	// slt
				 S13 = 6'b001101,	// slet
				 S14 = 6'b001110,	// sgt
				 S15 = 6'b001111,	// sget
				 S16 = 6'b010000,	// beq
				 S17 = 6'b010001,	// bnq
				 S18 = 6'b010010,	// blt
				 S19 = 6'b010011,	// blet
				 S20 = 6'b010100,	// bgt
				 S21 = 6'b010101,	// bget
				 S22 = 6'b010110,	// bltz
				 S23 = 6'b010111,	// blez
				 S24 = 6'b011000,	// bgtz
				 S25 = 6'b011001,	// bgez
				 S26 = 6'b011010,	// srl
				 S27 = 6'b011011,	// sll
				 S28 = 6'b011100,	// li
				 S29 = 6'b011101,	// lw
				 S30 = 6'b011110,	// sw
				 S31 = 6'b011111,	// not
				 S32 = 6'b100000,	// move
				 S33 = 6'b100001,	// jump
				 S34 = 6'b100010,	// jal
				 S35 = 6'b100011,	// jr
				 S36 = 6'b100101,	// nop
				 S37 = 6'b100110,	//	in
				 S38 = 6'b100111; // out
				 

	always@(*)
	begin
		case (OPCode)
		
			S0:	//add
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S1:	//addi
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S2:	//sub
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000001;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S3:	//subi
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000001;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S4:	//mult
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000010;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S5:	//div
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000011;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S6:	//and
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000101;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S7:	//andi
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000101;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S8:	//or
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000110;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S9:	//ori
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000110;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S10:	//xor
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000111;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S11:	//xori
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000111;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S12:	//slt
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001001;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S13:	//slet
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001010;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S14:	//sgt
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001011;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S15:	//sget
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001100;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S16:	//beq
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001101;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S17:	//bne
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001110;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S18:	//blt
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001001;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S19:	//blet
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001010;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S20:	//bgt
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001011;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S21:	//bget
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001100;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S22:	//bltz
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001111;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S23:	//blez
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b010000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S24:	//bgtz
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b010001;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S25:	//bgez
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b010010;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 1;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S26:	//srl
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b010011;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S27:	//sll
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b010100;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S28:	//li
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S29:	//lw
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 1;
				MuxDM_MemtoReg = 1;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S30:	//sw
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 1;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S31:	//not
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b001000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S32:	//move
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S33:	//jump
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'bxxxxxx;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 1;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S34:	//jal
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 1;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'bxxxxxx;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 1;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S35:	//jr
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'bxxxxxx;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 1;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S36:	//nop
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'bxxxxxx;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
			S37:	//in
			begin
				if (flag_Halt)
					PC_Halt = 1;
				else
					PC_Halt = 0;
				MuxIM_RegDst = 1;
				RB_Jal = 0;
				RB_RegWrite = 1;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 1;
				Out = 0;
			end
			
			S38:	//out
			begin
				if (flag_Halt)
					PC_Halt = 1;
				else
					PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 1;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 1;
			end
			
			default:
			begin
				PC_Halt = 0;
				MuxIM_RegDst = 0;
				RB_Jal = 0;
				RB_RegWrite = 0;
				MuxRB_ALUSrc = 0;
				ALU_ALUOp = 6'b000000;
				DM_MemWrite = 0;
				DM_MemRead = 0;
				MuxDM_MemtoReg = 0;
				MuxB_OrigPC = 0;
				MuxJ_Jump = 0;
				MuxJr_Jr = 0;
				MuxIn_SelectIn = 0;
				Out = 0;
			end
			
		endcase
	end
endmodule









