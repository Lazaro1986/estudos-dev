<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Exemplo 03 - JSP</title>
</head>
<body>

	<h1>Exemplo 03 - Java Server Pages</h1>

	- Testes enviando parâmetros para o servidor (GET / POST)
	<br><br>

	<%
		String msg = "";

		try{
			//recebe o parametro enviado pela URL
			String sida = request.getParameter("idade");
			//converter a "String" com a idade para um número inteiro
			int iida = Integer.parseInt(sida);
			//processamento
			if(iida >= 18){
				msg = "Ok, tudo certo";
			}
			else{
				msg = "Não pode acessar";
			}
		}
		catch(NumberFormatException ne){
			msg = "BUG convertendo a idade: " + ne.getMessage();
		}
		catch(Exception e){
			msg = "BUG geral: " + e.getMessage();
		}

		//mostrando a mensagem
		out.print(msg);

	%>

</body>
</html>