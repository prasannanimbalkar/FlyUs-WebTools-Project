<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
input:required:focus {
	border: 1px solid red;
	outline: none;
}

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
	<h3>Below are the passengers details</h3>

	<div class="container mt-5 mb-5 bg-light rounded">
		<div class="row mb-2">
			<div class="col-md-12 bg-light rounded shadow-lg text-start">
				<div>
					<table class="table table-light table-responsive table-sm">
						<thead>
							<tr class="d-flex">
								<th class="col-12"><span id="title">Please enter the
										details</span></th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<tr class="d-flex">
								<th class="col bg-secondary light-bg">Passenger Name</th>
								<th class="col bg-secondary light-bg">Passenger Email</th>
								<th class="col bg-secondary light-bg">Flight Name</th>
								<th class="col bg-secondary light-bg">Travelling From</th>
								<th class="col bg-secondary light-bg">Destination</th>
								<th class="col bg-secondary light-bg">Date of travel</th>

							</tr>
							<c:forEach var="passenger" items="${sessionScope.ticketList}">
								<tr class="d-flex">

									<td class="col">${passenger.traveller.firstName}</td>
									<td class="col">${passenger.traveller.email}</td>
									<td class="col">${passenger.flightInformation.flight_name}</td>
									<td class="col">${passenger.flightInformation.from}</td>
									<td class="col">${passenger.flightInformation.dest}</td>
									<td class="col">${passenger.flightInformation.deptDate}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>


	<h3>
		<a href="adminHome.htm">Go Back to Menu Page</a>
	</h3>
</body>
</html>