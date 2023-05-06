/*
	Estrutura de um módulo que realiza tanto a adição quanto a subtração de dois números de quatro bits
*/
module fourbit_addersub (input1,input2,carry_in,sum,carry_out);

input [3:0] input1,input2; // Dois numeros de quatro bits 
output [3:0] sum; // Resultado final
output carry_out; // vai um
input carry_in; // carry_in = 0 -> soma | carry_in = 1 -> subtrai

// Variáveis intermediárias
wire a1,a2,a3,b0,b1,b2,b3;

// Operações utilizando o módulo full_adder e a porta xor
xor xora (b0,carry_in,input2[0]);

full_adder fa1 (input1[0],b0,carry_in,sum[0],a1);
xor xorb (b1,carry_in,input2[1]);

full_adder fa2 (input1[1],b1,a1,sum[1],a2);
xor xorc (b2,carry_in,input2[2]);

full_adder fa3 (input1[2],b2,a2,sum[2],a3);
xor xord (b3,carry_in,input2[3]);

full_adder fa4 (input1[3],b3,a3,sum[3],carry_out);

endmodule 