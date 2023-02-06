<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Blackjack</title>
  <style>
  body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
	text-align: center;
	background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
}

    #dealer-hand, #player-hand {
      display: flex;
      flex-wrap: wrap;
    }
    .card {
      width: 80px;
      height: 120px;
      background-repeat: no-repeat;
      background-size: contain;
      margin: 10px;
    }
  </style>
</head>
<body>
  <h1>Blackjack</h1>
  <div id="dealer-hand"></div>
  <div id="player-hand"></div>
  <button id="start-button">Start Game</button>
  <button id="hit-button" disabled>Hit</button>
  <button id="stand-button" disabled>Stand</button>
  <script>
    const deck = [];
    const suits = ['hearts', 'diamonds', 'spades', 'clubs'];
    const values = [
      'ace', 'king', 'queen', 'jack',
      '10', '9', '8', '7', '6',
      '5', '4', '3', '2'
    ];

    for (let suit in suits) {
      for (let value in values) {
        deck.push(values[value] + '_of_' + suits[suit]);
      }
    }

    let dealerCards = [];
    let playerCards = [];

    function shuffleDeck() {
      for (let i = 0; i < deck.length; i++) {
        let randomIndex = Math.floor(Math.random() * deck.length);
        let temp = deck[i];
        deck[i] = deck[randomIndex];
        deck[randomIndex] = temp;
      }
    }

    function getNextCard() {
      return deck.shift();
    }

    function getCardNumericValue(card) {
      switch(card.split('_')[0]) {
        case 'jack':
        case 'queen':
        case 'king':
          return 10;
        case 'ace':
          return 11;
        default:
          return card.split('_')[0];
      }
    }

    function updateScores() {
      let dealerScore = 0;
      let playerScore = 0;
      for (let i=0; i < dealerCards.length; i++) {
        dealerScore += getCardNumericValue(dealerCards[i]);
      }
      for (let i=0; i < playerCards.length; i++) {
        playerScore += getCardNumericValue(playerCards[i]);
      }

      return {
        dealerScore: dealerScore,
        playerScore
      }
      }
    function checkForEndOfGame() {
    	  updateScores();

    	  if (dealerScore === 21) {
    	    // dealer wins with a score of 21
    	  } else if (playerScore === 21) {
    	    // player wins with a score of 21
    	  } else if (dealerScore > 21) {
    	    // player wins, dealer busts
    	  } else if (playerScore > 21) {
    	    // dealer wins, player busts
    	  }
    	}

    	function showStatus() {
    	  let dealerScore = updateScores().dealerScore;
    	  let playerScore = updateScores().playerScore;

    	  checkForEndOfGame();

    	  let dealerScoreBoard = document.getElementById('dealer-score');
    	  let playerScoreBoard = document.getElementById('player-score');

    	  dealerScoreBoard.innerText = 'Dealer Score: ' + dealerScore;
    	  playerScoreBoard.innerText = 'Player Score: ' + playerScore;

    	  if (gameOver) {
    	    if (playerWon) {
    	      playerScoreBoard.innerText += " YOU WIN!";
    	    } else {
    	      dealerScoreBoard.innerText += " DEALER WINS";
    	    }
    	    for (var i=0; i < deck.length; i++) {
    	      deck[i] = 'blank';
    	    }
    	    newGameButton.style.display = 'inline';
    	    hitButton.style.display = 'none';
    	    stayButton.style.display = 'none';
    	  }
    	}

    	function dealCards() {
    	  playerCards = [getNextCard(), getNextCard()];
    	  dealerCards = [getNextCard(), getNextCard()];
    	}

    	function createBoard() {
    	  let dealerHand = document.getElementById('dealer-hand');
    	  let playerHand = document.getElementById('player-hand');

    	  for (let i=0; i < dealerCards.length; i++) {
    	    let cardImage = document.createElement('div');
    	    cardImage.classList.add('card');
    	    cardImage.style.backgroundImage = 'url(img/' + dealerCards[i] + '.png)';
    	    dealerHand.appendChild(cardImage);
    	  }

    	  for (let i=0; i < playerCards.length; i++) {
    	    let cardImage = document.createElement('div');
    	    cardImage.classList.add('card');
    	    cardImage.style.backgroundImage = 'url(img/' + playerCards[i] + '.png)';
    	    playerHand.appendChild(cardImage);
    	  }
    	}

    	function startGame() {
    	  shuffleDeck();
    	  dealCards();
    	  createBoard();
    	  showStatus();
    	}

    	let startButton = document.getElementById('start-button');
    	startButton.addEventListener('click', startGame);

    	let hitButton = document.getElementById('hit-button');
    	hitButton.addEventListener('click', function() {
    	  playerCards.push(getNextCard());
    	  createBoard();
    	  showStatus();
    	});

    	const standButton = document.getElementById('stand-button');
    	standButton.addEventListener('click', function() {
    	  playerWon = false;
    	  gameOver = true;
    	  while(dealerScore < playerScore && playerScore <= 21 && dealerScore <= 21) {
    	    dealerCards.push(getNextCard());
    	    updateScores();
    	  }

    	  checkForEndOfGame();
    	  showStatus();
    	});




</script>
</body>
</html>