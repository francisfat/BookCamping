<%@page import="java.util.ArrayList"%>
<%@page import="model.PrenotazionePiazzola"%>
<%@page import="model.PrenotazioneEscursione"%>
<%@page import="model.Amministratore"%>
<%@page import="model.Piazzola"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

	<head>
		<title>BookCamping: Administration</title>
			<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="style.css" rel="stylesheet">
			<style>
			table { width: 100px; border-collapse: collapse; }
			th, td { width: 25px; padding: 10px}
			</style>
			<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
	<body>
			<%
				
				String user = (String) session.getAttribute("user");
				int costoTot = (int) session.getAttribute("costoTot");
				int costoCamp = (int) session.getAttribute("costoCamp");
				int costoEsc = (int) session.getAttribute("costoEsc");
				@SuppressWarnings("unchecked")
				ArrayList<PrenotazionePiazzola> listut = (ArrayList<PrenotazionePiazzola>) session.getAttribute("listut");
				@SuppressWarnings("unchecked")
				ArrayList<PrenotazioneEscursione> listesc = (ArrayList<PrenotazioneEscursione>) session.getAttribute("listesc");
			%> 
			
		<form class="form-signin" action="${pageContext.request.contextPath}/profile" method="POST" >
			<input type="hidden" class="form-control"  name="username" value=${ user} />
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar fixed-top">
			  <div class="container">
			    <a class="navbar-brand" href="#top">bookCamping</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#top">Home</a>
			        </li>
			          <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            ${user}
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown1">
			            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Log-out</a>
			          </ul>
			        </li>
			      </ul>		      
			    </div>
			  </div>
			</nav>			  
		</form>
		
		<div class="container">
		
			<br><br><br><br>
			<div class="row justify-content-md-center">
				<div class="col-md-auto ">
					<h3> Benvenuto<b> Amministratore</b>!</h3>
				</div>
			</div>
			<hr>
			<div class="row justify-content-md-center">
				<div class="col-md-auto">
					Questa pagina è riservata all'amministrazione del Camping. E' possibile monitorare gli incassi della società
					e consultare le prenotazioni delle piazzole e delle escursioni.<br><br>
				</div>
			</div>
			<div class="row justify-content-md-center">
				<div class="col-sm-6">
					<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
					  <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
					  </div>
					  <div class="carousel-inner">
					    <div class="carousel-item active" data-bs-interval="10000">
					      <img src="immagini/business3.png" class="d-block w-100" alt="...">
					      <div class="carousel-caption d-none d-md-block">
					        <h5>incassiCamping</h5>
					        <p>Incasso prenotazioni piazzole: <b>${costoCamp} euro</b></p>
					      </div>
					    </div>
					    <div class="carousel-item" data-bs-interval="2000">
					      <img src="immagini/business3.png" class="d-block w-100" alt="...">
					      <div class="carousel-caption d-none d-md-block">
					        <h5>incassiEscursioni</h5>
					        <p>Incasso prenotazioni escursioni:<b> ${costoEsc} euro</b></p>
					      </div>
					    </div>
					    <div class="carousel-item">
					      <img src="immagini/business3.png" class="d-block w-100" alt="...">
					      <div class="carousel-caption d-none d-md-block">
					        <h5>incassiTotali</h5>
					        <p>Incasso totale:<b> ${costoTot} euro</b></p>
					      </div>
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				</div>
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<h4> Monitoraggio <b> incassi</b></h4><br>
						Incasso dovuto alle prenotazioni delle piazzole: <b>${costoCamp} euro</b><br>
						Incasso dovuto alle prenotazioni delle escursioni:<b> ${costoEsc} euro</b><br>
						Incasso totale:<b> ${costoTot} euro</b><br>
				</div>
			</div>
			<hr>
			<div class="row justify-content-md-center">
				<div class="col-md-auto">
					<h4> Raccolta <b> prenotazioni</b></h4><br>
				</div>
			</div>
			<div class="row justify-content-md-center">
				<div class="col-sm-12">
					<h5> Prenotazioni <b> piazzole</b></h5><br>
					<table class="table table-dark table-striped">
					  <thead>
					    <tr>
					      <th>ID_prenotazione</th>
					      <th>Data_Arrivo</th>
					      <th>Data_Partenza</th>
					      <th>n°adulti</th>
					      <th>n°bambini</th>
					      <th>Corrente</th>
					      <th>Posto_Auto</th>
					      <th>Posto_Moto</th>
					      <th>Note______________</th>
					      <th>Costo_Totale</th>
					      <th>Id_utente</th>
					      <th>Id_piazzola</th>
					    </tr>
					  </thead>
					  <tbody>
					  
			<%		
	
					int i = 0;
					if(listut.size()>i){
						
			%>	
					    <tr>
					      <td>${listut.get(i).getId()}</td>
					      <td>${listut.get(i).getArrivo()}</td>
					      <td>${listut.get(i).getPartenza()}</td>
					      <td>${listut.get(i).getNumAdulti()}</td>
					      <td>${listut.get(i).getNumAdulti()}</td>
					      <td>${listut.get(i).getCorrente()}</td>
					      <td>${listut.get(i).getPostoAuto()}</td>
					      <td>${listut.get(i).getPostoMoto()}</td>
					      <td>${listut.get(i).getNote()}</td>
					      <td>${listut.get(i).getCostoTotale()} euro</td>
					      <td>${listut.get(i).getId_utente()}</td>
					      <td>${listut.get(i).getId_piazzola()}</td>
					    </tr>
			<%
					}	
					if(listut.size()>i+1){
			 %>	
					    <tr>
					      <td>${listut.get(i+1).getId()}</td>
					      <td>${listut.get(i+1).getArrivo()}</td>
					      <td>${listut.get(i+1).getPartenza()}</td>
					      <td>${listut.get(i+1).getNumAdulti()}</td>
					      <td>${listut.get(i+1).getNumAdulti()}</td>
					      <td>${listut.get(i+1).getCorrente()}</td>
					      <td>${listut.get(i+1).getPostoAuto()}</td>
					      <td>${listut.get(i+1).getPostoMoto()}</td>
					      <td>${listut.get(i+1).getNote()}</td>
					      <td>${listut.get(i+1).getCostoTotale()} euro</td>
					      <td>${listut.get(i+1).getId_utente()}</td>
					      <td>${listut.get(i+1).getId_piazzola()}</td>
					    </tr>
			<%
					}
					if(listut.size()>i+2){
			 %>	
					    <tr>
					      <td>${listut.get(i+2).getId()}</td>
					      <td>${listut.get(i+2).getArrivo()}</td>
					      <td>${listut.get(i+2).getPartenza()}</td>
					      <td>${listut.get(i+2).getNumAdulti()}</td>
					      <td>${listut.get(i+2).getNumAdulti()}</td>
					      <td>${listut.get(i+2).getCorrente()}</td>
					      <td>${listut.get(i+2).getPostoAuto()}</td>
					      <td>${listut.get(i+2).getPostoMoto()}</td>
					      <td>${listut.get(i+2).getNote()}</td>
					      <td>${listut.get(i+2).getCostoTotale()} euro</td>
					      <td>${listut.get(i+2).getId_utente()}</td>
					      <td>${listut.get(i+2).getId_piazzola()}</td>
					    </tr>
			<%
					}
					if(listut.size()>i+3){
			 %>	
					    <tr>
						      <td>${listut.get(i+3).getId()}</td>
						      <td>${listut.get(i+3).getArrivo()}</td>
						      <td>${listut.get(i+3).getPartenza()}</td>
						      <td>${listut.get(i+3).getNumAdulti()}</td>
						      <td>${listut.get(i+3).getNumAdulti()}</td>
						      <td>${listut.get(i+3).getCorrente()}</td>
						      <td>${listut.get(i+3).getPostoAuto()}</td>
						      <td>${listut.get(i+3).getPostoMoto()}</td>
						      <td>${listut.get(i+3).getNote()}</td>
						      <td>${listut.get(i+3).getCostoTotale()} euro</td>
						      <td>${listut.get(i+3).getId_utente()}</td>
						      <td>${listut.get(i+3).getId_piazzola()}</td>
						    </tr>
			<%
					}
					if(listut.size()>i+4){
			 %>	
					    <tr>
						      <td>${listut.get(i+4).getId()}</td>
						      <td>${listut.get(i+4).getArrivo()}</td>
						      <td>${listut.get(i+4).getPartenza()}</td>
						      <td>${listut.get(i+4).getNumAdulti()}</td>
						      <td>${listut.get(i+4).getNumAdulti()}</td>
						      <td>${listut.get(i+4).getCorrente()}</td>
						      <td>${listut.get(i+4).getPostoAuto()}</td>
						      <td>${listut.get(i+4).getPostoMoto()}</td>
						      <td>${listut.get(i+4).getNote()}</td>
						      <td>${listut.get(i+4).getCostoTotale()} euro</td>
						      <td>${listut.get(i+4).getId_utente()}</td>
						      <td>${listut.get(i+4).getId_piazzola()}</td>
						    </tr>
			<%
					}
					if(listut.size()>i+5){
			 %>	
					    <tr>
						      <td>${listut.get(i+5).getId()}</td>
						      <td>${listut.get(i+5).getArrivo()}</td>
						      <td>${listut.get(i+5).getPartenza()}</td>
						      <td>${listut.get(i+5).getNumAdulti()}</td>
						      <td>${listut.get(i+5).getNumAdulti()}</td>
						      <td>${listut.get(i+5).getCorrente()}</td>
						      <td>${listut.get(i+5).getPostoAuto()}</td>
						      <td>${listut.get(i+5).getPostoMoto()}</td>
						      <td>${listut.get(i+5).getNote()}</td>
						      <td>${listut.get(i+5).getCostoTotale()} euro</td>
						      <td>${listut.get(i+5).getId_utente()}</td>
						      <td>${listut.get(i+5).getId_piazzola()}</td>
						    </tr>
			<%
					}
					if(listut.size()>i+6){
			 %>	
					    <tr>
						      <td>${listut.get(i+6).getId()}</td>
						      <td>${listut.get(i+6).getArrivo()}</td>
						      <td>${listut.get(i+6).getPartenza()}</td>
						      <td>${listut.get(i+6).getNumAdulti()}</td>
						      <td>${listut.get(i+6).getNumAdulti()}</td>
						      <td>${listut.get(i+6).getCorrente()}</td>
						      <td>${listut.get(i+6).getPostoAuto()}</td>
						      <td>${listut.get(i+6).getPostoMoto()}</td>
						      <td>${listut.get(i+6).getNote()}</td>
						      <td>${listut.get(i+6).getCostoTotale()} euro</td>
						      <td>${listut.get(i+6).getId_utente()}</td>
						      <td>${listut.get(i+6).getId_piazzola()}</td>
						    </tr>
			<%
					}
					if(listut.size()>i+7){
						 %>	
								    <tr>
						      <td>${listut.get(i+7).getId()}</td>
						      <td>${listut.get(i+7).getArrivo()}</td>
						      <td>${listut.get(i+7).getPartenza()}</td>
						      <td>${listut.get(i+7).getNumAdulti()}</td>
						      <td>${listut.get(i+7).getNumAdulti()}</td>
						      <td>${listut.get(i+7).getCorrente()}</td>
						      <td>${listut.get(i+7).getPostoAuto()}</td>
						      <td>${listut.get(i+7).getPostoMoto()}</td>
						      <td>${listut.get(i+7).getNote()}</td>
						      <td>${listut.get(i+7).getCostoTotale()} euro</td>
						      <td>${listut.get(i+7).getId_utente()}</td>
						      <td>${listut.get(i+7).getId_piazzola()}</td>
						    </tr>
			<%
					}
					if(listut.size()>i+8){
						 %>	
								    <tr>
						      <td>${listut.get(i+8).getId()}</td>
						      <td>${listut.get(i+8).getArrivo()}</td>
						      <td>${listut.get(i+8).getPartenza()}</td>
						      <td>${listut.get(i+8).getNumAdulti()}</td>
						      <td>${listut.get(i+8).getNumAdulti()}</td>
						      <td>${listut.get(i+8).getCorrente()}</td>
						      <td>${listut.get(i+8).getPostoAuto()}</td>
						      <td>${listut.get(i+8).getPostoMoto()}</td>
						      <td>${listut.get(i+8).getNote()}</td>
						      <td>${listut.get(i+8).getCostoTotale()} euro</td>
						      <td>${listut.get(i+8).getId_utente()}</td>
						      <td>${listut.get(i+8).getId_piazzola()}</td>
						    </tr>
			<%
					}
					if(listut.size()>i+9){
						 %>	
							<tr>
						      <td>${listut.get(i+9).getId()}</td>
						      <td>${listut.get(i+9).getArrivo()}</td>
						      <td>${listut.get(i+9).getPartenza()}</td>
						      <td>${listut.get(i+9).getNumAdulti()}</td>
						      <td>${listut.get(i+9).getNumAdulti()}</td>
						      <td>${listut.get(i+9).getCorrente()}</td>
						      <td>${listut.get(i+9).getPostoAuto()}</td>
						      <td>${listut.get(i+9).getPostoMoto()}</td>
						      <td>${listut.get(i+9).getNote()}</td>
						      <td>${listut.get(i+9).getCostoTotale()} euro</td>
						      <td>${listut.get(i+9).getId_utente()}</td>
						      <td>${listut.get(i+9).getId_piazzola()}</td>
						    </tr>
			<%
					}
			%>
					  </tbody>
					</table>
				</div>
			</div>
			<br><br>
			<div class="row justify-content-md-center">
				<div class="col-sm-12">
					<h5> Prenotazioni <b> escursioni</b></h5><br>
					<table class="table table-dark table-striped">
					  <thead>
					    <tr>
					      <th>ID_escursione</th>
					      <th>Data_escursione</th>
					      <th>Numero_Persone</th>
					      <th>Costo_Totale</th>
					      <th>Id_escursione</th>
					      <th>Id_utente</th>
					    </tr>
					  </thead>
					  <tbody>
					  
			<%		
					if(i<listesc.size()){
			%>			
							
					    <tr>
					      <td>${ listesc.get(i).getId()}</td>
					      <td>${ listesc.get(i).getData()}</td>
					      <td>${ listesc.get(i).getNumPersone()}</td>
					      <td>${ listesc.get(i).getCostoTotale()} euro</td>
					      <td>${ listesc.get(i).getId_escursione()}</td>
					      <td>${ listesc.get(i).getId_utente()}</td>
					    </tr>
			<%
					}	
					if(listesc.size()>i+1){
			 %>	
					    <tr>
					      <td>${listesc.get(i+1).getId()}</td>
					      <td>${listesc.get(i+1).getData()}</td>
					      <td>${listesc.get(i+1).getNumPersone()}</td>
					      <td>${listesc.get(i+1).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+1).getId_escursione()}</td>
					      <td>${listesc.get(i+1).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+2){
			 %>	
					    <tr>
					      <td>${listesc.get(i+2).getId()}</td>
					      <td>${listesc.get(i+2).getData()}</td>
					      <td>${listesc.get(i+2).getNumPersone()}</td>
					      <td>${listesc.get(i+2).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+2).getId_escursione()}</td>
					      <td>${listesc.get(i+2).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+3){
			 %>	
					    <tr>
					      <td>${listesc.get(i+3).getId()}</td>
					      <td>${listesc.get(i+3).getData()}</td>
					      <td>${listesc.get(i+3).getNumPersone()}</td>
					      <td>${listesc.get(i+3).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+3).getId_escursione()}</td>
					      <td>${listesc.get(i+3).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+4){
			 %>	
			 			  <tr>
					      <td>${listesc.get(i+4).getId()}</td>
					      <td>${listesc.get(i+4).getData()}</td>
					      <td>${listesc.get(i+4).getNumPersone()}</td>
					      <td>${listesc.get(i+4).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+4).getId_escursione()}</td>
					      <td>${listesc.get(i+4).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+5){
			 %>	
					     <tr>
					      <td>${listesc.get(i+5).getId()}</td>
					      <td>${listesc.get(i+5).getData()}</td>
					      <td>${listesc.get(i+5).getNumPersone()}</td>
					      <td>${listesc.get(i+5).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+5).getId_escursione()}</td>
					      <td>${listesc.get(i+5).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+6){
			 %>	
					    <tr>
					      <td>${listesc.get(i+6).getId()}</td>
					      <td>${listesc.get(i+6).getData()}</td>
					      <td>${listesc.get(i+6).getNumPersone()}</td>
					      <td>${listesc.get(i+6).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+6).getId_escursione()}</td>
					      <td>${listesc.get(i+6).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+7){
			%>	
					    <tr>
					      <td>${listesc.get(i+7).getId()}</td>
					      <td>${listesc.get(i+7).getData()}</td>
					      <td>${listesc.get(i+7).getNumPersone()}</td>
					      <td>${listesc.get(i+7).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+7).getId_escursione()}</td>
					      <td>${listesc.get(i+7).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+8){
			%>	
					    <tr>
					      <td>${listesc.get(i+8).getId()}</td>
					      <td>${listesc.get(i+8).getData()}</td>
					      <td>${listesc.get(i+8).getNumPersone()}</td>
					      <td>${listesc.get(i+8).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+8).getId_escursione()}</td>
					      <td>${listesc.get(i+8).getId_utente()}</td>
					    </tr>
			<%
					}
					if(listesc.size()>i+9){
			%>	
					    <tr>
					      <td>${listesc.get(i+9).getId()}</td>
					      <td>${listesc.get(i+9).getData()}</td>
					      <td>${listesc.get(i+9).getNumPersone()}</td>
					      <td>${listesc.get(i+9).getCostoTotale()} euro</td>
					      <td>${listesc.get(i+9).getId_escursione()}</td>
					      <td>${listesc.get(i+9).getId_utente()}</td>
					    </tr>
			<%
					}
			%>
					  </tbody>
					</table>
				</div>
			</div>
			<br><br>
			<hr>
	
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>
		
		</div>	

	</body>

</html>