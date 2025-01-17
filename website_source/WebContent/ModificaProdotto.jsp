<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	Boolean canContinue = true;
	Prodotto_Bean piattoSelezionato = null;	
	AccountUtenteRegistrato_Bean utente = null;
    utente = (AccountUtenteRegistrato_Bean) session.getAttribute("utente");
    piattoSelezionato = (Prodotto_Bean) request.getAttribute("piattoSelezionato");
    if (utente == null || piattoSelezionato == null){
    	response.sendRedirect("Homepage.jsp");
    	canContinue = false;
    }
    if (utente != null && canContinue){
    	if (!utente.getTipo().equals(AccountUtenteRegistrato_Bean.Azienda)){
    		response.sendRedirect("Homepage.jsp");
        	canContinue = false;
    	}
    }
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
    <%
    	if (canContinue) {
    %>
	<div class="container-form-floating">
		<!--Form for the research-->
		<form method="POST" class="custom-border-red partial-container-form-floating login-form-style" action="DoModificaProdotto" onsubmit="return checkProdotto();">
            <div class="registration-title">Modifica il piatto selezionato</div>
            <!--IMAGE ON THE HOME-->
            <img id="image-home" class="img-fluid d-block mx-auto"src="assets/img/LogomarcoIS%20PNG.png">
            <!--FORM INPUTS-->
            <input type="hidden" name="id" value="<%=piattoSelezionato.getCodice()%>">
            <label class="std-label">Nome del piatto</label>
			<input class="custom-border-red border-rounded-small form-control input-style-login"id="nome"type="text"name="nome"placeholder="Nome del piatto" value="<%=piattoSelezionato.getNome()%>">
			<label class="std-label">Prezzo</label>
			<input class="custom-border-red border-rounded-small form-control input-style-login"id="prezzo"type="text"name="prezzo"placeholder="Prezzo del piatto" value="<%=piattoSelezionato.getPrezzo().toString().replace(".",",")%>">
            <label class="std-label">URL dell'immagine</label>
            <input class="custom-border-red border-rounded-small form-control input-style-login"id="img"type="text"name="img_path"placeholder="URL dell'immagine da caricare" value="<%=piattoSelezionato.getImmagine().toString()%>">
            <label class="std-label">Descrizione del piatto</label>
            <textarea class="custom-border-red border-rounded-small form-control input-style-login"id="description"name="descrizione"rows="3"placeholder="Descrizione del piatto"><%=piattoSelezionato.getDescrizione()%></textarea>
            <button class="btn form-list-button bg-red border-rounded-small"type="submit">Conferma</button>
		</form>
	</div>
	<%
    	}
	%>
	<!-- SCRIPT -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function checkProdotto() {
			var nome = document.getElementById("nome");
			var prezzo = document.getElementById("prezzo");
			var img = document.getElementById("img");
			var desc=document.getElementById("description");
			if (nome.value == ""||prezzo.value==""||img.value==""||desc.value == "") {
				alert("ATTENZIONE! Errore nella validazione dei campi!")
				return false;
			}
			return true;
		}
	</script>
	<%@include file="Footer.html"%>
</body>
</html>