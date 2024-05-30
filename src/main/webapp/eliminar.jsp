<!DOCTYPE html>
<%@ page import="com.green.negocio.*"%>
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
			int cod = Integer.parseInt(request.getParameter("cod"));
			articulo a = new articulo();
			boolean f = a.eliminarArticulo(cod);
			if (f == true) {
			%>
			<p>El articulo se ha eliminado.</p>
			<%
			} else {
			%>
			<p>El articulo no se ha eliminado.</p>
			<%
			}
			%>
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