<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	

<form method="post" action="/save-login" >
	<label>Username:</label>
	<input type="text" name="name" id="name"><br/>
	<label>Password:</label>
	<input type="password" name="password" id="password"><br/>
	<input type="hidden" name="action" value="loginSubmit"> 
	<p id="failed">Login failed ! </p>
	<input type="submit" value="Submit">
</form>

<c:if test="${loginFailed != null}">

  <script>
    loginP = document.getElementById("failed");
    inputN = document.getElementById("name");
    inputP = document.getElementById("password");
    loginP.style.display = "block";
    inputN.style.animationPlayState = "running";
    inputN.style.borderColor="red";
    inputP.style.animationPlayState = "running";
    inputP.style.borderColor="red";
    console.log("LoginFailed value: " + "${loginFailed}");
    console.log("Code");
  </script>
</c:if>

</body>
</html>