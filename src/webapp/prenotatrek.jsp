<%@page import="java.util.*"%>
<%@page import="model.Escursione"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>BookCamping: Prenotazione Trekking</title>
		<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="style.css" rel="stylesheet">
		<link rel="shortcut icon" href="immagini/aa.ico" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>

	<body>
	
		<form class="form-signin" action="${pageContext.request.contextPath}/profile" method="POST" >
			<input type="hidden" class="form-control"  name="username" value=${ user} />
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar fixed-top">
			  <div class="container">
			    <a class="navbar-brand" href="redhome">bookCamping</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="redhome">Home</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Prenotazioni 
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
			          	<li><a class="dropdown-item" href="redprenotacamp" >Prenota area Campeggio</a></li>
			            <li><a class="dropdown-item" href="redprenotaesc">Prenota escursione</a></li>
			          </ul>
			        </li>
			          <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            ${user}
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown1">
			            <li><input class="dropdown-item" value="Profilo" type="submit" ></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Log-out</a>
			          </ul>
			        </li>
			      </ul>		      
			    </div>
			  </div>
			</nav>			  
		</form>
		
		<div class="container">
		<br><br><br>
		<%
					String alert = (String) session.getAttribute("alert");
					@SuppressWarnings("unchecked")
					ArrayList<Escursione> ut = (ArrayList<Escursione>) session.getAttribute("list");
		
					if(alert == "1"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! La data dell'escursione deve essere successiva alla data odierna!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "3"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! Campi obligatori non inseriti!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "4"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! Cellulare non valido.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "5"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! E-mail non valida!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }
					alert = "0";
		%>
			<div class="row justify-content-md-center">
				<div class="col-md-auto ">
				<br>
					<h3>Richiesta di prenotazione Trekking</h3>
					* i campi contrassegnati dall'asterisco sono obbligatori<br><br>
					
				</div>
			</div>
			
			<form class="form-signin " action="${pageContext.request.contextPath}/prenotaesc" method="POST" >	
			<hr>
			<div class="row">
				<div class="col-sm-4">
					<br>
					<img src="immagini/treking.jpg" class="img-fluid" alt="..."><br><br>
				</div>
				<div class="col-sm-4">
					<h4> Trekking guidato </h4><br>
					L'escursioni di trekking si tengono ogni giorno: partono alle <b> ${list.get(0).getOraInizio() }</b> di mattina
					 e terminano alle <b> ${list.get(0).getOraFine() }</b>. 
					Un'esperienza come quella del trekking potrebbe darti la giusta carica per affrontare la vita di tutti i giorni. Sarai guidato, anche in questo caso 
					da un professionista che ti consentirà di camminare per chilometri nella natura incontaminata delle montagne dell'Abruzzo 
					 attraversando fiumi, montagne e vaste praterie.
					 <br>Guida: <i>  ${list.get(0).getGuida() }  </i>
					 <br>Partenza: <i>  ${list.get(0).getPartenza() }  </i>
					 <br>Durata: <b> ${list.get(0).getDurata() }</b>
					 <br>Prezzo: <b> ${list.get(0).getPrezzo() } euro a persona</b>
				</div>	
				<div class="col-sm-4">
					<br>
					<b>Dati prenotazione</b><br><br>
					*Giorno:  <br><input name="giorno" type="date"><br><br>
					*n° persone: <select name="numeropersone"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option></select>
					<input type="hidden" class="form-control"  name="tipo_esc" value="2" />
					<input type="hidden" class="form-control"  name="username" value=${ user} />
					<br><br><input type="submit" value="Clicca qui per richiedere la disponibilità"><br><br>
					<span style="font-size:12px">Ogni richiesta è subordinata alla conferma del Camping. </span><br><br>
				</div>
				
			</div>
			</form>	
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>
				
			</div>			
		<hr>	
	</body>
</html>