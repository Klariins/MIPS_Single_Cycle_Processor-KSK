module RegisterBank (read_Reg1, read_Reg2, write_Reg, write_Data, data_Reg1, data_Reg2, address_PC, flag_Jal, flag_RegWrite, clock);

	input [4:0] read_Reg1, read_Reg2, write_Reg;
	input [31:0] write_Data, address_PC;
	input flag_Jal, flag_RegWrite, clock;
	output [31:0] data_Reg1, data_Reg2;
	reg [31:0] Registers [31:0];					// $0 $zero
															// $31 $ra jal address
	always@(posedge clock)
	begin
		Registers[0] = 32'd0;
		
		if (flag_Jal)
			Registers[31] = address_PC + 1;
		if (flag_RegWrite)
			Registers[write_Reg] = write_Data;	// se flag_Write == 1, o dado de write_Data é salvo no registrador reg_Dest
	end

	assign data_Reg1 = Registers[read_Reg1];	// faz a leitura do Reg1 e salva o seu conteudo em data_Reg1 para leitura
	assign data_Reg2 = Registers[read_Reg2];	// faz a leitura do Reg2 e salva o seu conteudo em data_Reg2 para leitura
		
endmodule 
