module DadoMemoria(sinal, clock, endereco, dado, retorno);
	input sinal, clock;
	input [7:0] endereco, dado;
	output reg [7:0] retorno;
	
	reg [7:0]memoria[17:0];
	
	initial begin
		$readmemb("dado-memoria.dat", memoria);
		$display("memoria de dados");
		$monitor("reposta = %b", retorno);
	end

	always @(posedge clock or negedge clock) begin
		if(clock) begin //escrita
			if(sinal) begin
				memoria[endereco] = dado;
			end 
		end
		$writememb("dado-memoria.dat",memoria);
		if(~clock) begin	//leitura
			retorno = memoria[endereco];
		end
	end

endmodule