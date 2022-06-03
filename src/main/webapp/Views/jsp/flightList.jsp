<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight List</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	var xmlHttp;
	xmlHttp = GetXmlHttpObject();

	function checkSeats() {
		if (xmlHttp == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		//alert("hi");
		var check = document.getElementById("link").href;
		var flightId = check.split('=');
		//alert(flightId[1]);
		var query = "flid=" + flightId[1];

		xmlHttp.onreadystatechange = function stateChanged() {

			if (xmlHttp.readyState == 4) {
				document.getElementById("error").innerHTML = xmlHttp.responseText;
				var node = document.getElementById("error");

				var txtContent = node.textContent;

				//alert(txtContent);

				if (txtContent == "Seats are available") {
					location.href = ("viewCart.htm");
				}
			}
		};
		xmlHttp.open("POST", "addToCart.htm", true);
		xmlHttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlHttp.send(query);
		return false;

	}

	function GetXmlHttpObject() {
		var xmlHttp = null;
		try {
			// Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
</script>

<style>
#title {
	color: #2f4f4f;
}

table {
	font-family: Arial, sans-serif;
}

thead {
	letter-spacing: 0.2em;
	word-spacing: 0.25em;
}

tr {
	padding: 0 !important;
	margin: 0 !important;
}

td {
	padding: 0 !important;
	margin: 0 !important;
}

#tableBody {
	letter-spacing: 0.1em;
	word-spacing: 0.25em;
	font-size: 0.75em;
}

.light-bg {
	background: #d3d3d3 !important;
}

.table-button {
	background-color: transparent;
	margin: 0;
	border: 0;
	font-size: 1em;
	width: 100%;
}

.table-button:hover {
	background-color: transparent;
}

#statusMsg {
	font-size: 1em;
}
</style>

</head>
<body class="bg-light">
	<div id="content">

		<c:choose>
			<c:when test="${!empty sessionScope.username}">
				<jsp:include page="menu.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="menu2.jsp" />
			</c:otherwise>
		</c:choose>

		<%-- <h2>Following flights are available</h2>
		<table border="1">
			<tr>
				<th class="col bg-secondary light-bg">Flight Number</th>
				<th class="col bg-secondary light-bg">Flight Name</th>
				<th class="col bg-secondary light-bg">Airplane Id</th>
				<th class="col bg-secondary light-bg">Price</th>
				<th class="col bg-secondary light-bg">Departure time</th>
				<th class="col bg-secondary light-bg">Destination arrival time</th>
				<th class="col bg-secondary light-bg">Available Seats</th>
			</tr>
			<c:forEach var="flight" items="${sessionScope.flightlist}">
				<tr>
					<td class="col">${flight.flight_id}</td>
					<td class="col">${flight.flight_name}</td>
					<td class="col">${flight.airplane_id}</td>
					<td class="col">$${flight.amount}</td>
					<td class="col">${flight.deptTime}</td>
					<td class="col">${flight.arrivalTime}</td>
					<td class="col">${flight.availableSeats}</td>
					<td class="col"><a
						href="addToCart.htm?fid=${flight.flight_id}" id="link">Book
							Ticket</a></td>
				</tr>
			</c:forEach>
		</table> --%>
		<div class="container mt-5 mb-5 bg-light rounded">
			<div class="row mb-2">
				<div class="col-md-12 bg-light rounded shadow-lg text-start">
					<div>
						<form action="updateFlights.htm" method="get">
							<table class="table table-light table-responsive table-sm">
								<thead>
									<tr class="d-flex">
										<th class="col-12"><span id="title">Following
												flights are available</span></th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<tr class="d-flex">
									<th class="col  light-bg">Flight Number</th>
										<th class="col bg-secondary light-bg">Flight Name</th>
										<th class="col bg-secondary light-bg">Airplane Id</th>
										<th class="col bg-secondary light-bg">Price</th>
										<th class="col bg-secondary light-bg">Departure Time</th>
										<th class="col bg-secondary light-bg">Departure Date</th>
										<th class="col bg-secondary light-bg">Destination arrival Time</th>
										<th class="col bg-secondary light-bg">Destination arrival Date</th>
										<th class="col bg-secondary light-bg">Available Seats</th>
										<th class="col bg-secondary light-bg"></th>
									</tr>
									<c:forEach var="flight" items="${sessionScope.flightlist}">
										<tr class="d-flex">

											<td class="col">${flight.flight_id}</td>
											<td class="col">${flight.flight_name}</td>
											<td class="col">${flight.airplane_id}</td>
											<td class="col">$${flight.amount}</td>
											<td class="col">${flight.deptTime}</td>
											<td class="col">${flight.deptDate}</td>
											<td class="col">${flight.arrivalTime}</td>
											<td class="col">${flight.arrDate}</td>
											<td class="col">${flight.availableSeats}</td>
											<td class="col"><a
												href="addToCart.htm?fid=${flight.flight_id}" id="link">Book
													Ticket</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</form>
					</div>

				</div>
			</div>
		</div>
		<div id="error" style="color: red"></div>
	</div>
</body>
</html>