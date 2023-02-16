<!DOCTYPE html>
<html>
  <head>
   <link href="/css/slots.css" rel="stylesheet" type="text/css">
    
  </head>
  <body>
 
 <div id="player-info">
  	<h3>Player : ${user.name}</h3>
  	<h4>Balance : ${user.balance }</h4>
  </div>
 
    <table>
      <tr>
        <td><img src='/img/1.png' /></td>
        <td><img src='/img/2.png' /></td>
        <td><img src='/img/3.png' /></td>
      </tr>
      <tr>
        <td><img src='/img/4.png' /></td>
        <td><img src='/img/5.png' /></td>
        <td><img src='/img/6.png' /></td>
      </tr>
      <tr>
        <td><img src='/img/7.png' /></td>
        <td><img src='/img/8.png' /></td>
        <td><img src='/img/9.png' /></td>
      </tr>
    </table>
    <input type="button" value="Spin" onclick="spin()" />
    
    <script src="js/slots.js"></script>
  </body>
</html>
