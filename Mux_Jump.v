module Mux_Jump (jump_Address, mux_Branch, flag_Jump, mux_Out);

	input [31:0] jump_Address, mux_Branch;
	input flag_Jump;
	output reg [31:0] mux_Out;
	
	always@(*)
	begin
		if (flag_Jump)
			mux_Out = jump_Address;
		else
			mux_Out = mux_Branch;
	end
	
endmodule
