module BinaryToBCD_Converter (binary, negative, first, second, third, fourth, fifth, sixth, seventh);

	input [31:0] binary;
	reg [31:0] binary_out;
	output reg [3:0] first, second, third, fourth, fifth, sixth, seventh;
	reg [3:0] eighth;
	output reg negative;
	integer i;
	
	always@(binary)
	begin
		if(binary[31])
		begin
			binary_out = ~binary + 1;
			negative = 0;
		end
		else
		begin
			binary_out = binary;
			negative = 1;
		end
		
		first = 4'd0;
		second = 4'd0;
		third = 4'd0;
		fourth = 4'd0;
		fifth = 4'd0;
		sixth = 4'd0;
		seventh = 4'd0;
		eighth = 4'd0;
		
		for(i=31; i>=0; i=i-1)
		begin
			if(eighth >= 5)
				eighth = eighth + 4'd3;
			if(seventh >= 5)
				seventh = seventh + 4'd3;
			if(sixth >= 5)
				sixth = sixth + 4'd3;
			if(fifth >= 5)
				fifth = fifth + 4'd3;
			if(fourth >= 5)
				fourth = fourth + 4'd3;
			if(third >= 5)
				third = third + 4'd3;
			if(second >= 5)
				second = second + 4'd3;
			if(first >= 5)
				first = first + 4'd3;
				
			eighth = eighth << 1;
			eighth[0] = seventh[3];	
			seventh = seventh << 1;
			seventh[0] = sixth[3];	
			sixth = sixth << 1;
			sixth[0] = fifth[3];	
			fifth = fifth << 1;
			fifth[0] = fourth[3];
			fourth = fourth << 1;
			fourth[0] = third[3];
			third = third << 1;
			third[0] = second[3];
			second = second << 1;
			second[0] = first[3];
			first = first << 1;
			first[0] = binary_out[i];
		end
	end
	
endmodule 