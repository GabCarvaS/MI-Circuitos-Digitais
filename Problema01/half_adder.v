/*
	Estrutura de um módulo que realiza a soma ou subtração de dois numeros de um bit
*/
module half_adder (input1, input2, sum, carry);

input input1, input2;
output sum, carry;

xor xor1 (sum,input1,input2);
and and1 (carry,input1,input2);

endmodule 