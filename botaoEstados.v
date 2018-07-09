module botaoEstados(clock, dbOut, saida);

	input clock, dbOut;
	output reg saida;
	reg estado = 0;
	
	always@(posedge clock)
	begin
		if(estado == 0)
		begin
			saida = dbOut;
			if(dbOut == 0)
				estado = 1;
		end
		else
		begin
			saida = 1;
			if(dbOut == 1)
				estado = 0;
		end
	end

endmodule