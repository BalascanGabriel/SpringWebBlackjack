<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Blackjack</title>
  <link href="/css/blackjack.css" rel="stylesheet" type="text/css">
      <meta name="viewport" content="width=device-width, initial-scale=1">
  

<!-- Bug spotted dealer has 21 from the first hand -->
<!-- Also if player has 21 from the first hand -->
  
</head>
<body>
  <h1>Blackjack</h1>
  <div id="player-info">
  	<h3>Player : ${user.name}</h3>
  	<h4>Balance : ${user.balance }</h4>
  </div>
  <div id="dealer-hand"></div>
  <div id="player-hand"></div>
  <button id="start-button">Start Game</button>
  <button id="hit-button" disabled>Hit</button>
  <button id="stand-button" disabled>Stand</button>
  
  
  <div>
  	<div id="dealer-score"></div>
  	<div id="player-score"></div>
  	
  </div>
 <script src="/js/blackjack.js"></script>
</body>
</html>