<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%!AccountUtenteRegistrato_Bean utente = null;%>
<%!Prodotto_Bean piattoSelezionato = null;%>
<%
    utente = (AccountUtenteRegistrato_Bean) session.getAttribute("utente");
    piattoSelezionato = (Prodotto_Bean) session.getAttribute("prodottoSelezionato");
	if (utente==null || !utente.getTipo().equals(AccountUtenteRegistrato_Bean.Azienda) || piattoSelezionato == null) response.sendRedirect("Homepage.jsp");
%>
<!DOCTYPE html>
<html>

<head>
    <!--Viewport for toggle-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--Title-->
    <title>Modifica Prodotto</title>
    <!--Preset imports-->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <!--Custom imports-->
    <link rel="stylesheet" href="css/eat-reorder-style.css">
    <%@page import="model.bean.AccountUtenteRegistrato_Bean"%>
    <%@page import="model.bean.Prodotto_Bean"%>
</head>

<!--L'AZIENDA DEVE POSSEDERE IN SESSIONE UN PIATTO-->
<!--IL PIATTO SELEZIONATO PER LA MODIFICA DEVE TROVARSI SOTTO ATTRIBUTO "prodottoSelezionato"-->

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <!--DIV that contains the image and the searchbar-->
	<div class="center-block">
		<!--Form for the research-->
		<form class="custom-border-red generic-form-style" action="">
            <div class="registration-title">Modifica il piatto selezionato</div>
            <!--IMAGE ON THE HOME-->
            <img id="image-home" class="img-fluid d-block mx-auto"src="assets/img/LogomarcoIS%20PNG.png">
            <!--FORM INPUTS-->
            <input type="hidden" name="id" value="<%=piattoSelezionato.getCodice()%>">
			<input class="custom-border-red border-rounded-small form-control input-style-login"type="text"name="nome"placeholder="Nome del piatto" value="<%=piattoSelezionato.getNome()%>">
			<input class="custom-border-red border-rounded-small form-control input-style-login"type="text"name="prezzo"placeholder="Prezzo del piatto" value="<%=piattoSelezionato.getPrezzo().toString()%>">
            <input class="custom-border-red border-rounded-small form-control input-style-login"type="text"name="img_path"placeholder="URL dell'immagine da caricare" value="<%=piattoSelezionato.getImmagine().toString()%>">
            <textarea type="text"class="custom-border-red border-rounded-small form-control input-style-login"id="description"name="description"rows="3"placeholder="Descrizione del piatto"  value="<%=piattoSelezionato.getDescrizione()%>"></textarea>
            <button class="btn form-list-button bg-red border-rounded-small"type="submit">Conferma</button>
		</form>
	</div>
	<!-- SCRIPT -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>