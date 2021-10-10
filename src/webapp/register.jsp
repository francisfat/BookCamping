<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>BookCamping: Registrazione</title>
	<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
	<link rel="shortcut icon" href="immagini/aa.ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>	
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar fixed-top">
			  <div class="container">
			    <a class="navbar-brand" href="redindex">bookCamping</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="redindex">Home</a>
			        </li>
			        <li><br></li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Prenotazioni
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
			          	<li><a class="dropdown-item" href="redlogin">Prenota area Campeggio</a></li>
			            <li><a class="dropdown-item" href="redlogin">Prenota escursione</a></li>
			          </ul>
			        </li>
			        <li><br></li>
			          <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Account
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown1">
			            <li><a class="dropdown-item" href="redlogin">Log-in</a>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#top">Sign-up</a></li>			            
			          </ul>
			        </li>
			      </ul>		      
			    </div>
			  </div>
			</nav>


		<form class="form-signin " action="${pageContext.request.contextPath}/register" method="POST" >	
		<div class="container">
		<br><br>
		<%			
					
					String alert = (String) session.getAttribute("alert");
					
					if(alert == "1"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! La data di nascita è errata.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "10"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Bisogna essere maggiorenni!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "2"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Campi obligatori non inseriti!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "3"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Le password non corrispondono.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "4"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Utente già registrato.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "5"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Password almeno di 9 caratteri.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "6"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Password di sole lettere e numeri.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "7"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Password con almeno 2 cifre.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "8"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Cellulare non valido.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "9"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! E-mail non valida!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }
					alert = "0";
			%>
			<div class="row justify-content-md-center">
				<div class="col-md-auto ">
				<br><br>
					<h3><br> <b>Registrazione</b>: <i>inserisci le informazioni per procedere con la registrazione</i></h3>
					* i campi contrassegnati dall'asterisco sono obbligatori<br><br>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">
					*Nome:<input type="text" class="form-control" placeholder="Nome" aria-label="Nome" aria-describedby="basic-addon1" name="nome"><br><br>
					*Cognome:<input type="text" class="form-control" placeholder="Cognome" aria-label="Cognome" aria-describedby="basic-addon1" name="cognome"><br><br>
					*Data di nascita: <input name="nascita" type="date"><br><br>
					*Indirizzo:<input type="text" class="form-control" placeholder="Indirizzo" aria-label="Indirizzo" aria-describedby="basic-addon1" name="indirizzo"><br><br>
					*Città:<input type="text" class="form-control" placeholder="città" name="citta" value=""><br><br>
					*Paese:<div class="col-sm-4"><select name="nazione" size="1" name="nazione">
								<option value="albania">albania</option><option value="algeria">algeria</option><option value="american samoa">american samoa</option><option value="andorra">andorra</option><option value="angola">angola</option><option value="anguilla">anguilla</option><option value="antigua">antigua</option><option value="argentina">argentina</option><option value="armenia">armenia</option><option value="aruba">aruba</option><option value="australia">australia</option><option value="austria">austria</option><option value="azerbaijan">azerbaijan</option><option value="bahamas">bahamas</option><option value="bahrain">bahrain</option><option value="bangladesh">bangladesh</option><option value="barbados">barbados</option><option value="barbuda">barbuda</option><option value="belarus">belarus</option><option value="belgium">belgium</option><option value="belize">belize</option><option value="benin">benin</option><option value="bermuda">bermuda</option><option value="bhutan">bhutan</option><option value="bolivia">bolivia</option><option value="bonaire">bonaire</option><option value="botswana">botswana</option><option value="brazil">brazil</option><option value="british virgin islands">british virgin islands</option><option value="brunei">brunei</option><option value="bulgaria">bulgaria</option><option value="burkina faso">burkina faso</option><option value="burundi">burundi</option><option value="cambodia">cambodia</option><option value="cameroon">cameroon</option><option value="canada">canada</option><option value="cape verde">cape verde</option><option value="cayman islands">cayman islands</option><option value="central african republic">central african republic</option><option value="chad">chad</option><option value="channel islands">channel islands</option><option value="chile">chile</option><option value="china">china</option><option value="colombia">colombia</option><option value="congo-brazzaville">congo-brazzaville</option><option value="congo-kinshasa">congo-kinshasa</option><option value="cook islands">cook islands</option><option value="costa rica">costa rica</option><option value="croatia">croatia</option><option value="curacao">curacao</option><option value="cyprus">cyprus</option><option value="czech republic">czech republic</option><option value="denmark">denmark</option><option value="djibouti">djibouti</option><option value="dominica">dominica</option><option value="dominican republic">dominican republic</option><option value="ecuador">ecuador</option><option value="egypt">egypt</option><option value="el salvador">el salvador</option><option value="equatorial guinea">equatorial guinea</option><option value="eritrea">eritrea</option><option value="estonia">estonia</option><option value="ethiopia">ethiopia</option><option value="faroe islands">faroe islands</option><option value="fiji">fiji</option><option value="finland">finland</option><option value="france">france</option><option value="french guiana">french guiana</option><option value="french polynesia">french polynesia</option><option value="gabon">gabon</option><option value="gambia">gambia</option><option value="georgia">georgia</option><option value="germany">germany</option><option value="ghana">ghana</option><option value="gibraltar">gibraltar</option><option value="greece">greece</option><option value="greenland">greenland</option><option value="grenada">grenada</option><option value="guadeloupe">guadeloupe</option><option value="guam">guam</option><option value="guatemala">guatemala</option><option value="guinea">guinea</option><option value="guinea bissau">guinea bissau</option><option value="guyana">guyana</option><option value="haiti">haiti</option><option value="honduras">honduras</option><option value="hong kong">hong kong</option><option value="hungary">hungary</option><option value="iceland">iceland</option><option value="india">india</option><option value="indonesia">indonesia</option><option value="iran">iran</option><option value="iraq">iraq</option><option value="ireland">ireland</option><option value="israel">israel</option><option value="italia"selected>italia</option><option value="ivory coast">ivory coast</option><option value="jamaica">jamaica</option><option value="japan">japan</option><option value="jordan">jordan</option><option value="kazakhstan">kazakhstan</option><option value="kenya">kenya</option><option value="kuwait">kuwait</option><option value="kyrgyzstan">kyrgyzstan</option><option value="laos">laos</option><option value="latvia">latvia</option><option value="lebanon">lebanon</option><option value="lesotho">lesotho</option><option value="liberia">liberia</option><option value="libya">libya</option><option value="liechtenstein">liechtenstein</option><option value="lithuania">lithuania</option><option value="luxembourg">luxembourg</option><option value="macau">macau</option><option value="macedonia">macedonia</option><option value="madagascar">madagascar</option><option value="malawi">malawi</option><option value="malaysia">malaysia</option><option value="mali">mali</option><option value="malta">malta</option><option value="marshall islands">marshall islands</option><option value="martinique">martinique</option><option value="mauritania">mauritania</option><option value="mauritius">mauritius</option><option value="mexico">mexico</option><option value="micronesia">micronesia</option><option value="moldova">moldova</option><option value="monaco">monaco</option><option value="mongolia">mongolia</option><option value="montserrat">montserrat</option><option value="morocco">morocco</option><option value="mozambique">mozambique</option><option value="myanmar/burma">myanmar/burma</option><option value="namibia">namibia</option><option value="nepal">nepal</option><option value="netherlands">netherlands</option><option value="netherlands antilles">netherlands antilles</option><option value="new caledonia">new caledonia</option><option value="new zealand">new zealand</option><option value="nicaragua">nicaragua</option><option value="niger">niger</option><option value="nigeria">nigeria</option><option value="norway">norway</option><option value="oman">oman</option><option value="pakistan">pakistan</option><option value="palau">palau</option><option value="panama">panama</option><option value="papua new guinea">papua new guinea</option><option value="paraguay">paraguay</option><option value="peru">peru</option><option value="philippines">philippines</option><option value="poland">poland</option><option value="portugal">portugal</option><option value="puerto rico">puerto rico</option><option value="qatar">qatar</option><option value="reunion">reunion</option><option value="romania">romania</option><option value="russia">russia</option><option value="rwanda">rwanda</option><option value="saba">saba</option><option value="saipan">saipan</option><option value="san marino">san marino</option><option value="saudi arabia">saudi arabia</option><option value="senegal">senegal</option><option value="seychelles">seychelles</option><option value="sierra leone">sierra leone</option><option value="singapore">singapore</option><option value="slovak republic">slovak republic</option><option value="slovenia">slovenia</option><option value="somalia">somalia</option><option value="south africa">south africa</option><option value="south korea">south korea</option><option value="spain">spain</option><option value="sri lanka">sri lanka</option><option value="st. barthelemy">st. barthelemy</option><option value="st. croix">st. croix</option><option value="st. eustatius">st. eustatius</option><option value="st. kitts and nevis">st. kitts and nevis</option><option value="st. lucia">st. lucia</option><option value="st. maarten/st. martin">st. maarten/st. martin</option><option value="st. thomas">st. thomas</option><option value="st. vincent">st. vincent</option><option value="sudan">sudan</option><option value="suriname">suriname</option><option value="swaziland">swaziland</option><option value="sweden">sweden</option><option value="switzerland">switzerland</option><option value="syria">syria</option><option value="taiwan">taiwan</option><option value="tanzania">tanzania</option><option value="thailand">thailand</option><option value="togo">togo</option><option value="tortola">tortola</option><option value="trinidad and tobago">trinidad and tobago</option><option value="tunisia">tunisia</option><option value="turkey">turkey</option><option value="turkmenistan">turkmenistan</option><option value="turks and caicos islands">turks and caicos islands</option><option value="u.s. virgin islands">u.s. virgin islands</option><option value="u.s.a.">u.s.a.</option><option value="uganda">uganda</option><option value="ukraine">ukraine</option><option value="united arab emirates">united arab emirates</option><option value="united kingdom">united kingdom</option><option value="uruguay">uruguay</option><option value="uzbekistan">uzbekistan</option><option value="vanuatu">vanuatu</option><option value="vatican city">vatican city</option><option value="venezuela">venezuela</option><option value="vietnam">vietnam</option><option value="yemen">yemen</option><option value="zambia">zambia</option><option value="zimbabwe">zimbabwe</option>
							</select><br><br></div>
					*Cap:<input type="text" class="form-control" placeholder="Cap" aria-label="Cap" aria-describedby="basic-addon1" name="cap"><br><br>
					*Cellulare:<input type="text" class="form-control" placeholder="es. +39 3456789123" aria-label="Cellulare" aria-describedby="basic-addon1" name="cellulare"><br><br>
					*e-mail:<input type="text" class="form-control" placeholder="es. bookcamping@example.com" aria-label="e-mail" aria-describedby="basic-addon1" name="e-mail"><br><br>
					*Username:<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" name="username"><br><br>
					<b>Importante!</b><i> La password deve essere lunga almeno nove caratteri, includere almeno due cifre e non presentare simboli.</i><br><br>
					*Crea una Password:<input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" name="password" id="pwd"><br>
					<input type="button" onclick="showPwd()" value="Mostra/nascondi password">
						<script>
						      function showPwd() {
						        var input = document.getElementById('pwd');
						        if (input.type === "password") {
						          input.type = "text";
						        } else {
						          input.type = "password";
						        }
						      }
						</script>
					<br><br>
					*Conferma la nuova Password:<input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" name="password1" id="pwd1"><br>
					<input type="button" onclick="showPwd1()" value="Mostra/nascondi password">
						<script>
						      function showPwd1() {
						        var input = document.getElementById('pwd1');
						        if (input.type === "password") {
						          input.type = "text";
						        } else {
						          input.type = "password";
						        }
						      }
						</script>
					<br><br>
					<input type="submit" value="Registrati"/>         <input type="reset"  value="Resetta il form"><br>	
					<br><br>
					
					
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>
				</div>
			</div>
		</div>
	</form>	



</body>
</html>