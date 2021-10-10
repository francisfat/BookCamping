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
			<title>BookCamping: Pagamento</title>
			<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="style.css" rel="stylesheet">
			<link rel="shortcut icon" href="immagini/aa.ico" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	
	<body>
	
			<%
				String user = (String) session.getAttribute("user");
				PrenotazionePiazzola pren = (PrenotazionePiazzola) session.getAttribute("pren");
				PrenotazioneEscursione pren1 = (PrenotazioneEscursione) session.getAttribute("pren1");
				String alert = (String) session.getAttribute("alert");

					if(alert == "1"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! Campi obligatori non inseriti!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "2"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! CVV o Card Number sono costituiti da sole cifre!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "3"){ %>
					    <div class="alert alert-danger" role="alert" >
						  Errore! CVV o Card Number non hanno un formato corretto!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "4"){ %>
					    <div class="alert alert-danger" role="alert" >
						 Circuito di credito non riconosciuto.
						 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "5"){ %>
						<div class="alert alert-danger" role="alert" >
						 Carta di Credito scaduta.
						 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }
					alert = "0";
				%>
			
			<form class="form-signin " action="${pageContext.request.contextPath}/payment" method="POST" >
			<%	
				if (pren1 == null){
			%>
					<input type="hidden" name="tipo" value="no" />
					<input type="hidden" name="id_piaz" value=${ pren.getId_piazzola()} />
					<input type="hidden" name="id_ut" value=${ pren.getId_utente()} />
					<input type="hidden" name="costo" value=${ pren.getCostoTotale()} />
					<input type="hidden" name="arr" value=${ pren.getCheckin()} />
					<input type="hidden" name="part" value=${ pren.getCheckout()} />
					<input type="hidden" name="ad" value=${ pren.getNumAdulti()} />
					<input type="hidden" name="bamb" value=${ pren.getNumBambini()} />
					<input type="hidden" name="cor" value=${ pren.getCorrente()} />
					<input type="hidden" name="moto" value=${ pren.getPostoMoto()} />
					<input type="hidden" name="auto" value=${ pren.getPostoAuto()} />
					<input type="hidden" name="note" value=${ pren.getNote()} />
			<%
				} else{
			%>	
					<input type="hidden" name="tipo" value="si" />
					<input type="hidden" name="id_esc" value=${ pren1.getId_escursione()} />
					<input type="hidden" name="costo" value=${ pren1.getCostoTotale()} />
					<input type="hidden" name="data" value=${ pren1.getData()} />
					<input type="hidden" name="numpers" value=${ pren1.getNumPersone()} />
					<input type="hidden" name="id_ut" value=${ pren1.getId_utente()} />
			<%
				}
			%>
			<div class="container">
				<br><br>	
				<div class="row justify-content-md-center">
					<div class="col-md-auto ">
						<h3> Pagamento con Carta di Credito</h3>
						<br>
					</div> 
				</div>
				
				<hr>
				<p>Si accettano i seguenti circuiti di credito presenti sul mercato internazionale: 
				VISA, MasterCard, Diners Club, American Express, Discover Card.</p>
				<div class="row justify-content-md-center">
					<br>
					<fieldset>
				      <label for="card-number">Card Number:</label><br>
				      <input type="text" placeholder="XXXX" name="cd1" id="card-number" class="input-cart-number" maxlength="4" />
				      <input type="text" placeholder="XXXX" name="cd2" id="card-number-1" class="input-cart-number" maxlength="4" />
				      <input type="text" placeholder="XXXX" name="cd3" id="card-number-2" class="input-cart-number" maxlength="4" />
				      <input type="text" placeholder="XXXX" name="cd4" id="card-number-3" class="input-cart-number" maxlength="4" />
				    </fieldset><br>
				 </div>
				 <br>
				 <div class="row">
					<div class="col-sm-6">
				    <fieldset>
				      <label for="card-holder">Card Holder:</label><br>
				      <input type="text" id="card-holder"  placeholder=" Card holder" name="cardholder" />
				    </fieldset><br>
				    <fieldset class="fieldset-expiration">
				      <label for="card-expiration-month">Expiration Date <i>(mm/yyyy)</i>: </label><br>
				        <select name="mouth">
				          <option></option>
				          <option>01</option>
				          <option>02</option>
				          <option>03</option>
				          <option>04</option>
				          <option>05</option>
				          <option>06</option>
				          <option>07</option>
				          <option>08</option>
				          <option>09</option>
				          <option>10</option>
				          <option>11</option>
				          <option>12</option>
				        </select>
				        <select name="year">
				          <option></option>
				          <option>2021</option>
				          <option>2022</option>
				          <option>2023</option>
				          <option>2024</option>
				          <option>2025</option>
				          <option>2026</option>
				          <option>2027</option>
				          <option>2028</option>
				          <option>2029</option>
				          <option>2030</option>
				        </select><br>
				       </fieldset><br>
				    <fieldset class="fieldset-ccv">
				      <label for="card-ccv">CCV</label><br>
				      <input placeholder=" CVV" type="text" id="card-ccv" name="CVV" maxlength="3" />
				    </fieldset><br>
				    <button type="submit" class="btn btn-primary btn-lg btn-block">Submit and Pay Now</button>
					</div>
					<div class="col-sm-2"><br><br>
						<img alt="..." src="immagini/cartacredito2.png" width="150" height="35"><br><br>
						<img alt="..." src="immagini/cartacredito.png" width="150" height="140">
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
		
			</form>		
	</body>

</html>