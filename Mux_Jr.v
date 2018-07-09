module Mux_Jr (mux_Jump, register_Address, flag_Jr, mux_Out);

	input [31:0] mux_Jump, register_Address;
	input flag_Jr;
	output reg [31:0] mux_Out;
	
	always@(*)
	begin
		if (flag_Jr)
			mux_Out = register_Address;
		else
			mux_Out = mux_Jump;
	end
	
endmodule
