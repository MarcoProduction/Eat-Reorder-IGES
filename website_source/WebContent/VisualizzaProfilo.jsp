<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%!AccountUtenteRegistrato_Bean utente = null;%>
<%
	Boolean canContinue = true;
	utente = (AccountUtenteRegistrato_Bean) session.getAttribute("utente");
	if (utente == null || utente.getTipo().equalsIgnoreCase(AccountUtenteRegistrato_Bean.Moderatore)) {
		response.sendRedirect("Homepage.jsp");
		canContinue = false;
	}
%>
<!DOCTYPE html>
<html>
<head>
<!--Viewport for toggle-->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--Title-->
<title>Profilo</title>
<!--Preset imports-->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--Custom imports-->
<link rel="stylesheet" href="css/eat-reorder-style.css">
<%@page import="model.bean.AccountUtenteRegistrato_Bean"%>
<%@page import="model.bean.AccountModeratore_Bean"%>
<%@page import="model.bean.AccountFattorino_Bean"%>
<%@page import="model.bean.AccountAzienda_Bean"%>
<%@page import="model.bean.AccountCliente_Bean"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Set"%>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		if (canContinue) {
	%>
	<!--Display info-->
	<%!AccountCliente_Bean utenteCliente = null;%>
	<%!AccountAzienda_Bean utenteAzienda = null;%>
	<%!AccountFattorino_Bean utenteFattorino = null;%>
	<div class="container-form-floating">
		<!-- CASE CLIENTE -->
		<%
			if (utente != null) {
				

				if (utente.getTipo().equals(AccountUtenteRegistrato_Bean.Cliente)) {
					utenteCliente = (AccountCliente_Bean) utente;
		%>
					<div class="registration-title">Benvenuto <%=utenteCliente.getNome()%></div>
		<%
				}
		%>
		<!-- CASE AZIENDA -->
		<%
				if (utente.getTipo().equals(AccountUtenteRegistrato_Bean.Azienda)) {
					utenteAzienda = (AccountAzienda_Bean) utente;
		%>
					<div class="registration-title">Benvenuto <%=utenteAzienda.getNome()%></div>
		<%
				}
		%>
		<!-- CASE FATTORINO -->
		<%
				if (utente.getTipo().equals(AccountUtenteRegistrato_Bean.Fattorino)) {
					utenteFattorino = (AccountFattorino_Bean) utente;
		%>
					<div class="registration-title">Benvenuto <%=utenteFattorino.getNome()%></div>
		<%
				}
		%>
		<%
			}
		%>
		<!--Image on the form-->
		<img id="image-home" class="img-fluid d-block mx-auto"
			src="assets/img/LogomarcoIS%20PNG.png">
		<!-- DISPLAYING DATAS -->
		<!-- CASE CLIENTE -->
		<%
			if (utenteCliente != null && utente.getTipo().equals(AccountUtenteRegistrato_Bean.Cliente)) {
		%>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;"> Nome: </span>
			<%=utenteCliente.getNome()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Cognome: </span>
			<%=utenteCliente.getCognome()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Email: </span>
			<%=utenteCliente.getEmail()%></div>
		<%
			}
		%>
		<!-- CASE AZIENDA -->
		<%
			if (utenteAzienda != null && utente.getTipo().equals(AccountUtenteRegistrato_Bean.Azienda)) {
		%>
		<div class="registration-description" >
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Nome:</span>
			<%=utenteAzienda.getNome()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Telefono:</span>
			<%=utenteAzienda.getTelefono()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Indirizzo:</span>
			<%=utenteAzienda.getVia()%>,
			<%=utenteAzienda.getNumeroCivico()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Citt&agrave:</span>
			<%=utenteAzienda.getCitta()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Provincia:</span>
			<%=utenteAzienda.getProvincia()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Partita IVA:</span>
			<%=utenteAzienda.getPartitaIva()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Email:</span>
			<%=utenteAzienda.getEmail()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Orari di apertura:</span>
			<%=utenteAzienda.getOrarioDiApertura().toString()%>
			-
			<%=utenteAzienda.getOrarioDiChiusura().toString()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Aperto nei giorni:</span>
			<%
			Set<DayOfWeek> days = utenteAzienda.getGiorniDiApertura();
				if (days.contains(DayOfWeek.MONDAY)) {
		%>
			Luned&igrave;
			<%
			}
				if (days.contains(DayOfWeek.TUESDAY)) {
		%>

			Marted&igrave;
			<%
			}
				if (days.contains(DayOfWeek.WEDNESDAY)) {
		%>

			Mercoled&igrave;
			<%
			}
				if (days.contains(DayOfWeek.THURSDAY)) {
		%>

			Gioved&igrave;
			<%
			}
				if (days.contains(DayOfWeek.FRIDAY)) {
		%>

			Venerd&igrave;
			<%
			}
				if (days.contains(DayOfWeek.SATURDAY)) {
		%>

			Sabato
			<%
			}
				if (days.contains(DayOfWeek.SUNDAY)) {
		%>

			Domenica

			<%
			}
		%>
		</div>
		<%
			}
		%>
		<!-- CASE FATTORINO -->
		<%
			if (utenteFattorino != null && utente.getTipo().equals(AccountUtenteRegistrato_Bean.Fattorino)) {
		%>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Nome: </span>
			<%=utenteFattorino.getNome()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Cognome: </span>
			<%=utenteFattorino.getCognome()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Telefono: </span>
			<%=utenteFattorino.getTelefono()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Citt&agrave: </span>
			<%=utenteFattorino.getCittaConsegna()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Provincia: </span>
			<%=utenteFattorino.getProvinciaConsegna()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Email: </span>
			<%=utenteFattorino.getEmail()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Orari di consegna: </span>
			<%=utenteFattorino.getInizioConsegne().toString()%>
			-
			<%=utenteFattorino.getFineConsegne().toString()%></div>
		<div class="registration-description">
			<span style="text-shadow: 1px 0px 1px #2e2b2b, 0px 1px 1px #2e2b2b, 2px 1px 1px #2e2b2b, 1px 2px 1px #2e2b2b, 3px 2px 1px #2e2b2b, 2px 3px 1px #2e2b2b, 4px 3px 1px #2e2b2b, 3px 4px 1px #2e2b2b, 5px 4px 1px #2e2b2b, 4px 5px 1px #2e2b2b, 6px 5px 1px #2e2b2b, 5px 6px 1px #2e2b2b, 7px 6px 1px #2e2b2b;">Disponibile nei giorni: </span>
			<%
			Set<DayOfWeek> days = utenteFattorino.getGiorniDiConsegna();
				if (days.contains(DayOfWeek.MONDAY)) {
		%>
			Luned&igrave;
			<%
			}
				if (days.contains(DayOfWeek.TUESDAY)) {
		%>

			Marted&igrave;
			<%
			}
				if (days.contains(DayOfWeek.WEDNESDAY)) {
		%>

			Mercoled&igrave;
			<%
			}
				if (days.contains(DayOfWeek.THURSDAY)) {
		%>

			Gioved&igrave;
			<%
			}
				if (days.contains(DayOfWeek.FRIDAY)) {
		%>

			Venerd&igrave;
			<%
			}
				if (days.contains(DayOfWeek.SATURDAY)) {
		%>

			Sabato
			<%
			}
				if (days.contains(DayOfWeek.SUNDAY)) {
		%>

			Domenica

			<%
			}
		%>
		</div>
		<%
			}
		%>
	</div>
	
	<%
		}
	%>
	
	<!-- Script -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<%@include file="Footer.html"%>
</body>
</html>
