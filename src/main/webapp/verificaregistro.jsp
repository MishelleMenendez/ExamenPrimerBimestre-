<!DOCTYPE html>
<%@ page import="com.green.seguridad.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Verificar</title>
<link rel="stylesheet" href="styles.css">
</head>
<link rel="web site icon" type="png" href="img/logo11.png">
<body>
	<header>
		<div>
			<nav>
				<ul>
					<li><img class="logo" src="img/logo11.png"></li>
					<li><a href="home.jsp">Home</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<section>
		<article class="espacio">
			<%
			String nombre = request.getParameter("username");
			String correo = request.getParameter("email");
			String clave = request.getParameter("password");
			int id_per = 3;
			String id_perParam = request.getParameter("id_per");
			if (id_perParam != null && !id_perParam.isEmpty()) {
				id_per = Integer.parseInt(id_perParam);
			}

			usuario u = new usuario(id_per, nombre, correo, clave);
			String resultado = u.ingresarCliente();
			%>
			<p>
				Su nombre es:
				<%=nombre%></p> <br>
			<p>
			<p>
				Su correo electrónico es:
				<%=correo%></p><br>

			<p>
				Resultado:
				<%=resultado%></p><br>
		</article>
	</section>
	<footer class="footer">
		<img src="img/footerleopardo.jpg" alt="Footer Leopardo"
			class="footer-img">
		<div class="footer-overlay">
			<p>&copy; 2024 Green Defenders. Todos los derechos reservados.</p>
		</div>
	</footer>
</body>
</html>