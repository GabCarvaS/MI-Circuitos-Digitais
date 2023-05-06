// Gabriel Araújo Carvalho dos Santos - 18211230
// senha => senha cadastrada
// tentativa => input usuario 
// res_sub => resultado da subtração => senha - tentativa 
// aeqb -> res_sub = 3 -> led verde
// agtb -> res_sub > 3 -> led vermelho 
// altb -> res_sub < 3 -> led verde
// dif_max_senha => limte max de diferença => 3
// d => display

module main (senha,tentativa,carry_out,res_sub,aeqb,agtb,altb,d,maior,menor,igual);

	input [3:0]senha,tentativa;
	assign carry_in = 1;

	wire [3:0]dif_max_senha;

	assign dif_max_senha[0] = 1;
	assign dif_max_senha[1] = 1;
	assign dif_max_senha[2] = 0;
	assign dif_max_senha[3] = 0;

	output [3:0]res_sub;
	output carry_out,aeqb,agtb,altb,maior,menor,igual;
	output [6:0]d;
	
	
	fourbit_addersub fb (senha,tentativa,carry_in,res_sub,carry_out);// subtrai a senha da tentativa
	//erro para resultados negativos
	compmag c1 (res_sub,dif_max_senha,aeqb,agtb,altb); // compara o resultado da subtração com o valor maximo da diferença
	compmag c2 (senha,tentativa,igual,maior,menor); // compara o resultado da subtração com o valor maximo da diferença					
	decod7 dec (res_sub,d); 
									
endmodule 