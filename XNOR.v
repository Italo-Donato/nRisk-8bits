module XNOR(a,b,saida);
		input a,b;
		output reg saida;
		
		always@(*) begin
			saida = (a && b) || (~a && ~b);
		end

endmodule
