module Timer (clock, clock_Out);

	input clock;
	output reg clock_Out;
	reg [25:0] conter;

	always @ (posedge clock) 
		begin
			if (conter == 1_000_000)
				begin
					clock_Out <= ~clock_Out;
					conter <= 0;
				end
			else
				begin
					conter <= conter + 1'b1;
				end
		end
			
endmodule 