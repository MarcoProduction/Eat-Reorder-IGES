<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<!--Viewport for toggle-->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--Title-->
<title>Login</title>
<!--Preset imports-->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/footer.css">
<!--Custom imports-->
<link rel="stylesheet" href="css/eat-reorder-style.css">
</head>

<body>
	<!--HEADER-->
	<nav
		class="navbar navbar-dark navbar-expand-md navigation-clean-button custom-border-red bg-yellow">
		<div class="container">
			<!--Logo-->
			<a id="er-logo" class="navbar-brand custom-text-centered" href="Homepage.jsp">Eat&amp;Reorder</a>
		</div>
	</nav>

	<!--Form for login-->
	<div class="alternative-background container-form-floating">
		<form class="custom-border-red login-form-style" method="post"
			action="LoginServlet">
			<!--Invisible title-->
			<h2 class="sr-only">Login Form</h2>
			<!--Image on the form-->
			<img id="image-login-form" src="assets/img/LogomarcoIS%20PNG.png">
			<!--Form group that contains fields and confirm button-->
			<div class="form-group">
				<input
					class="custom-border-red border-rounded-small form-control input-style-login"
					type="email" name="email" placeholder="Email"> <input
					class="custom-border-red border-rounded-small form-control input-style-login"
					type="password" name="password" placeholder="Password">
				<button class="btn form-list-button bg-red border-rounded-small"
					type="submit">Accedi</button>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>