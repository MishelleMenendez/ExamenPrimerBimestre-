<%@ page import="com.green.negocio.*"%>
<%
String categoriaSeleccionada = request.getParameter("cmbCategoria");
int idCategoria = (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty())
        ? Integer.parseInt(categoriaSeleccionada)
        : 0;

categoria c = new categoria();
String nombreCategoria = c.obtenerNombreCategoria(idCategoria);

articulo a = new articulo();
String tabla = a.buscarArticuloCat(idCategoria);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuario</title>
<link rel="stylesheet" href="styles.css">
</head>
<link rel="web site icon" type="png" href="img/logo11.png">
<body>
	<header>
		<div>
			<nav>
				<ul>
					<li><img class="logo" src="img/logo11.png"></li>
					<li><a href="cerrarSesion.jsp">Cerrar Sesi�n</a></li>
				</ul>
			</nav>
		</div>
		<main class="center">
			<div class="container">
			<h2 class="negro">Bienvenido</h2>
					<div class="image-caption">
						En este apartado, podr�s leer en la categor�a <strong>"�xito"</strong>
						los casos de estudio de iniciativas empresariales exitosas que
						contribuyen a la protecci�n de ecosistemas terrestres. En la
						categor�a <strong>"Inversi�n"</strong>, podr�s leer
						informaci�n sobre inversiones y financiamiento para proyectos de
						conservaci�n y restauraci�n ambiental.
					</div>
				<h2 class="negro">Ver inversiones y casos de �xito</h2>
				<label class="negro" for="categoria">Seleccione la categor�a </label>
				<form method="post" action="menuInteresado.jsp" class="form-center">
					
					<%
						String opcCategoria = c.mostrarCategoria();
						out.println(opcCategoria);
					%>
					<button class = "botoncat" type="submit">Mostrar articulos</button>
				</form>
				<div class="articulos">
					<%=tabla%>
				</div>
			</div>
		</main>
	</header>
	<footer class="footer">
		<img src="img/footerleopardo.jpg" alt="Footer Leopardo" class="footer-img">
		<div class="footer-overlay">
			<p>&copy; 2024 Green Defenders. Todos los derechos reservados.</p>
		</div>
	</footer>
</body>
</html>
