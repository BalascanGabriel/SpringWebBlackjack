<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Dashboard</title>
</head>
<body>
	<h2>Admin Dashboard</h2>
	
	<%
		// List<ActivityEntry> logs = (List<ActivityEntry>)request.getAttribute("LOGS");
	%>
	
	<input>
	
	
	
	
	
	<h3>Activity Log</h3>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Last Login</th>
				<th>User IP</th>
			</tr>
		</thead>
		<tbody id="tbody-logs">
		
			<%--
				for(ActivityEntry log : logs){
					
					<tr>
						<td><%= log.getId() %></td>
						<td><%= log.getLastLogin() %></td>
						<td><%= log.getUserIp() %></td>
					</tr>
				
				}
			 --%>
		</tbody>
		
	</table>
	
	<button id="next" style="display:none">Next</button>
	<button id="previous" style="display:none">Previous</button>
	
	<button id="load-logs">Load logs</button>
	<script>
	let pageNumber = 0;
	document.getElementById('load-logs').addEventListener('click', function(){
		pageNumber = 0;
		fetch('http://localhost:9050/rest/activity/by-page/'+pageNumber)
			.then(date => date.json())
				.then(date => {
					// asta se executa async
					let continut = '';
					let corp = document.getElementById('tbody-logs');
					for(let log of date.content){
						
						continut += `<tr><td>${log.id}</td><td>${log.lastLogin}</td><td>${log.userIp}</td></tr>`;
					}
					console.log('continut: ', continut);
					corp.innerHTML = continut;
					console.log('pasul 2');
					document.getElementById('load-logs').style.display = "none";
					document.getElementById('next').style.display = "block";

					if(pageNumber = 0){
						document.getElementById('load-logs').style.display = "block";
						document.getElementById('previous').style.display = "none";

					}
				})
				console.log(pageNumber);
	});
	
	document.getElementById('next').addEventListener('click', function(){
		pageNumber ++;
		fetch('http://localhost:9050/rest/activity/by-page/'+pageNumber)
			.then(date => date.json())
				.then(date => {
					// asta se executa async
					let continut = '';
					let corp = document.getElementById('tbody-logs');
					for(let log of date.content){
						
						continut += `<tr><td>${log.id}</td><td>${log.lastLogin}</td><td>${log.userIp}</td></tr>`;
					}
					console.log('continut: ', continut);
					corp.innerHTML = continut;
					console.log('pasul 2');
					document.getElementById('load-logs').style.display = "none";

					document.getElementById('previous').style.display = "block";

					if(date.last == true){
						document.getElementById('load-logs').style.display = "block";
						document.getElementById('next').style.display = "none";
						document.getElementById('previous').style.display = "block";
					}
				})
				console.log(pageNumber);
					
	});
	
	document.getElementById('previous').addEventListener('click', function(){
		-- pageNumber;
		fetch('http://localhost:9050/rest/activity/by-page/' + pageNumber)
			.then(date => date.json())
				.then(date => {
					// asta se executa async
					let continut = '';
					let corp = document.getElementById('tbody-logs');
					for(let log of date.content){
						
						continut += `<tr><td>${log.id}</td><td>${log.lastLogin}</td><td>${log.userIp}</td></tr>`;
					}
					console.log('continut: ', continut);
					corp.innerHTML = continut;
					console.log('pasul 2');
					document.getElementById('load-logs').style.display = "none";
					
				})
				if(pageNumber < 1){
					document.getElementById('previous').style.display = "none";
					document.getElementById('load-logs').style.display = "block";
					document.getElementById('next').style.display = "block";

				}else{
					document.getElementById('next').style.display = "block";

				}
		console.log(pageNumber);
	});
	
	
		/*document.getElementById('load-logs').addEventListener('click', function(){
			console.log('loading logs from server and populating table body');
			let corp = document.getElementById('tbody-logs');
			let continut = '';
			
			
			// let date = fetch('http://localhost:9050/rest/activity/all')
			
			// let ceva = functie(); 
			
			console.log('pasul 1');
			fetch('http://localhost:9050/rest/activity/all')
				.then(date => date.json())
				.then(date => {
					// asta se executa async
					for(let log of date){
						
						/* {
							"id": 2,
							"lastLogin": "2023-01-21T22:00:00.000+00:00",
							"userIp": "0:0:0:0:0:0:0:1"
							}, 
						
						continut += `<tr><td>${log.id}</td><td>${log.lastLogin}</td><td>${log.userIp}</td></tr>`;
					}
					console.log('continut: ', continut);
					corp.innerHTML = continut;
					console.log('pasul 2');
				})
			
			console.log('pasul 3');
		
		})*/
	</script>
	
</body>
</html>