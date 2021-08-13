module instruMemoria(linha, clock, instrucao);
	input [7:0] linha;
	input clock;
	output reg [7:0] instrucao;
	
	reg [7:0] linhas [15:0];
	
	initial begin
		$readmemb("banco-memoria.dat", linhas);
		
		$display("Lendo o banco de memoria");
		$monitor("endereço = %b		instrucao = %b", linha, linhas[linha]);	
	end
	
	always @(posedge clock or negedge clock) begin
		instrucao = linhas[linha];
	end
endmodule