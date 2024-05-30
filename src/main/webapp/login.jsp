<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar sesión</title>
<link rel="stylesheet" href="styles.css">
</head>
<link rel="web site icon" type="png" href="img/logo11.png">
<body>
<header>
	<div >
		<nav>
			<ul>
				<li><img class="logo" src="img/logo11.png"></li>
				<li><a href="home.jsp">Home</a></li>
			</ul>
		</nav>
	</div>
	</header>
	<main class="center">
		<div class="container1">
			<div class="login-box">
				<h2>Iniciar sesión</h2>
				<form action="validar.jsp" method="post">
					<label for="email">Correo:</label> <input type="email"
						id="email" name="email" required> <label
						for="password">Contraseña:</label> <input type="password"
						id="password" name="password" required>
					<button class="botonsesion" type="submit">Iniciar sesión</button>
				</form>
			</div>
			<div class="register-box">
				<h2>¿Quiere registrarse?</h2>
				<button class="botonsesion"
					onclick="window.location.href='registrarse.jsp'">Registrarse</button>
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