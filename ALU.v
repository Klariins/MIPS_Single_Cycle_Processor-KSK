module ALU (flag_ALUOp, data_1, data_2, ALU_Result, shamt, zero, error_of, error_uf, error_div);

	input [5:0] flag_ALUOp;
	input [31:0] data_1, data_2;
	input [4:0] shamt;
	output zero;
	output reg error_of, error_uf, error_div;
	output reg [31:0] ALU_Result;
	
	parameter S0 = 6'b000000,	// add (soma)
				 S1 = 6'b000001,	// sub (subtracao)
				 S2 = 6'b000010,	// mul (multiplicacao)
				 S3 = 6'b000011,	// div (divisao)
				 S4 = 6'b000100,	// rem (resto)
				 S5 = 6'b000101,	// and
				 S6 = 6'b000110,	// or
				 S7 = 6'b000111,	// xor
				 S8 = 6'b001000,	// not
				 S9 = 6'b001001,	// slt (set less than) / blt (branch less than)
				 S10 = 6'b001010,	// slet (set less or equal than) / blet (branch less equal than)
				 S11 = 6'b001011,	// sgt (set greater than) / bgt (branch greater than)
				 S12 = 6'b001100,	// sget (set greater or equal than) / bget (branch greater equal than)
				 S13 = 6'b001101,	// beq (branch on equal)
				 S14 = 6'b001110,	// bne (branch on not equal)
				 S15 = 6'b001111,	// bltz (branch on less than zero)
				 S16 = 6'b010000,	// blez (branch on less or equal than zero)
				 S17 = 6'b010001,	// bgtz (branch on greater than zero)
				 S18 = 6'b010010,	// bgez (branch on greater or equal than zero)
				 S19 = 6'b010011,	// shift right
				 S20 = 6'b010100;	// shift left
	
	always@(*)
	begin
		error_of = 0;
		error_uf = 0;
		error_div = 0;

		case(flag_ALUOp[5:0])
			S0: 
			begin
				ALU_Result = data_1 + data_2;
				if (data_1[31] == data_2[31] && data_1[31] != ALU_Result[31])
					error_of = 1;
			end
			
			S1: 
			begin
				ALU_Result = data_1 - data_2;
				if (data_1[31] != data_2[31] && data_1[31] != ALU_Result[31])
					error_uf = 1;
			end
			
			S2: ALU_Result = data_1[15:0] * data_2[15:0];
			
			S3: 
			begin
				ALU_Result = data_1 / data_2;
				error_div = data_2 == 32'd0 ? 1 : 0;
			end
			
			S4: 
			begin
				ALU_Result = data_1 % data_2;
				error_div = data_2 == 32'd0 ? 1 : 0;
			end
			
			S5: ALU_Result = data_1 & data_2;
			
			S6: ALU_Result = data_1 | data_2;
			
			S7: ALU_Result = data_1 ^ data_2;
			
			S8: ALU_Result = ~data_1;
			
			S9: ALU_Result = ($signed(data_1) < $signed(data_2)) ? 1 : 0;
			
			S10: ALU_Result = ($signed(data_1) <= $signed(data_2)) ? 1 : 0;
			
			S11: ALU_Result = ($signed(data_1) > $signed(data_2)) ? 1 : 0;
			
			S12: ALU_Result = ($signed(data_1) >= $signed(data_2)) ? 1 : 0;
			
			S13: ALU_Result = data_1 == data_2 ? 1 : 0;
			
			S14: ALU_Result = data_1 != data_2 ? 1 : 0;
			
			S15: ALU_Result = ($signed(data_1) < 0) ? 1 : 0;
			
			S16: ALU_Result = ($signed(data_1) <= 0) ? 1 : 0;
			
			S17: ALU_Result = ($signed(data_1) > 0) ? 1 : 0;
			
			S18: ALU_Result = ($signed(data_1) >= 0) ? 1 : 0;
			
			S19: ALU_Result = data_1 >> shamt;
			
			S20: ALU_Result = data_1 << shamt;
			
			default: ALU_Result = 0;
		endcase	
	end
		
	assign zero = (ALU_Result == 1);
				
endmodule
