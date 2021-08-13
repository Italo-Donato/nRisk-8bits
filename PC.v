module PC(clock, proxSinal, atualSinal);
	input clock;
	input [7:0] proxSinal;
	reg [7:0] durante;
	output reg [7:0] atualSinal;

	initial begin
		atualSinal = 0;
		
		$display("Program Counter");
		$monitor("entrada = %b, sinal = %b",proxSinal, atualSinal);
	end

	always @(posedge clock or negedge clock) begin //posedge = leitura, negedge = escrita
		if(clock) begin
			durante = proxSinal;//leitura
		end
		if(~clock) begin
			atualSinal = durante;//escrita
		end
	end
endmodule
