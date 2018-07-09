module Mux_InstructionMemory (inst_rt, inst_rd, flag_RegDst, mux_Out);

	input [4:0] inst_rt, inst_rd;
	input flag_RegDst;
	output reg [4:0] mux_Out;

	always@(*)
	begin
		if (flag_RegDst)
			mux_Out = inst_rt;
		else 
			mux_Out = inst_rd;
	end
	
endmodule
