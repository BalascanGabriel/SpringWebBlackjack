<html>
    <head><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
          
    <style>
        body {
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', Arial, sans-serif;
    font-family: Arial, sans-serif;
	text-align: center;
	background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
    font-weight: bold;
    color: white;
    text-align: center;
	}

		h1 {
    color: goldenrod;
	}

		#message-el {
    font-style: italic;
	}

		button {
    color: #016f32;
    width: 150px;
    background: goldenrod;
    padding-top: 5px;
    padding-bottom: 5px;
    font-weight: bold;
    border: none;
    border-radius: 2px;
    margin-bottom: 2px;
    margin-top: 2px;
	}
        </style>
    </head>
    <body>
        <h1>Blackjack</h1>
       <p id="text-area">Welcome to blackJack</p>
    	<button id="new-game-button">New game</button>
    	<button id="hit-button">Hit</button>
    	<button id="stay-button">Stand</button>
        <script>
        
      //card variables
        let suits = ["Hearts", "Clubs", "Diamonds", "Spades"];
        let values = [
          "Ace",
          "King",
          "Queen",
          "Jack",
          "Ten",
          "Nine",
          "Eight",
          "Seven",
          "Six",
          "Five",
          "Four",
          "Three",
          "Two"
        ];
        //dom variables
        let textArea = document.getElementById("text-area");
        let newGameButton = document.getElementById("new-game-button");
        let hitButton = document.getElementById("hit-button");
        let stayButton = document.getElementById("stay-button");

        //Game Variables
        let gamesStarted = false;
        let gameOver = false;
        let playerWon = false;
        let dealerCards = [];
        let playerCards = [];
        let dealerScore = 0;
        let playerScore = 0;
        let deck = [];

        hitButton.style.display = "none";
        stayButton.style.display = "none";

        newGameButton.addEventListener("click", function() {
          gamesStarted = true;
          gameOver = false;
          playerWon = false;

          deck = createDeck();
          shuffleDeck(deck);
          dealerCards = [getNextCard(), getNextCard()];
          playerCards = [getNextCard(), getNextCard()];

          newGameButton.style.display = "none";
          hitButton.style.display = "inline";
          stayButton.style.display = "inline";
          showStatus();
        });

        hitButton.addEventListener("click", function() {
          playerCards.push(getNextCard());
          checkForEndOfGame();
          showStatus();
        });

        stayButton.addEventListener("click", function() {
          gameOver = true;
          checkForEndOfGame();
          showStatus();
        });

        function createDeck() {
          let deck = [];
          for (let suitIdx = 0; suitIdx < suits.length; suitIdx++) {
            for (let valueIdx = 0; valueIdx < values.length; valueIdx++) {
              let card = {
                suit: suits[suitIdx],
                value: values[valueIdx]
              };
              deck.push(card);
            }
          }
          return deck;
        }

        function showStatus() {
          if (!gamesStarted) {
            textArea.innerText = "Welcome to BlackJack";
            return;
          }

          let dealerCardString = "";
          for (let i = 0; i < dealerCards.length; i++) {
            dealerCardString += getCardString(dealerCards[i]) + "\n";
          }

          let playerCardString = "";
          for (let i = 0; i < playerCards.length; i++) {
            playerCardString += getCardString(playerCards[i]) + "\n";
          }

          updateScores();

          textArea.innerText =
            "Dealer has: \n " +
            dealerCardString +
            "(score:" +
            dealerScore +
            ")\n\n" +
            "Player has: \n " +
            playerCardString +
            "(score:" +
            playerScore +
            ")\n\n";

          if (gameOver) {
            if (playerWon) {
              textArea.innerText += "You Win!";
            } else {
              textArea.innerText += "Dealer Wins!";
            }
            newGameButton.style.display = "inline";
            hitButton.style.display = "none";
            stayButton.style.display = "none";
          }
        }

        function shuffleDeck(deck) {
          for (let i = 0; i < deck.length; i++) {
            let swapIdx = Math.trunc(Math.random() * deck.length);
            let tmp = deck[swapIdx];
            deck[swapIdx] = deck[i];
            deck[i] = tmp;
          }
        }

        function getCardString(card) {
          return card.value + " of " + card.suit;
        }

        function getNextCard() {
          return deck.shift();
        }

        function getCardNumericValue(card) {
          switch (card.value) {
            case "Ace":
              return 1;
            case "Two":
              return 2;
            case "Three":
              return 3;
            case "Four":
              return 4;
            case "Five":
              return 5;
            case "Six":
              return 6;
            case "Seven":
              return 7;
            case "Eight":
              return 8;
            case "Nine":
              return 9;
            default:
              return 10;
          }
        }

        function getScore(cardArray) {
          let score = 0;
          let hasAce = false;
          for (let i = 0; i < cardArray.length; i++) {
            let card = cardArray[i];
            score += getCardNumericValue(card);
            if (card.value === "Ace") {
              hasAce = true;
            }
          }
          if (hasAce && score + 10 <= 21) {
            return score + 10;
          }
          return score;
        }

        function updateScores() {
          dealerScore = getScore(dealerCards);
          playerScore = getScore(playerCards);
        }

        function checkForEndOfGame() {
          updateScores();
          if (gameOver) {
            //let the dealer take cards
            while (
              dealerScore < playerScore &&
              playerScore <= 21 &&
              dealerScore <= 21
            ) {
              dealerCards.push(getNextCard());
              updateScores();
            }
          }

          if (playerScore > 21) {
            playerWon = false;
            gameOver = true;
          } else if (dealerScore > 21) {
            playerWon = true;
            gameOver = true;
          } else if (gameOver) {
            if (playerScore > dealerScore) {
              playerWon = true;
            } else {
              playerWon = false;
            }
            // newGameButton.style.display = "inline";
            // hitButton.style.display = "none";
            // stayButton.style.display = "none";
          }
        }
        </script>
    </body>
    
</html>