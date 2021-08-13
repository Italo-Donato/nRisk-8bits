module Add(num1, num2, soma);
	input [7:0] num1, num2;
	output reg [7:0] soma;
	
	
	 initial begin
        $display("Testando somador");
        $monitor(" num1 = %b   num2 = %b  soma = %b ", num1, num2, soma);
        end
	
   always @ (*)
     soma = num1 + num2;
endmodule
