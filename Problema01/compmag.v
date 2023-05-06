// Módulo comparador de magnitude para numeros de quatro bits
// aeqb => a=b 
// agtb => a>b
// altb => a<b

module compmag (a,b,aeqb,agtb,altb);
	input [3:0] a, b; //Entradas de 4 bits
	output aeqb,agtb,altb;
	
	// Variáveis Intermediarias
	wire x0,x1,x2,x3;
	
	assign x3 = ~(a[3] ^ b[3]); //x3 = a[3] xnor b[3]
	assign x2 = ~(a[2] ^ b[2]); //x2 = a[2] xnor b[2]
	assign x1 = ~(a[1] ^ b[1]); //x1 = a[1] xnor b[1]
	assign x0 = ~(a[0] ^ b[0]); //x0 = a[0] xnor b[0]
	
	//Compara os valores
	assign aeqb = x3 & x2 & x1 & x0;		
	assign agtb = a[3] & (~b[3]) | x3 & a[2] & (~b[2]) | x3 & x2 & a[1] & (~b[1]) | x3 & x2 & x1 & a[0] & (~b[0]);
	assign altb = (~a[3]) & b[3] | x3 & (~a[2]) & b[2] | x3 & x2 & (~a[1]) & b[1] | x3 & x2 & x1 & (~a[0]) & b[0];
	
endmodule  