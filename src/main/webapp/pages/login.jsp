<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	

<form method="post" action="/save-login" >
	<label>Username:</label>
	<input type="text" name="name" ><br/>
	<label>Password:</label>
	<input type="password" name="password"><br/>
	<input type="hidden" name="action" value="loginSubmit"> 
	<input type="submit" value="Submit">
</form>
</body>
</html>