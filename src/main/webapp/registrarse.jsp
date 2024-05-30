<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Registrarse </title>
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
	<main class="center">
		<div class="container1">
			<div class="register-box">
				<h2>¿Ya está registrado?</h2>
				<button class="botonsesion"
					onclick="window.location.href='login.jsp'">Iniciar
					sesión</button>
			</div>
			<div class="login-box">
				<h2>¿Quiere registrarse?</h2>
				<form action="verificaregistro.jsp" method="post">
					<label for="username">Nombrer de usuario:</label> <input
						type="text" id="username" name="username" required> <label
						for="email">Correo electronico:</label> <input type="email"
						id="email" name="email" required> <label for="password">Contraseña:</label>
					<input type="password" id="password" name="password" required>
					<button class="botonsesion" type="submit">Registrase </button>
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