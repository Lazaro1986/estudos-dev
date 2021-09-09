<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Exemplo 03 - JSP</title>
</head>
<body>

	<h1>Exemplo 04 - Testes com link</h1>

	Ao clicar no link vai para a página de processamento
	<br><br>

	<a href="exemplo04-exec.jsp?codigo=123">
		Clique aqui para fazer o processamento
	</a>
	<br><br>

	<%
	//aqui vai ter algo do JSP
	String bug = request.getParameter("bug");
	if(bug != null){
		if(bug.equals("true")){
		out.print("Código inválido");
		}
	}
	%>

</body>
</html>