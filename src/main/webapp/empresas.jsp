<%@ page import="com.green.negocio.*"%>
<%@ page import="java.util.*"%>
<%
String usuario = "";
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) 
{
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
usuario = (String) sesion.getAttribute("usuario"); 

}
int perfil = (Integer) sesion.getAttribute("perfil");
if (perfil != 1) {
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrarse</title>
<link rel="stylesheet" href="styles.css">
</head>
<link rel="web site icon" type="png" href="img/logo11.png">
<body>
	<header>
		<div>
			<nav>
				<ul>
					<li><img class="logo" src="img/logo11.png"></li>
					<li><a href="menuadmin.jsp">Atrás</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<main class="center">
		<div class="container1">

			<div class="login-box">
				<h2>¿Quiere registrarse?</h2>
				<form action="verificarempresas.jsp" method="post">
					<label for="username">Nombre de la empresa:</label> <input
						type="text" id="username" name="username" required> <label
						for="email">Correo electronico:</label> <input type="email"
						id="email" name="email" required> <label for="password">Contraseña:</label>
					<input type="password" id="password" name="password" required>
					<button class="botonsesion" type="submit">Registrase</button>
				</form>
			</div>

		</div>
	</main>
	<footer class="footer">
		<img src="img/footerleopardo.jpg" alt="Footer Leopardo"
			class="footer-img">
		<div class="footer-overlay">
			<p>&copy; 2024 Green Defenders. Todos los derechos reservados.</p>
		</div>
	</footer>
</body>
</html>