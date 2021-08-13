module Tr(sinal, clock, registrador, valorEscrita, valorSaida); 
	input clock, sinal;
	input [1:0]registrador;
	input [7:0]valorEscrita;
	output reg [7:0]valorSaida;
	integer i;
	reg [7:0]t[3:0];//t0, t1, t2, t3
	
	initial 
	  begin
			$display("Lendo o banco de registradores");
			for(i = 0; i <= 3; i = i + 1) t[i] = 0;
			$monitor("%b %b %b %b", t[0],t[1],t[2],t[3]);
	  end
	  

	
	always @(posedge clock or negedge clock) begin
		if(clock) begin //escrita
			if(sinal) begin
				t[registrador] = valorEscrita;
			end
		end
		else begin //leitura
			valorSaida = t[registrador];
		end
	end
endmodule