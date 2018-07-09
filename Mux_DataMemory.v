module Mux_DataMemory (ALU_Result, read_Data, flag_MemtoReg, mux_Out);

	input [31:0] ALU_Result, read_Data;
	input flag_MemtoReg;
	output reg [31:0] mux_Out;
	
	always@(*)
	begin
		if (flag_MemtoReg)
			mux_Out = read_Data;
		else
			mux_Out = ALU_Result;
	end

endmodule
