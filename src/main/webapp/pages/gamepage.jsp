<!DOCTYPE html>
<html>
<head>
  <title>Game Select</title>
  <link href="css/style.css" rel="stylesheet" type="text/css">
  
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
			<form action="logout" method="post">
				<input type="submit" value="Logout">
			</form>
		</div>
</div>
	

<div class="main" >
	
  <form method="post" action="start-game">
    <div class="game-options">
        <div class="game-option">
            <input type="radio" name="game" value="blackjack" id="blackjack"/>
            <label for="blackjack">BlackJack</label>
            <p>Play the classic card game against the dealer.</p>
        </div>
        <div class="game-option">
            <input type="radio" name="game" value="roulette" id="roulette"/>
            <label for="roulette">Roulette</label>
            <p>Spin the wheel and place your bets.</p>
        </div>
        <div class="game-option">
            <input type="radio" name="game" value="coinflip" id="coinflip"/>
            <label for="coinflip">Coinflip</label>
            <p>Heads or tails? Place your bets.</p>
        </div>
        <div class="game-option">
            <input type="radio" name="game" value="slots" id="slots"/>
            <label for="slots">Slots</label>
            <p>Spin the reels and win big.</p>
        </div>
    </div>
    <input type="submit" value="Start Game">
  </form>
</div>
  
</body>
</html>
