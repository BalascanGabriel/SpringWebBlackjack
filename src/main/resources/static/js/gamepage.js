//AJAX USAGE

document.getElementById("logoutButton").addEventListener("click", function() {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/logout", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send();
});