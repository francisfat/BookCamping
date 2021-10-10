<%@page import="model.Utente"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

	<head>
		<title>BookCamping: Pagamento</title>
			<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="style.css" rel="stylesheet">
			<link rel="shortcut icon" href="immagini/aa.ico" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
	<body>
	
			<%
				@SuppressWarnings("unchecked")
				ArrayList<Utente> listut = (ArrayList<Utente>) session.getAttribute("ut");
			%>
				
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
				<hr><br><br>	
				<div class="row justify-content-md-center">
					<div class="col-md-auto ">
						<h3> Informazioni sul tuo profilo</h3>
					</div>
				</div>
				<hr>				
				<div class="row">
					<div class="col-sm-8">
					<h4> Anagrafica </h4><br>
						Username: ${user}<br>
						Nome: ${listut.get(0).getNome()}<br>
						Cognome: ${listut.get(0).getCognome()}<br>
						Data di Nascita: ${listut.get(0).getNascita()}<br>
					<br><h4> Contatti e residenza </h4><br>
						Cellulare: ${listut.get(0).getCellulare()}<br>
						E-mail: ${listut.get(0).getEmail()}<br>
						Indirizzo: ${listut.get(0).getIndirizzo()}<br>
						Città: ${listut.get(0).getCittà()}<br>
						Paese: ${listut.get(0).getPaese()}<br>
						CAP: ${listut.get(0).getCAP()}<br>
					</div>
					<div class="col-sm-4">
						<img alt="..." src="immagini/profilo.png" class="d-block w-50"><br>
					</div>
				</div>
				<hr>
				<div class="row justify-content-md-center">
						<div class="col-md-auto "> <span style="font-size:12px">
							Per maggiori informazioni o per evetuali problemi in caso di prenotazioni o registrazioni, 
							rivolgersi direttamente al numero <b>390 7808902</b> oppure contattare
							il seguente indirizzo e-mail: <b>bookcampingabruzzo@gmail.com</b>.
							</span>
							<br><br><br>
						</div>
				</div>
						
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>
			</div>	
	</body>

</html>