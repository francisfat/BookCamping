<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>BookCamping: Login</title>
		<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="style.css" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
	</head>
	<body>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar fixed-top">
			  <div class="container">
			  <br><br>
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
			            <li><a class="dropdown-item" href="#top">Log-in</a>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="redregister">Sign-up</a></li>			            
			          </ul>
			        </li>
			      </ul>		      
			    </div>
			  </div>
			</nav>
			
			<div class="container">
				<br><br>
				<%
					String alert = (String) session.getAttribute("alert");
					
					if(alert == "1"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Campi obligatori non inseriti!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "2"){ %>
					    <div class="alert alert-danger" role="alert"  style="top: 60px">
						  Errore! Username o Password non esistenti!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }else if(alert == "11"){ %>
					    <div class="alert alert-success" role="alert" style="top: 60px" >
						  Registrazione effettuata con successo, ora effettua il login!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
				<% }
				%>
				
				<div class="row justify-content-md-center">
					<div class="col-sm-4">
					<br><br><br><br>
						<img src="immagini/logo.png" class="d-block w-100" alt="...">
						<br><h3> Per favore, effettua il login!</h3>
					</div>
				</div>
			   	<br>
  	
				<form class="form-signin" action="${pageContext.request.contextPath}/login" method="POST" >
					<div class="row justify-content-md-center">
						<div class="col-sm-4">
							<br>
							Accedi come:   <select name="tipo" size="1">
								<option value="Utente">Utente</option><option value="Amministratore">Amministratore</option>
							</select>
							<br><br>
							<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" name="username"/>
							<br>
							<input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" name="password" id="pwd"/><br>
							<br>
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
							<input type="submit" value="Login"/><br>
							<br>
							oppure
							<br><br>
							<a href="redregister">Registrati</a><br><br><br>
							</div>
							
					</div>
				</form>
						
		  </div>	
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>	
			
	</body>
</html>