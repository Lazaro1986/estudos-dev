<!DOCTYPE html>
<html>
<head>
	<title>Exemplo 05 (form)</title>
</head>
<body>

	<h1>Exemplo 5 - Formulario</h1>

	<form action="exemplo05-exec.jsp" method="post">
		informe um numero inteiro: <br>
		<input type="number" name="num1">
		<br><br>

		informe outro numero inteiro: <br>
		<input type="number" name="num2">
		<br><br>

		<button name="env">Calcular</button>
	</form>

	<%
	String bug = request.getParameter("bug");
	if(bug != null){
		if(bug.equals("true")){
			out.print("Informe os dados pelo formularo");
		}
	}
	%>


</body>
</html>