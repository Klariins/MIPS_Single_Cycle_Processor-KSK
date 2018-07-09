module Mux_In (immediate, switches, flag_SelectIn, mux_Out);

	input [15:0] immediate, switches;
	input flag_SelectIn;
	output reg [15:0] mux_Out;
	
	always@(*)
	begin
		if (flag_SelectIn)
			mux_Out = switches;
		else
			mux_Out = immediate;
	end

endmodule
