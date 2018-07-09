module ProgramCounter (address_In, address_Out, flag_Halt, flag_Reset, clock);

	input [15:0] address_In;
	input flag_Halt, flag_Reset, clock;
	output reg [15:0] address_Out;

	always@(posedge clock)
	begin
		if (flag_Reset)
			address_Out = 0;
		else if (flag_Halt) 
		begin
			//nao faz nada
		end
		else 
			address_Out = address_In;
	end
	
endmodule
