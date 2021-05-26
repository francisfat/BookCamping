<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login</title>
		<style>
			h1 {color:brown;}
			input {color:brown;}
			p {color:brown;}
			.colore {color:orange;}
			.grande {font-size:24px;}
		</style>
	</head>
	<body>
		<h1>Login Page</h1><br>
		<form action="${pageContext.request.contextPath}/login" method="POST">
	Username:<input type="text" name="username"/>
	Password:<input type="password" name=password id="pwd"/><br>
			<br>
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
			<br>
			<br>
			<input type="submit" value="Login"/><br>
		</form>
	</body>
</html>