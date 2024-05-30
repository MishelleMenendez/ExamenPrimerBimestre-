<%@ page import="com.green.negocio.*"%>
<%@ page import="java.util.*"%>
<%
String usuario = "";
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
{
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
usuario = (String) sesion.getAttribute("usuario"); //Se devuelve los valores de atributos

}
int perfil = (Integer) sesion.getAttribute("perfil");
if (perfil != 2) {
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
}
%>
<!DOCTYPE html>
<%
String categoriaSeleccionada = request.getParameter("cmbCategoria");
int idCategoria = (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty())
		? Integer.parseInt(categoriaSeleccionada)
		: 0;
categoria c = new categoria();
String nombreCategoria = c.obtenerNombreCategoria(idCategoria);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Empresa</title>
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
				</ul>
			</nav>
			<main class="center">
				<section class="container">
					<h2 class="negro">Bienvenido</h2>
					<div class="image-caption">
						En este apartado, podrás publicar en la categoría <strong>"Éxito"</strong>
						los casos de estudio de iniciativas empresariales exitosas que
						contribuyen a la protección de ecosistemas terrestres. En la
						categoría <strong>"Inversión"</strong>, podrás publicar
						información sobre inversiones y financiamiento para proyectos de
						conservación y restauración ambiental.
					</div>
					<form action="agregarArt.jsp" method="post">
						<div>
							<h2 class="negro">Publicar artículos</h2>
							<%
							String opcCategoria = c.mostrarCategoria();
							out.println(opcCategoria);
							%>
							<h2 class="negro">
								<%=nombreCategoria%></h2>
							<label class="negro" for="articulo">Ingresar artículo:</label>
							<textarea id="articulo" name="articulo" class="big-textarea"
								required></textarea>
						</div>
						<button class="botoncat" type="submit" style="margin-top: 10px;">Añadir
							Artículo</button>

					</form>
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
