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
			<link rel="shortcut icon" href="immagini/aa.ico" />
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
				ArrayList<PrenotazionePiazzola> listpiaz = (ArrayList<PrenotazionePiazzola>) session.getAttribute("listpiaz");
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
					      <th>Data_Check_in</th>
					      <th>Data_Check_out</th>
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
					for(int i = 0; listpiaz.size()>i; i++){
			%>	
					    <tr>
					      <td><% out.println(listpiaz.get(i).getId()); %></td>
					      <td><% out.println(listpiaz.get(i).getCheckin()); %></td>
					      <td><% out.println(listpiaz.get(i).getCheckout()); %></td>
					      <td><% out.println(listpiaz.get(i).getNumAdulti()); %></td>
					      <td><% out.println(listpiaz.get(i).getNumBambini()); %></td>
					      <td><% out.println(listpiaz.get(i).getCorrente()); %></td>
					      <td><% out.println(listpiaz.get(i).getPostoAuto()); %></td>
					      <td><% out.println(listpiaz.get(i).getPostoMoto()); %></td>
					      <td><% out.println(listpiaz.get(i).getNote()); %></td>
					      <td><% out.println(listpiaz.get(i).getCostoTotale()); %> euro</td>
					      <td><% out.println(listpiaz.get(i).getId_utente()); %></td>
					      <td><% out.println(listpiaz.get(i).getId_piazzola()); %></td>
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
					for(int i = 0; listesc.size()>i; i++){
			%>			
					    <tr>
					      <td><% out.println(listesc.get(i).getId()); %></td>
					      <td><% out.println(listesc.get(i).getData()); %></td>
					      <td><% out.println(listesc.get(i).getNumPersone()); %></td>
					      <td><% out.println(listesc.get(i).getCostoTotale()); %> euro</td>
					      <td><% out.println(listesc.get(i).getId_escursione()); %></td>
					      <td><% out.println(listesc.get(i).getId_utente()); %></td>
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