<%@page import="dao.UtenteDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

	<head>
		<title>BookCamping: Home</title>
			<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="style.css" rel="stylesheet">
			<link rel="shortcut icon" href="immagini/aa.ico" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
	<body>
			<%
				String user = (String) session.getAttribute("user");
			 	String alert = (String) session.getAttribute("alert");
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
		
		<%
			if (alert == "10"){
		%>
			
			<div class="alert alert-success" role="alert" style="top: 60px" >
			  Pagamento effettuato con successo, grazie per averci scelto!
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		<%
			}
			alert = "0";
		%>
		<br><br>	
		<div id="carouselCaptions" class="carousel slide" data-bs-ride="carousel">
		 <div class="carousel-indicators">
		   <button type="button" data-bs-target="#carouselCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		   <button type="button" data-bs-target="#carouselCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		   <button type="button" data-bs-target="#carouselCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		   <button type="button" data-bs-target="#carouselCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		 </div>
		 <div class="carousel-inner">
		       <div class="carousel-item active">
		      <img src="immagini/camping.jpg" class="d-block w-100" alt="..." >
		      <div class="carousel-caption d-md-block" >
		      	 <h5>Prenota subito!</h5>
		        <p>Campeggio in tenda, camper, roulotte ed escursioni guidate!</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="immagini/camping1.jpg" class="d-block w-100" alt="..." >
		      <div class="carousel-caption d-md-block">
		        <h5>Osserva le infinite costellazioni!</h5>
		        <p>Goditi gli spettacoli serali organizzati nel campeggio!</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="immagini/camping2.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-md-block">
		        <h5>Troverai la pace che hai sempre cercato</h5>
		        <p>Non continuare a vivere con questo rimpianto!</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="immagini/camping3.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-md-block">
		      	<h5>Vivi un'esperienza memorabile</h5>
		        <p>La tua possibilità di vivere in un luogo ecosostenibile!</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		
			<div class="container">
				<hr>	
				<div class="row justify-content-md-center">
					<div class="col-md-auto ">
						<h3> Benvenuto<b> ${user}</b>!</h3>
					</div>
				</div>
				<hr>					
				<div class="row">
					<div class="col-md-auto">
						Se stai cercando, il campeggio ideale per vivere un'esperienza indimenticabile nelle montagne dell'Abruzzo questa
						è la soluzione che fa per te. Lasciati trasportare dalla natura incontaminata, dai paesaggi spettacolari degli Appennini
						e dalle molteplici avventure ed escursioni guidate da esperti.
					</div>
				</div>
				<hr>		
				<div class="row justify-content-md-center">
					<div class="col-md-auto ">
						<h4> Informazioni utili su luogo, servizi e costi del campeggio</h4><br>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="card" style="height: 24rem;">
						  <img src="immagini/campeggio.png" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h4 class="card-title">Camping</h4>
						    <div class="card-text">Il campeggio rispetta la natura e mette a disposizione postazioni per accendere
						    il fuoco, tavoli e sedie di legno. </div><br>
						  </div>
						</div>
					</div>
					<br><br>
					<div class="col-sm-3">
						<div class="card" style="height: 24rem;">
						  <img src="immagini/piazzole1.png" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h4 class="card-title">Montagne</h4>
						    <div class="card-text">Il campeggio è situato tra le montagne dell'Abruzzo che comprendono la Riserva Naturale <i>La Camosciara</i>
						    e <i>L'Area faunistica del Lupo</i>.</div><br>
						  </div>
						</div>
					</div>
					<br><br>
					<div class="col-sm-3">
						<div class="card" style="height: 24rem;">
						  <img src="immagini/cervo1.png" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h4 class="card-title">Fauna</h4>
						    <div class="card-text">Camosci, cerbiatti e cervi fanno spesso visita al campeggio lasciando tutti
						    gli ospiti del Camping senza parole.</div><br>
						  </div>
						</div>
					</div>
					<br><br>
					<div class="col-sm-3">
						<div class="card" style="height: 24rem;">
						  <img src="immagini/lago.png" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h4 class="card-title">Fiumi e laghi</h4>
						    <div class="card-text">Un fiume costeggia, delimita il campo e sfocia nel lago di <i>Barrea</i>. Quest'ultimo presenta delle dimensioni molto estese e da anni attira
							turisti da tutta la penisola e non solo.</div><br>
						  </div>
						</div>
					</div>
					<br><br>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-12">
						<div class="accordion" id="accordionExample">
						<div class="accordion-item">
						    <h2 class="accordion-header" id="headingThree">
						      <button class="accordion-button collapsed"  type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						        <b>Servizi Gratuiti</b>
						      </button>
						    </h2>
						    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <strong>Servizi di base offerti.</strong> <br>
						        - Bagni comuni e docce con acqua calda.<br>
						        - Rete Wi-Fi libera a tutti.<br>
						        - Pronto soccorso.<br>
						        - Bar, ristorante, alimentari e farmacia a circa 100m dal Camping.<br>
						        - Animazione e Spettacoli. Al Camping non ci si annoia mai: per grandi e piccoli, attività ludiche e sportive sulla spiaggia e a bordo piscina, 
						        tornei, fitness, balli di gruppo, giochi, spettacoli serali ed eventi  speciali. Ogni giorno, dal 16 giugno all’8 settembre, per una vacanza allegra e dinamica.
						        			      
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
						        <b>Costi Campeggio</b>
						      </button>
						    </h2>
						    <div id="collapseOne"  class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						      <div class= "row">
						        <strong>Costi in base alla scelta dei servizi.</strong><br>
						        <div class="col-sm-6" >Il costo della piazzola dipenda dalla tipologia della piazzola scelta: tenda small, tenda large, roulotte o camper.
						        Ognuna delle tipologie scelte determina la grandezza dell'area di campeggio. Tenda Small: 30mq , Tenda Large: 42 mq, Roulotte: 60 mq, Camper: 72mq.
						        Inoltre ogni persona paga una tassa di soggiorno che varia in base all'età della persona.
						        Il costo totale verrà dato dalla somma dei due fattori, più eventuali <i>optional</i> scelti dall'utente. 
						        <br>Le escursioni e le visite guidate prevedono una prenotazione separata dalla prenotazione della piazzola<br></div>
						      	<div class="col-sm-6" ><img height="95" width="420" alt="..." src="immagini/costipersona1.png">
						      	<br><img height="120" width="420" alt="..." src="immagini/costipiazzola1.png"></div><br><br>
						      </div>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="headingTwo">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						        <b>Costi Optional aggiuntivi</b>
						      </button>
						    </h2>
						    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        <strong>Ulteriori servizi.</strong><br>
						         <div class="row"><div class="col-sm-6">
						         Esistono degli optional che sono offerti dal Camping e che vengono sommati al prezzo totale della prenotazione. 
						         <br><br></div>
								<div class="col-sm-6"> <img height="100" width="420" alt="..." src="immagini/costioptional.png"><br><br></div>
							     </div>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</div>
				<hr>
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
					<div class="col-md-auto ">
						<h4> Mappa e posizione di Villetta Barrea</h4><br>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div id="wrapper-9cd199b9cc5410cd3b1ad21cab2e54d3">
						<div id="map-9cd199b9cc5410cd3b1ad21cab2e54d3"></div><script>(function () {
				        var setting = {"height":269,"width":560,"zoom":15,"queryString":"Villetta Barrea, AQ, Italia","place_id":"ChIJwczZ6J90MBMRhMOFp6Y4Hcc","satellite":false,"centerCoord":[41.776609218785616,13.935956225098227],"cid":"0xc71d38a6a785c384","lang":"it","cityUrl":"/italy/villetta-barrea-61468","cityAnchorText":"Mappa di Villetta Barrea, Abruzzo, Italia","id":"map-9cd199b9cc5410cd3b1ad21cab2e54d3","embed_id":"544419"};
				        var d = document;
				        var s = d.createElement('script');
				        s.src = 'https://1map.com/js/script-for-user.js?embed_id=544419';
				        s.async = true;
				        s.onload = function (e) {
				          window.OneMap.initMap(setting)
				        };
				        var to = d.getElementsByTagName('script')[0];
				        to.parentNode.insertBefore(s, to);
				      })();</script><a href="https://1map.com/it/map-embed">1 Map</a></div>
					</div>
					<div class="col-sm-6">
						
						La mappa specifica il paesino che ospita il Camping, ovvero <b>Villetta Barrea</b>,
						situata in uno dei centri maggiori del Parco Nazionale dell'Abruzzo. Il centro
						offre numerosi servizi tra cui un Tabacchino, due macellerie, vari Alimentari,
						negozi di artigianato, pub e servizi di noleggio di biciclette. É un paesino pieno
						di campeggi, hotel e presenta attrazioni turistiche come Museo della Transumanza
						, il Museo dell'Acqua, la chiesa di San Michele e la parrocchia di Santa Maria Assunta.
						 Tuttavia le principali attrazioni turistico sono di tipo naturalistico. Le escursioni 
						 mostrano la riserva naturale della Camosciara, è inoltre possibile osservare tanti animali
						 soprattutto cervi e cerbiatti. Fai <b>attenzione</b>, per accarezzarli bisogna essere silenzioni e poco agitati
						 altrimenti scappano via. É assolutamente vietato dare loro da mangiare.
				
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