module Out (address, write_Data, flag_Write, flag_Out, flag_Reset, data_Out, clock);

	input [31:0] address, write_Data;
	input flag_Write, flag_Out, flag_Reset, clock;
	output reg [31:0] data_Out;
	
	reg [31:0] Dados [31:0];
	
	always@(posedge clock)
	begin
		if (flag_Write)
			Dados[address] = write_Data;
		else if (flag_Out)
			data_Out = Dados[address];
		else if (flag_Reset)
			data_Out = 32'd0;
	end

endmodule
