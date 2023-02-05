<!DOCTYPE html>
<html>
  <head>
    <style>
   body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
	text-align: center;
	background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
}
      /* Give the table a width and center it on the page */
      table {
        width: 75%;
        margin: 50px auto;
        box-shadow: 0px 0px 10px #333;
        border-radius: 10px;
        overflow: hidden;
      }
      
      /* Style the table cells */
      td {
        background-color: lightgray;
        text-align: center;
        padding: 20px;
      }
      
      /* Give the cells a border and some padding */
      td img {
        width: 50px;
        height: 50px;
        animation: fall 1s ease-in-out;
        border-radius: 50%;
      }
      
      /* Add animation delays for each cell */
      td:nth-child(1) img {
        animation-delay: 0s;
      }
      td:nth-child(2) img {
        animation-delay: 0.2s;
      }
      td:nth-child(3) img {
        animation-delay: 0.4s;
      }
      td:nth-child(4) img {
        animation-delay: 0.6s;
      }
      td:nth-child(5) img {
        animation-delay: 0.8s;
      }
      td:nth-child(6) img {
        animation-delay: 1s;
      }
      td:nth-child(7) img {
        animation-delay: 1.2s;
      }
      td:nth-child(8) img {
        animation-delay: 1.4s;
      }
      td:nth-child(9) img {
        animation-delay: 1.6s;
      }
      
      /* Create the falling animation */
      @keyframes fall {
        0% {
          transform: translateY(-360%);
        }
        100% {
          transform: translateY(0);
        }
      }
      
      /* Style the "Spin" button */
      input[type="button"] {
        margin: 20px auto;
        display: block;
        padding: 10px 20px;
        background-color: blue;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        box-shadow: 0px 0px 10px blue;
      }
    </style>
    <script type="text/javascript">
      function spin() {
        var cells = document.getElementsByTagName("td");
        for (var i = 0; i < cells.length; i++) {
          cells[i].innerHTML = "<img src='img/" + (Math.floor(Math.random() * 9) + 1) + ".png' />";
        }
      }
    </script>
  </head>
  <body>
 
    <table>
      <tr>
        <td><img src='img/1.png' /></td>
        <td><img src='img/2.png' /></td>
        <td><img src='img/3.png' /></td>
      </tr>
      <tr>
        <td><img src='img/4.png' /></td>
        <td><img src='img/5.png' /></td>
        <td><img src='img/6.png' /></td>
      </tr>
      <tr>
        <td><img src='img/7.png' /></td>
        <td><img src='img/8.png' /></td>
        <td><img src='img/9.png' /></td>
      </tr>
    </table>
    <input type="button" value="Spin" onclick="spin()" />
  </body>
</html>
