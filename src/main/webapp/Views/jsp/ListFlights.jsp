<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Flights</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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

	<jsp:include page="menu.jsp" />
	<a href="addflights.htm"> Add flight </a>


	<div class="container mt-5 mb-5 bg-light rounded">
		<div class="row mb-2">
			<div class="col-md-12 bg-light rounded shadow-lg text-start">
				<div>
					<form action="updateFlights.htm" method="get">
						<table class="table table-light table-responsive table-sm">
							<thead>
								<tr class="d-flex">
									<th class="col-12"><span id="title">Flights List</span></th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<tr class="d-flex">
									<th class="col light-bg">Flight Id</th>
									<th class="col bg-secondary light-bg">Airplane Id</th>
									<th class="col bg-secondary light-bg">From</th>
									<th class="col bg-secondary light-bg">Dest</th>
									<th class="col bg-secondary light-bg">Departure Time</th>
									<th class="col bg-secondary light-bg">Arrival Time</th>
									<th class="col bg-secondary light-bg">Travel Class</th>
									<th class="col bg-secondary light-bg">Total Seats</th>
									<th class="col bg-secondary light-bg">Amount</th>
									<th class="col bg-secondary light-bg">Departure Date</th>
									<th class="col bg-secondary light-bg">Arrival Date</th>
									<th class="col bg-secondary light-bg"></th>
									<th class="col bg-secondary light-bg"></th>
								</tr>
								<c:forEach var="flight" items="${sessionScope.listOfFlights}">
									<tr class="d-flex">
										<td class="col">${flight.flight_id}</td>
										<td class="col">${flight.airplane_id}</td>
										<td class="col">${flight.from}</td>
										<td class="col">${flight.dest}</td>
										<td class="col">${flight.deptTime}</td>
										<td class="col">${flight.arrivalTime}</td>
										<td class="col">${flight.travelClass}</td>
										<td class="col">${flight.totalSeats}</td>
										<td class="col">${flight.amount}</td>
										<td class="col">${flight.deptDate}</td>
										<td class="col">${flight.arrDate}</td>
										<td class="col"><a
											href="updateFlights.htm?id=${flight.flight_id}&action=update">Update</a></td>
										<td class="col"><a
											href="deleteFlights.htm?id=${flight.flight_id}">Delete</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>

</body>

</body>
</html>