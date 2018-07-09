module Extender_16_to_32 (inst_In, inst_Out);

	input [15:0] inst_In;
	output reg [31:0] inst_Out;
	
	//Instrucoes estao em complemento de 2
	
	always@(*)
	begin
		inst_Out = {{16{inst_In[15]}}, inst_In};
	end

endmodule
