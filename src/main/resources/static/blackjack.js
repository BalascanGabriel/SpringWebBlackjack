
    let cardValues = {
    	    1: 'img/ace.png',
    	    2: 'img/two.png',
    	    3: 'img/three.png',
    	    4: 'img/four.png',
    	    5: 'img/five.png',
    	    6: 'img/six.png',
    	    7: 'img/seven.png',
    	    8: 'img/eight.png',
    	    9: 'img/nine.png',
    	    10: 'img/ten.png',
    	    11: 'img/ace.png',
    	    12: 'img/jack.png',
    	    13: 'img/queen.png',
    	    14: 'img/king.png'
    	};
    	let sum = 0;
    	let sumDealer=0;
    	let hasBlackJack = false;
    	let dealerHasBlackJack = false;
    	let isAlive = false;
    	let message = "";
    	let messageEl = document.getElementById("message-el");
    	let sumEl = document.getElementById("sum-el");
    	let cardsEl = document.getElementById("cards-el");
    	let playerEl = document.getElementById("player-el");
    	let dealerEl = document.getElementById("dealer-el");
    	let dealerSum = document.getElementById("dealer-sum");


    	function getRandomCard() {
    	    let randomNumber = Math.floor( Math.random()*14 ) + 1;
    	    if (randomNumber > 10) {
    	        return 10;
    	    } else if (randomNumber === 1) {
    	        return 11;
    	    } else {
    	        return randomNumber;
    	    }
    	}

    	function startGame() {
    	    isAlive = true;
    	    let firstCard = getRandomCard();
    	    let secondCard = getRandomCard();
    	    cards = [firstCard, secondCard];
    	    sum = firstCard + secondCard;
    	    renderGame();
    	}

    	function renderGame() {
    	    cardsEl.textContent = "Cards: ";
    	    for (let i = 0; i < cards.length; i++) {
    	        cardsEl.textContent += cards[i] + " ";
    	    }
    	    
    	    sumEl.textContent = "Sum: " + sum;
    	    if (sum <= 20) {
    	        message = "Do you want to draw a new card?";
    	    } else if (sum === 21) {
    	        message = "You've got Blackjack!";
    	        hasBlackJack = true;
    	    } else {
    	        message = "You're out of the game!";
    	        isAlive = false;
    	    }
    	    messageEl.textContent = message;
    	}

    	function renderGameDealer() {
    		dealerEl.textContent = "Cards: ";
    	    for (let i = 0; i < cards.length; i++) {
    	    	dealerEl.textContent += cards[i] + " ";
    	    }
    	    
    		dealerSum.textContent = "Sum: " + sumDealer;
    	    if (sumDealer <= 20) {
    	        newCard();
    	    } else if (sumDealer === 21) {
    	        message = "You've got Blackjack!";
    	        dealerHasBlackJack = true;
    	    } else {
    	        message = "Dealer lost!";
    	        isAlive = false;
    	    }
    	    messageEl.textContent = message;
    	}


    	function newCard() {
    	    if (isAlive === true && hasBlackJack === false) {
    	        let card = getRandomCard();
    	        sum += card;
    	        cards.push(card);
    	        renderGame()   ;     
    	    }
    	}
    	
    	function stand(){
    		isAlive = false;
    	    let firstCard = getRandomCard();
    	    let secondCard = getRandomCard();
    	    cards = [firstCard, secondCard];
    	    dealerSum = firstCard + secondCard;
    	    renderGameDealer();
    	}
    	
    	

    