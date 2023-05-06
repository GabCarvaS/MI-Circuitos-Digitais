/*
	Estrutura de um módulo que realiza a soma ou subtração de três numeros de um bit
*/
module full_adder (input1,input2, carry_in,sum,carry_out);

input input1, input2, carry_in; 
output sum, carry_out;

// Variáveis intermediárias
wire xor1,and1,and2;

// Operações utilizando o módulo half_adder
half_adder ha1 (input1,input2,xor1,and1);
half_adder ha2 (carry_in,xor1,sum,and2);
or (carry_out, and2,and1);

endmodule 