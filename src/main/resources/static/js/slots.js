 function spin() {
        var cells = document.getElementsByTagName("td");
        for (var i = 0; i < cells.length; i++) {
          cells[i].innerHTML = "<img src='img/" + (Math.floor(Math.random() * 9) + 1) + ".png' />";
          console.log(cells[0]);
        }
      }