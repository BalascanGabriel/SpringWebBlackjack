<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coin Flip Game</title>
	  <link href="/css/gamepage.css" rel="stylesheet" type="text/css">
	      <meta name="viewport" content="width=device-width, initial-scale=1">
	  

<style>
    #coin {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background-color: #ccc;
    position: relative;
    overflow: hidden;
    margin: 0 auto;
    margin-top: 50px;
}

#coin img {
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#coin.flip img {
    opacity: 1;
    animation: flip 1s;
}

@keyframes flip {
    from {
        transform: rotateY(0deg);
    }
    to {
        transform: rotateY(480deg);
    }
}


    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 50px;
    }
    label, input, select {
        margin-bottom: 10px;
    }
    button {
        margin-top: 10px;
        background-color: #007bff;
        border: none;
        color: white;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0069d9;
    }
</style>
</head>
<body>
    <h1>Coin Flip Game</h1>
    <form action="${pageContext.request.contextPath}/secured/coinflip" method="post">
        <label for="betAmount">Bet amount:</label>
        <input type="number" id="betAmount" name="betAmount" required>
        <br>
        <label for="coinSide">Choose heads or tails:</label>
        <select id="coinSide" name="coinSide" required>
            <option value="heads">Heads</option>
            <option value="tails">Tails</option>
        </select>
        <br>
        <button type="button" id="startButton">Start</button>
    </form>
    <div id="coin">
        <img id="heads" src="/img/heads.jpg">
        <img id="tails" src="/img/tails.jpg">
    </div>
    <script>
        var coin = document.querySelector("#coin");
        var heads = document.querySelector("#heads");
        var tails = document.querySelector("#tails");
        var startButton = document.querySelector("#startButton");
        
        startButton.addEventListener("click", function() {
            coin.classList.add("flip");
            setTimeout(function() {
                coin.classList.remove("flip");
                var result = Math.random() >= 0.5 ? "heads" : "tails";
                if (result === "heads") {
                    heads.style.opacity = 1;
                    tails.style.opacity = 0;
                } else {
                    heads.style.opacity = 0;
                    tails.style.opacity = 1;
                }
            }, 500);
        });
    </script>
</body>
</html>
