module Sr(sinal, clock, registrador, valorEscrita, valorSaida); 
	input clock, sinal;
	input [2:0]registrador;
	input [7:0]valorEscrita;
	output reg [7:0]valorSaida;
	integer i;
	reg [7:0]s[5:0];//s0, s1, s2, s3, s4, s5
	
	initial 
        begin
				$display("Lendo o banco de registradores");
				for(i = 0; i <= 5; i = i + 1) s[i] = 0;
		   	$monitor("%b %b %b %b %b %b", s[0],s[1],s[2],s[3],s[4],s[5]);
        end
		  
	
	always @(posedge clock or negedge clock) begin
		if(clock) begin //escrita
			if(sinal) begin
				s[registrador] = valorEscrita;
			end
		end
		else begin //leitura
			valorSaida = s[registrador];
		end
	end
endmodule
