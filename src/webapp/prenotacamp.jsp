<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>BookCamping: Prenotazione Camping</title>
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
			          	<li><a class="dropdown-item" href="#top" >Prenota area Campeggio</a></li>
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
	
				if(alert == "1"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! La data di arrivo deve essere successiva alla data odierna!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "2"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! La partenza deve essere successiva all'arrivo in Campeggio!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "3"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! Campi obligatori non inseriti!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "4"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Siamo spiacenti, non ci sono piazzole disponibili della tipologia specificata nel periodo selezionato!
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "5"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Siamo spiacenti, bisogna includere almeno una notte!
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }
					alert = "0";
			%>
			<div class="row justify-content-md-center">
				<div class="col-md-auto ">
				<br>
					<h3>Richiesta di prenotazione per un'area del campeggio</h3>
					* i campi contrassegnati dall'asterisco sono obbligatori<br><br>
				</div>
			</div>
			<form class="form-signin " action="${pageContext.request.contextPath}/prenotacamp" method="POST" >	
			<div class="row">
				<div class="col-sm-4">
					<b>Dati prenotazione</b><br><br>
					<input type="hidden" class="form-control"  name="username" value=${ user} />
					*Check-in:  <br><input name="giornoarrivo" type="date"><br><br>
					*Check-out:<br><input name="giornopartenza" type="date"><br><br>	
					*n° adulti: <select name="numeroadulti"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option></select>
					*n° bambini(4-10): <select name="numerobambini"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option></select>
								<br><br>
					<img height="110" width="420" alt="..." src="immagini/costipersona1.png"><br><br>
					*Tipologia piazzola : <select name="piazzola">
						<option value="Tenda Small">Tenda Small</option>
						<option value="Tenda Large">Tenda Large</option>
						<option value="Roulotte">Roulotte</option>
						<option value="Camper">Camper</option>
					</select><br><br>
					<img height="110" width="420" alt="..." src="immagini/costipiazzola1.png"><br><br>
					<div class="form-check form-switch">
					  <input name="corrente" class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
					  <label class="form-check-label" for="flexSwitchCheckDefault">Corrente </label>
					</div>
					<div class="form-check form-switch">
					  <input name="moto" class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
					  <label class="form-check-label" for="flexSwitchCheckChecked">Posto moto</label>
					</div>
					<div class="form-check form-switch">
					  <input name="auto" class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
					  <label class="form-check-label" for="flexSwitchCheckChecked">Posto auto</label>
					</div><br><br>
					<img height="100" width="420" alt="..." src="immagini/costioptional.png"><br><br>
					note: <input type="text" placeholder="es. Arriveremo con un po' di ritardo" name="note" size="45" value=""><br><br>
					<br><input type="submit" value="Clicca qui per richiedere la disponibilità"><br><br>
					<span style="font-size:12px">Ogni richiesta è subordinata alla conferma del Camping. </span><br><br>
				</div>
				<div class="col-sm-2">
				</div>
				<div class="col-sm-6">
						Ecco cosa si intende per le diverse tipologie di piazzola:<br><br>
						<div class="row">
							<div class="col-sm-12">
								<div class="accordion" id="accordionExample">
								<div class="accordion-item">
								    <h2 class="accordion-header" id="headingThree">
								      <button class="accordion-button collapsed"  type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								        <b>Tenda Small</b>
								      </button>
								    </h2>
								    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
								      <div class="accordion-body">
								        <img alt="..." src="immagini/tendasmall.png"><br><br>	      
								      </div>
								    </div>
								  </div>
								  <div class="accordion-item">
								    <h2 class="accordion-header" id="headingOne">
								      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
								        <b>Tenda Large</b>
								      </button>
								    </h2>
								    <div id="collapseOne"  class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								      <div class="accordion-body">
								      	<img alt="..." src="immagini/tendalarge.png"><br><br>
								    </div>
								  	</div>
								  </div>
								  <div class="accordion-item">
								    <h2 class="accordion-header" id="headingTwo">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								        <b>Roulotte</b>
								      </button>
								    </h2>
								    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								      <div class="accordion-body">
								        <img alt="..." src="immagini/roulotte2.png"><br><br>
								      </div>
								      </div>
								    </div>
								    <div class="accordion-item">
								    <h2 class="accordion-header" id="headingFour">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
								        <b>Camper</b>
								      </button>
								    </h2>
								    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
								      <div class="accordion-body">
								        <img alt="..." src="immagini/camper.png"><br><br>
								      </div>
								      </div>
								    </div>
								  </div>
							</div>
						</div>
					</div>
				</div>
			</form>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>
			</div>			
		<hr>	
	</body>
</html>