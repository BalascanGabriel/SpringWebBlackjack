<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Information</title>
	  <link href="/css/gamepage.css" rel="stylesheet" type="text/css">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
</head>
<body>
	<h1>User Information</h1>
	
	<p>Username:  ${ user.name} </p>
	<p>Balance: ${ user.balance}</p>

	<h2>Change Username</h2>
	<form method="post" action="/secured/change-username">
		<label for="new-username">New Username:</label>
		<input type="text" id="new-username" name="newUsername" required>
		<button type="submit">Change</button>
	</form>

	<h2>Change Password</h2>
	<form method="post" action="change-password">
		<label for="current-password">Current Password:</label>
		<input type="password" id="current-password" name="currentPassword" required>
		<label for="new-password">New Password:</label>
		<input type="password" id="new-password" name="newPassword" required>
		<button type="submit">Change</button>
	</form>
	
	<script type="text/javascript" src="/js/account.js"></script>
</body>
</html>
