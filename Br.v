module Br(sinal, clock, registrador, valorEscrita, valorSaida); 
	input clock, sinal, registrador, valorEscrita;
	output reg valorSaida;
	reg [1:0]b;//b0, b1
	
	initial 
	  begin
			$display("Lendo o banco de registradores");
			b[0] = 0; b[1] = 0;
			$monitor("%b %b", b[0],b[1]);
	  end
	  
	
	always @(posedge clock or negedge clock) begin
		if(clock) begin //escrita
			if(sinal) begin
				b[registrador] = valorEscrita;
			end
		end
		else begin //leitura
			valorSaida = b[registrador];
		end
	end
endmodule