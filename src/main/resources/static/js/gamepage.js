let isCached = performance.getEntriesByType("navigation")[0].transferSize === 0;

console.log('page loaded: ', isCached);
if(isCached){
	window.location.replace("/login");

}

//AJAX USAGE

document.getElementById("logoutButton").addEventListener("click", function() {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/logout", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send();
});