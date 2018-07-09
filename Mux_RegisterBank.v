module Mux_RegisterBank (read_Data2, immediate, flag_ALUSrc, mux_Out);

	input [31:0] read_Data2, immediate;
	input flag_ALUSrc;
	output reg [31:0] mux_Out;
	
	always@(*)
	begin
		if (flag_ALUSrc)
			mux_Out = immediate;
		else
			mux_Out = read_Data2;
	end

endmodule
