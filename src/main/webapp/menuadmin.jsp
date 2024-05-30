<%@ page import="com.green.negocio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.green.seguridad.*"%>
<%
String usuario = "";
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) {
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
<title>Administrador</title>
<link rel="stylesheet" href="styles.css">
</head>
<link rel="web site icon" type="png" href="img/logo11.png">
<body>
	<header>
		<div>
			<nav>
				<ul>
					<li><img class="logo" src="img/logo11.png"></li>
					<li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
					<%
					pagina pag = new pagina();
					String menu = pag.mostrarMenu(perfil);
					out.print(menu);
					%>
				</ul>
			</nav>
			<main class="center">
			<section class ="container">
				<h2 class="negro">Bienvenido</h2>
				<div class="image-caption">
					Elige que <strong>"Publicar"</strong>
					o que <strong>"Elimnar"</strong>
				</div>
				<%
				articulo a = new articulo();
				String tabla = a.publicarArticulo();
				%>
				<div class="articulos">
					<%=tabla%>
				</div>
				</section>
			</main>
		</div>
	</header>
	<footer class="footer">
		<img src="img/footerleopardo.jpg" alt="Footer Leopardo"
			class="footer-img">
		<div class="footer-overlay">
			<p>&copy; 2024 Green Defenders. Todos los derechos reservados.</p>
		</div>
	</footer>
</body>
</html>