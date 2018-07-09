module Extender_26_to_32 (inst_In, inst_Out);

	input [25:0] inst_In;
	output reg[31:0] inst_Out;
	
	//Instrucoes estao em complemento de 2
	
	always@(*)
	begin
		inst_Out = {{6{inst_In[25]}}, inst_In};
	end

endmodule