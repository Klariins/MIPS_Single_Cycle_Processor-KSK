module Mux_Branch (pc_In, offset_Branch, flag_OrigPC, flag_Zero, mux_Out);

	input [31:0] pc_In, offset_Branch;
	input flag_OrigPC, flag_Zero;
	output reg [31:0] mux_Out;
	reg [31:0] pc_Incremented;
	
	always@(*)
	begin
		pc_Incremented = pc_In + 1;
	
		if(flag_OrigPC & flag_Zero)
			mux_Out = offset_Branch;
		else
			mux_Out = pc_Incremented;
	end
	
endmodule
