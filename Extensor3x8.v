module Extensor3x8(sinalEntrada, sinalExtendido);
	input [2:0] sinalEntrada;
	output reg [7:0] sinalExtendido;
	reg [7:0] aux;
	
	
	initial begin
		$display("teste extensor/complemento de 2");
		$monitor("entrada = %b, saida = %b", sinalEntrada, sinalExtendido);
	end
	
	always @ (*) begin
		
		if(sinalEntrada[2]) begin
			aux[7] = sinalEntrada[2];
			aux[6] = sinalEntrada[2];
			aux[5] = sinalEntrada[2];
			aux[4] = sinalEntrada[2];
			aux[3] = sinalEntrada[2];
			aux[2] = sinalEntrada[2];
			aux[1] = ~sinalEntrada[1];
			aux[0] = ~ sinalEntrada[0];
			sinalExtendido = 8'b00000001 + aux;
		end
		else begin
			sinalExtendido[7] = sinalEntrada[2];
			sinalExtendido[6] = sinalEntrada[2];
			sinalExtendido[5] = sinalEntrada[2];
			sinalExtendido[4] = sinalEntrada[2];
			sinalExtendido[3] = sinalEntrada[2];
			sinalExtendido[2] = sinalEntrada[2];
			sinalExtendido[1] = sinalEntrada[1];
			sinalExtendido[0] = sinalEntrada[0];
		end
	end

endmodule
