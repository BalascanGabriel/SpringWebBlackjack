let deck = [];
const suits = ['hearts', 'diamonds', 'spades', 'clubs'];
const values = [
	'ace', 'king', 'queen', 'jack',
	'10', '9', '8', '7', '6',
	'5', '4', '3', '2'
];
function generateDeck() {
	for (let suit in suits) {
		for (let value in values) {
			deck.push(values[value] + '_of_' + suits[suit]);
		}
	}
}

function showInGame(gameIsRunning) {

	let newGameButton = document.getElementById('start-button');
	let hitButton = document.getElementById('hit-button');
	let stayButton = document.getElementById('stand-button');
	if (gameIsRunning) {
		hitButton.removeAttribute("disabled");
		stayButton.removeAttribute("disabled");
		newGameButton.setAttribute("disabled", "disabled");
	} else {
		hitButton.setAttribute("disabled", "disabled");
		stayButton.setAttribute("disabled", "disabled");
		newGameButton.removeAttribute("disabled");
	}
}

let dealerCards = [];
let playerCards = [];
// dealerCards.push(30);
// let dealerCards : string[] = [];
// let dealerCards : Array<string> = [];
// // dealerCards.push(30); <- eroare

// TODO: use just one global variable
const game = {
	deck: [],
	suits: ['hearts', 'diamonds', 'spades', 'clubs'],
	values: [
		'ace', 'king', 'queen', 'jack',
		'10', '9', '8', '7', '6',
		'5', '4', '3', '2'
	],
	dealerCards: [],
	playerCards: []
};

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
	switch (card.split('_')[0]) {
		case 'jack':
		case 'queen':
		case 'king':
			return 10;
		case 'ace':
			return 11;
		default:
			return parseInt(card.split('_')[0]);
	}
}

function updateScores() {
	let dealerScore = 0;
	let playerScore = 0;
	for (let i = 0; i < dealerCards.length; i++) {
		dealerScore += getCardNumericValue(dealerCards[i]);
	}
	for (let i = 0; i < playerCards.length; i++) {
		playerScore += getCardNumericValue(playerCards[i]);
	}

	return {
		dealerScore: dealerScore,
		playerScore: playerScore
	}
}
function checkForEndOfGame(statusObj) {
	let result = { gameOver: false, win: null, bust: false };
	let resultUpdate = updateScores();

	if (statusObj) {
		if (statusObj.lastAction == 'stand') {
			if (resultUpdate.dealerScore > 21) {
				result.gameOver = true;
				result.win = 'player';
				result.bust = true;
				return result;
			} else if (resultUpdate.dealerScore > resultUpdate.playerScore){
				result.gameOver = true;
				result.win = 'dealer';
				return result;

			}else{
				result.gameOver = true;
				result.win = 'player';
				return result;
			}
		}
	}



	if (resultUpdate.dealerScore === 21) {
		// dealer wins with a score of 21
		result.gameOver = true;
		result.win = 'dealer';
	} else if (resultUpdate.playerScore === 21) {
		// player wins with a score of 21
		result.gameOver = true;
		result.win = 'player';
	} else if (resultUpdate.dealerScore > 21) {
		// player wins, dealer busts
		result.gameOver = true;
		result.win = 'player';
		result.bust = true;
	} else if (resultUpdate.playerScore > 21) {
		// dealer wins, player busts
		result.gameOver = true;
		result.win = 'dealer';
		result.bust = true;
	}
	return result;
}

function endGame() {
	dealerCards = [];
	playerCards = [];
	deck = [];
	showInGame(false);
}

function showStatus(status) {
	let res = updateScores();
	let dealerScore = res.dealerScore; //  updateScores().dealerScore;
	let playerScore = res.playerScore; // updateScores().playerScore;

	let resultEndGame = checkForEndOfGame(status);


	let dealerScoreBoard = document.getElementById('dealer-score');
	let playerScoreBoard = document.getElementById('player-score');

	dealerScoreBoard.innerText = 'Dealer Score: ' + dealerScore;
	playerScoreBoard.innerText = 'Player Score: ' + playerScore;
	console.log('reg: ', resultEndGame);
	if (resultEndGame.gameOver) {
		if (resultEndGame.win === 'player') {
			playerScoreBoard.innerText += " YOU WIN!"; // TODO: modif
		} else if (resultEndGame.win != 'player') {
			dealerScoreBoard.innerText += " DEALER WINS";
		}
		for (var i = 0; i < deck.length; i++) {
			deck[i] = 'blank';
		}
		let newGameButton = document.getElementById('start-button');
		let hitButton = document.getElementById('hit-button');
		let stayButton = document.getElementById('stand-button');
		// newGameButton.style.display = 'inline';
		// hitButton.style.display = 'none';
		// stayButton.style.display = 'none';
	}
	if (resultEndGame.gameOver) {
		endGame();
	}
}

function dealCards() {
	playerCards = [getNextCard(), getNextCard()];
	dealerCards = [getNextCard(), getNextCard()];
}

function createBoard(secondCardHidden = true) {
	let dealerHand = document.getElementById('dealer-hand');
	let playerHand = document.getElementById('player-hand');

	let hitButton = document.getElementById('hit-button');
	let stayButton = document.getElementById('stand-button');
	// hitButton.removeAttribute("disabled")
	// stayButton.removeAttribute("disabled")
	dealerHand.innerHTML = '';
	playerHand.innerHTML = '';
	for (let i = 0; i < dealerCards.length; i++) {
		let cardImage = document.createElement('div');
		
		cardImage.classList.add('card');
		cardImage.style.backgroundImage = 'url(/img/' + dealerCards[i] + '.png)';
		dealerHand.appendChild(cardImage);
	}
	let secondCardDiv = document.querySelector('#dealer-hand .card:nth-child(2)')
	if(secondCardHidden){
		
		secondCardDiv.style.backgroundImage	= 'url(/img/' + 'card-back' + '.png)'
	}else{
		secondCardDiv.style.backgroundImage = 'url(/img/' + dealerCards[1] + '.png)';
	}

	for (let i = 0; i < playerCards.length; i++) {
		let cardImage = document.createElement('div');
		cardImage.classList.add('card');
		cardImage.style.backgroundImage = 'url(/img/' + playerCards[i] + '.png)';
		playerHand.appendChild(cardImage);
	}
}

function startGame() {
	generateDeck();
	shuffleDeck();
	dealCards();
	createBoard();
	showStatus();
	showInGame(true);

	let resultEndGame = checkForEndOfGame();
	if (resultEndGame.gameOver) {
		endGame();
	}
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
	let resultUpdate = updateScores();
	while (resultUpdate.dealerScore < 17) {
		dealerCards.push(getNextCard());
		createBoard(false);
		resultUpdate = updateScores();
	}

	let resultEnd = checkForEndOfGame({ lastAction: 'stand' });
	showStatus({ lastAction: 'stand' });
	if (resultEnd.gameOver) {
		endGame();
	}
	
});
