
module Controle(comando, clock , J, Br, Tr, Sr, MuxAdd, MuxReg2, ULA, MuxSaidaJ, Memoria, MuxSaidaUla);

	input [3:0] comando;
	input clock;
	output reg J, Br, Tr, Sr, MuxAdd, MuxReg2, MuxSaidaJ, Memoria, MuxSaidaUla;
	output reg [1:0] ULA;

	reg bit7 , bit6 , bit, bit4; 
	assign  bit7 = comando[3];
	assign  bit6 = comando[2];
	assign  bit5 = comando[1];
	assign  bit4 = comando[0];

	initial begin
		assign J = 0;
		assign Br = 0;
		assign Tr = 0;
		assign Sr = 0;
		assign MuxAdd = 0;
		assign MuxReg2 = 0;
		ULA[1] = 0;
		ULA[0] = 0;
		assign MuxSaidaJ = 0;
		assign Memoria = 0;
		
		$display("Sinais de controle");
		$monitor("comando = %b, J = %b, Br = %b, Tr = %b, Sr = %b, MuxAdd = %b, MuxReg2 = %b, Ula = %b, MuxSaidaJ = %b, Memoria = %b", comando, J, Br, Tr, Sr, MuxAdd, MuxReg2, ULA, MuxSaidaJ, Memoria);
	end

	always @(posedge clock or negedge clock) begin
		assign J = bit7 && ~bit6 && ~bit5;
		assign Br = bit7 && bit6 && bit5;
		assign Tr = ~bit7 && ~bit6 && ~bit5 && bit4 || ~bit7 && ~bit6 && bit5 || bit7 && ~bit6 && bit5 || ~bit7 && bit6 && ~bit5 || bit7 && bit6 && bit5;
		assign Sr = ~bit7 && ~bit6 && ~bit5 && ~bit4 || bit7 && ~bit6 && bit5 || ~bit7 && bit6 && ~bit5;
		assign MuxAdd = ~bit7 && ~bit6 && ~bit5 && ~bit4;
		assign MuxReg2 = (bit7 && bit6 || ~bit7 && ~bit6) && bit5;
		ULA[1] = bit6 && bit5;
		ULA[0] = ~bit7 && (~bit6 && bit5 || bit6 && ~bit5) || bit7;
		assign MuxSaidaJ = bit7 && bit6 && ~bit5;
		assign Memoria = ~bit7 && bit6 && ~bit5;
		assign MuxSaidaUla = ~bit7 && ~bit6 || bit6 && bit5;
		end
endmodule
