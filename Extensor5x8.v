
module Extensor5x8(sinalEntrada, sinalExtendido);
	input [4:0] sinalEntrada;
	output reg [7:0] sinalExtendido;
	reg [7:0] aux;
	
	
	initial begin
		$display("teste extensor/complemento de 2");
		$monitor("entrada = %b, saida = %b", sinalEntrada, sinalExtendido);
	end
	
	always @ (*) begin
		
		if(sinalEntrada[4]) begin
			aux[7] = sinalEntrada[4];
			aux[6] = sinalEntrada[4];
			aux[5] = sinalEntrada[4];
			aux[4] = sinalEntrada[4];
			aux[3] = ~sinalEntrada[3];
			aux[2] = ~sinalEntrada[2];
			aux[1] = ~sinalEntrada[1];
			aux[0] = ~ sinalEntrada[0];
			sinalExtendido = 8'b00000001 + aux;
		end
		else begin
			sinalExtendido[7] = sinalEntrada[4];
			sinalExtendido[6] = sinalEntrada[4];
			sinalExtendido[5] = sinalEntrada[4];
			sinalExtendido[4] = sinalEntrada[4];
			sinalExtendido[3] = sinalEntrada[3];
			sinalExtendido[2] = sinalEntrada[2];
			sinalExtendido[1] = sinalEntrada[1];
			sinalExtendido[0] = sinalEntrada[0];
		end
	end

endmodule
