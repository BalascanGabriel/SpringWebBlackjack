<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Information</title>
	  <link href="/css/accountpage.css" rel="stylesheet" type="text/css">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="sidebar">
		<p>Username:  ${ user.name} </p>
		<p>Balance: ${ user.balance}</p>
		<a href="#" id="change-username-link">Change Username</a>
		<a href="#" id="change-password-link">Change Password</a>
		<a href="#" id="deposit-link">Deposit</a>
		<a href="#" id="withdraw-link">Withdraw</a>
	</div>

	<div class="main">
		<h2>Account Page</h2>

		<form method="post" action="change-username" id="change-username" >
			<h3>Change Username : </h3>
			<label for="username">New Username:</label>
			<input type="text" id="username" name="username" required><br><br>
			<button type="submit">Change</button>
		</form>

		<form method="post" action="change-password" id="change-password">
			<h3>Change Password : </h3>
			<label for="current-password">Current Password:</label>
			<input type="password" id="current-password" name="current-password" required><br><br>
			<label for="new-password">New Password:</label>
			<input type="password" id="new-password" name="new-password" required><br><br>
			<label for="confirm-password">Confirm Password:</label>
			<input type="password" id="confirm-password" name="confirm-password" required><br><br>
			<button type="submit">Change</button>
		</form>

		<form id="deposit">
			<h3>Deposit : </h3>
			<label for="amount">Amount:</label>
			<input type="number" id="amount" name="amount" required><br><br>
			<input type="submit" value="Submit">
		</form>

		<form id="withdraw">
			<h3>Withdraw : </h3>
			<label for="amount">Amount:</label>
			<input type="number" id="amount" name="amount" required><br><br>
			<input type="submit" value="Submit">
		</form>
	</div>
	<script src="/js/account.js"></script>

    

</body>
</html>
