<!DOCTYPE html>
<html>
<head>
<title>Game Select</title>
<link href="/css/gamepage.css" rel="stylesheet" type="text/css">
<script src="/js/gamepage.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>



	<div id="header">
		<div id="header-text">
			<h2>Welcome, ${user.name}!</h2>
			<p>Current balance : ${user.balance}</p>

		</div>
		<div id="user-options">
			<form action="account" method="post">
				<input type="submit" value="Account">
			</form>
			<form action="/logout" method="post">
				<input type="submit" value="Logout">
			</form>
		</div>
	</div>

	<div class="main">
		<div class="game-options">
			<form action="/secured/start-game" method="post">
				<div class="game-card">
					<img src="/img/blackjack.png" alt="Blackjack">
					<h3>Blackjack</h3>
					<p>Play the classic card game against the dealer.</p>
					<button type="submit" name="game" value="blackjack">Play
						now</button>
				</div>
			</form>
			<form action="/secured/start-game" method="post">
				<div class="game-card">
					<img src="/img/roulette.jpg" alt="Roulette">
					<h3>Roulette</h3>
					<p>Spin the wheel and place your bets.</p>
					<button type="submit" name="game" value="roulette">Play
						now</button>
				</div>
			</form>
			<form action="/secured/start-game" method="post">
				<div class="game-card">
					<img src="/img/coinflip.jpg" alt="Coinflip">
					<h3>Coinflip</h3>
					<p>Heads or tails? Place your bets.</p>
					<button type="submit" name="game" value="coinflip">Play
						now</button>
				</div>
			</form>
			<form action="/secured/start-game" method="post">
				<div class="game-card">
					<img src="/img/slots.jpg" alt="Slots">
					<h3>Slots</h3>
					<p>Spin the reels and win big.</p>
					<button type="submit" name="game" value="slots">Play now</button>
				</div>
			</form>
		</div>
	</div>



</body>
</html>
