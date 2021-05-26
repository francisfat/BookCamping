<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>bookCamping</title>
			<link href="bootstrap.1-dist/css/bootstrap.min.css" rel="stylesheet">
			<link href="style/style.css" rel="stylesheet">
	</head>
	<body>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar fixed-top">
			  <div class="container">
			    <a class="navbar-brand" href="#">bookCamping</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">Home</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Prenotazioni
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="#">Prenota area Campeggio</a></li>
			            <li><a class="dropdown-item" href="#">Prenota attività</a></li>
			            <li><hr class="dropdown-divider"></li>
			             <li><a class="dropdown-item" href="#">Servizi Gratuiti</a></li>
			            <li><a class="dropdown-item" href="#">Info</a></li>
			          </ul>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link" href="#">Consulta escursioni</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
			        </li>
			      </ul>
			      <form class="d-flex">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
			</nav>
			<div class="container">
				<h1> Vivi un'esperienza memorabile</h1>
				 <h1>a contatto con la natura! </h1>
				<img src="camping.jpg" alt="BookCamping">
				<%
					String user = null;
				if(session.getAttribute("user") == null)
					response.sendRedirect("login.jsp");
				else
					user = (String) session.getAttribute("user");
				%>
				<h3> Hi ${user}</h3>
				<a href="${pageContext.request.contextPath}/logout">logout</a>
				
				<h1> Hello World! </h1>
				<h1> Hello World! </h1>
				<h1> Hello World! </h1>
				<h1> Hello World! </h1>
				<h1> Hello World! </h1>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="bootstrap.1-dist/js/bootstrap.min.js"></script>
			</div>
	</body>
</html>