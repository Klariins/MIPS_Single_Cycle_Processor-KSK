module Display (entrada, saida);
	
	input [3:0] entrada;
	output reg [6:0] saida;
	
	always@(*)
	begin
		case (entrada [3:0])
			4'd0: saida = 7'b0000001;
			4'd1: saida = 7'b1001111;
			4'd2: saida = 7'b0010010;
			4'd3: saida = 7'b0000110;
			4'd4: saida = 7'b1001100;
			4'd5: saida = 7'b0100100;
			4'd6: saida = 7'b0100000;
			4'd7: saida = 7'b0001111;
			4'd8: saida = 7'b0000000;
			4'd9: saida = 7'b0000100;
			default: saida = 7'b1111111;
		endcase
	end
		
endmodule
