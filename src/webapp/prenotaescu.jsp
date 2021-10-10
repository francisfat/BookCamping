<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>


	<head>
		<title>BookCamping: Prenota Escursione</title>
		<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="style.css" rel="stylesheet">
		<link rel="shortcut icon" href="immagini/aa.ico" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
	<body>
			<%
					String user = null;
				if(session.getAttribute("user") == null)
					response.sendRedirect("login.jsp");
				else
					user = (String) session.getAttribute("user");
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
			            <li><a class="dropdown-item" href="#top">Prenota escursione</a></li>
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
				
				<div class="row justify-content-md-center">
					<div class="col-md-auto ">
						<h3>Scegli l'<b>escursione</b> giusta per te!</h3>
					</div>
				</div>
				<br><hr>	
				<div class="row">
					<div class="col-sm-4">
						<img src="immagini/cavalli.jpg" class="img-fluid" alt="...">
					</div>	
					<div class="col-sm-8">
						<h4> Escursioni a cavallo </h4><br>
						Saranno organizzate delle fantastiche escursioni a cavallo ogni giorno. Sarai guidato da un professionista
						 che ti consentirà di visitare tutto ciò che c'è di bello nella natura incontaminata delle montagne dell'Abruzzo.
						 É una giusta opzione anche per i bambini che vorranno intraprendere la stessa esperienza su degli adorabili pony.

						<div class="row justify-content-md-center">
							<div class="col-md-auto ">
							<br><br><a href="redprenotacaval">Prenota ora</a><br><br>
							</div>
						</div>	
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-sm-8">
						<h4> Trekking guidato </h4><br>
						Un'esperienza come quella del trekking potrebbe darti la giusta carica per affrontare la vita di tutti i giorni. Sarai guidato, anche in questo caso 
						da un professionista che ti consentirà di camminare per chilometri nella natura incontaminata delle montagne dell'Abruzzo 
						 attraversando fiumi, montagne e vaste praterie.
						 
						<div class="row justify-content-md-center">
							<div class="col-md-auto ">
							<br><br><a href="redprenotatrek">Prenota ora</a><br><br>
							</div>
						</div>
					</div>	
					<div class="col-sm-4">
						<img src="immagini/treking.jpg" class="img-fluid" alt="...">
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