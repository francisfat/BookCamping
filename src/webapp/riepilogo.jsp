<%@page import="model.Utente"%>
<%@page import="java.util.*"%>
<%@page import="model.PrenotazioneEscursione"%>
<%@page import="model.PrenotazionePiazzola"%>
<%@page import="model.Campeggio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

	<head>
		<title>BookCamping: Riepilogo Prenotazione</title>
			<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="style.css" rel="stylesheet">
			<link rel="shortcut icon" href="immagini/aa.ico" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
	<body>
	
			<%
				String user = (String) session.getAttribute("user");
				@SuppressWarnings("unchecked")
				ArrayList<Utente> ut = (ArrayList<Utente>) session.getAttribute("ut");
				PrenotazionePiazzola pren = (PrenotazionePiazzola) session.getAttribute("pren");
				PrenotazioneEscursione pren1 = (PrenotazioneEscursione) session.getAttribute("pren1");
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
						<h3> Riepilogo Prenotazione</h3>
					</div>
				</div>
				<hr>				
				<div class="row justify-content-md-center">
					<div class="col-md-auto">
						<div class="card" style="width: 30rem;">
						  <div class="card-body">
						    <h5 class="card-title">Dettagli Prenotazione</h5>
						<%
							if (pren1 == null){
						%>
							    <p class="card-text">
							<%
								if(pren.getId_piazzola() <= 3){
							%>
									Tipologia Piazzola:<b> Tenda Small</b><br>
							<%
								}
								if(pren.getId_piazzola() > 3 && pren.getId_piazzola() <= 6){
							%>
									Tipologia Piazzola:<b> Tenda Large</b><br>
							<%
								}
								if(pren.getId_piazzola()==7 || pren.getId_piazzola() ==8 ){
							%>
									Tipologia Piazzola:<b> Roulotte</b><br>
							<%
								}
								if(pren.getId_piazzola()==9 || pren.getId_piazzola()==10){
							%>
									Tipologia Piazzola:<b> Camper</b><br>
							<%
								}
							%>  
									Prezzo:<b> ${pren.getCostoTotale()} euro</b><br>
									Arrivo:<b> ${pren.getCheckin()}</b><br>
									Partenza:<b> ${pren.getCheckout()}</b><br>
									Numero Adulti:<b> ${pren.getNumAdulti()}</b><br>
									Numero Bambini:<b> ${pren.getNumBambini()}</b><br>	
									Corrente:<b> ${pren.getCorrente()}</b><br>
									Posto Auto:<b> ${pren.getPostoAuto()}</b><br>
									Posto Moto:<b> ${pren.getPostoMoto()}</b><br>
									Note:<b> ${pren.getNote()}</b><br>
								</p>
						<%
							}else{					
						%>
								<p class="card-text">
							<%
								if(pren1.getId_escursione()==1){
							%>
									Tipologia:<b> Escursione a cavallo</b><br>
							<%
								}else{
							%>
									Tipologia:<b> Trekking guidato</b><br>
							<%
								}
							%>
									Prezzo:<b> ${pren1.getCostoTotale()} euro</b><br>
									Data:<b> ${pren1.getData()}</b><br>
									Numero Persone:<b> ${pren1.getNumPersone()}</b><br>
								</p>
						<%						
							}
						%>
							<h5 class="card-title">Anagrafica Acquirente</h5>
						    <p class="card-text">
								Username:<b> ${user}</b><br>
								Nome:<b> ${ut.get(0).getNome()}</b><br>
								Cognome:<b> ${ut.get(0).getCognome()}</b><br>
								Data di Nascita:<b> ${ut.get(0).getNascita()}</b><br>
							</p>
							<h5 class="card-title"> Contatti e residenza </h5>
							<p class="card-text">
								Cellulare:<b> ${ut.get(0).getCellulare()}</b><br>
								E-mail:<b> ${ut.get(0).getEmail()}</b><br>
								Indirizzo:<b> ${ut.get(0).getIndirizzo()}</b><br>
								Città:<b> ${ut.get(0).getCittà()}</b><br>
								Paese:<b> ${ut.get(0).getPaese()}</b><br>
								CAP:<b> ${ut.get(0).getCAP()}</b><br>
							</p>
							
						    <a href="redpayment" class="btn btn-primary">Procedi al pagamento</a>
						  </div>
						</div>
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