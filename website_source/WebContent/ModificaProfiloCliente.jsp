<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%!AccountUtenteRegistrato_Bean utente = null;%>
<%
	utente = (AccountUtenteRegistrato_Bean) session.getAttribute("utente");
	if (utente == null || !utente.getTipo().equals(AccountUtenteRegistrato_Bean.Cliente))
		response.sendRedirect("Homepage.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<!--Viewport for toggle-->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--Title-->
<title>Modifica Profilo</title>
<!--Preset imports-->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
<!--Custom imports-->
<link rel="stylesheet" href="css/eat-reorder-style.css">
<%@page import="model.bean.AccountUtenteRegistrato_Bean"%>
</head>
<jsp:include page="header.jsp"></jsp:include>
<!--Start of body-->
<body>
	<!--Form for registration-->
	<div class="container-form-floating">
		<form class="custom-border-red login-form-style" method="post">
			<div class="registration-title">Modifica il tuo profilo</div>
			<div class="registration-description">Saranno modificati solo i
				campi inseriti</div>
			<!--Image on the form-->
			<img id="image-login-form" src="assets/img/LogomarcoIS%20PNG.png">
			<!--Form group that contains fields and confirm button-->
			<div class="form-group">
				<input
					class="custom-border-red border-rounded-small form-control input-style-login"
					type="nome" name="nome" placeholder="Nome"
					pattern="[a-zA-Z ‘àèìòù]{3,20}"> <input
					class="custom-border-red border-rounded-small form-control input-style-login"
					type="cognome" name="cognome" placeholder="Cognome"
					pattern="[a-zA-Z ‘àèìòù]{3,20}"> <input
					class="custom-border-red border-rounded-small form-control input-style-login"
					type="password" name="password" placeholder="Password"
					id="password" pattern="[a-zA-Z0-9]{7,20}">
				<button class="btn form-list-button bg-red border-rounded-small"
					type="submit">Modifica</button>
			</div>
		</form>
	</div>
	<!-- SCRIPT -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>