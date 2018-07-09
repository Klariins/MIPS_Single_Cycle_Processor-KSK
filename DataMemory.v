module DataMemory (address, write_Data, read_Data, flag_MemWrite, flag_MemRead, clock);

	input [31:0] address, write_Data;
	input flag_MemWrite, flag_MemRead, clock;
	output reg [31:0] read_Data;
	reg [31:0] Memory [31:0];
	reg [31:0] Stack [31:0];
	
	always@(negedge clock)
	begin
		if (flag_MemWrite)
		begin
			if (address < 0)
				Stack[33 - address] = write_Data;
			else 
				Memory[address] = write_Data;
		end
		
		if (flag_MemRead)
		begin
			if (address < 0)
				read_Data = Stack[33 - address];
			else
				read_Data = Memory[address];
		end
	end
	
endmodule
