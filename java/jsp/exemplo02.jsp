<!DOCTYPE html>
<html>
<head>
	<title>Exemplo 02 - JSP</title>
</head>
<body>

	<h1>Exemplo 02 - Java Server Pages</h1>

	<%
	//a estrutura básica do java permanece funcionando aqui
	//declaração de variáveis, tipos de dados, seleção, repetição, etc
	int ini = 123;
	int fim = 234;
	int soma = 0;
	int cont = 0;
	String result = "";

	for(int i=ini; i<=fim; i++){
		if(i % 2 == 0){
			result = result + i + " - ";
			soma = soma + i;
			cont ++;
		}
	}

	//mostra o resultado:
	out.print(result + "<br>");
	out.print("Quantidade de números pares: " + cont + "<br>");
	out.print("Soma dos números pares: " + soma + "<br>");

	%>

</body>
</html>