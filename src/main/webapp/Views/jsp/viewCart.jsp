<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Cart</title>
</head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles/table.css">

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
	margin: 2px;
	font-size: 12px;
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

<body class="bg-light">
	<c:choose>
		<c:when test="${!empty sessionScope.username}">
			<jsp:include page="menu.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="menu2.jsp" />
		</c:otherwise>
	</c:choose>
	<%-- <c:choose>
		<c:when test="${!empty sessionScope.cart}">
			<h3>Your cart contents</h3>
			<table border="1">
				<tr>
					<th class="col bg-secondary light-bg">Flight Number</th>
					<th class="col bg-secondary light-bg">Flight Name</th>
					<th class="col bg-secondary light-bg">Airplane Id</th>
					<th class="col bg-secondary light-bg">Price</th>
					<th class="col bg-secondary light-bg">Departure Time</th>
					<th class="col bg-secondary light-bg">Departure Date</th>
					<th class="col bg-secondary light-bg">Arrival Time</th>
					<th class="col bg-secondary light-bg">Arrival Date</th>
				</tr>
				<c:forEach var="flight" items="${sessionScope.cart}">
					<tr>
						<td class="col">${flight.flight_id}</td>
						<td class="col">${flight.flight_name}</td>
						<td class="col">${flight.airplane_id}</td>
						<td class="col">$${flight.amount}</td>
						<td class="col">${flight.deptTime}</td>
						<td class="col">${flight.deptDate}</td>
						<td class="col">${flight.arrivalTime}</td>
						<td class="col">${flight.arrDate}</td>
						<td class="col"><a
							href="removeFromCart.htm?action=remove&id=${flight.flight_id}">
								[Remove from cart]</a></td>
					</tr>

				</c:forEach>
				<tr>
					<td class="col"></td>
					<td class="col"></td>
				</tr>
				<tr>
					<td class="col">Total</td>
					<td class="col">${sessionScope.total}</td>
				</tr>
			</table>
			<br>
			<br>
			<a href="passenger1.htm"> Proceed to enter details and Payment>></a>
		</c:when> --%>


	<div class="container mt-5 mb-5 bg-light rounded">
		<div class="row mb-2">
			<div class="col-md-12 bg-light rounded shadow-lg text-start">
				<div>

					<c:choose>
						<c:when test="${!empty sessionScope.cart}">
							<table class="table table-light table-responsive table-sm">
								<thead>
									<tr class="d-flex">
										<th class="col-12"><span id="title">Following
												flights are available</span></th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<tr class="d-flex">
										<th class="col bg-secondary light-bg">Flight Number</th>
										<th class="col bg-secondary light-bg">Flight Name</th>
										<th class="col bg-secondary light-bg">Airplane Id</th>
										<th class="col bg-secondary light-bg">Price</th>
										<th class="col bg-secondary light-bg">Departure Time</th>
										<th class="col bg-secondary light-bg">Departure Date</th>
										<th class="col bg-secondary light-bg">Arrival Time</th>
										<th class="col bg-secondary light-bg">Arrival Date</th>
										<th class="col bg-secondary light-bg"></th>
									</tr>
									<c:forEach var="flight" items="${sessionScope.cart}">
										<tr class="d-flex">

											<td class="col">${flight.flight_id}</td>
											<td class="col">${flight.flight_name}</td>
											<td class="col">${flight.airplane_id}</td>
											<td class="col">$${flight.amount}</td>
											<td class="col">${flight.deptTime}</td>
											<td class="col">${flight.deptDate}</td>
											<td class="col">${flight.arrivalTime}</td>
											<td class="col">${flight.arrDate}</td>
											<td class="col"><a
												href="removeFromCart.htm?action=remove&id=${flight.flight_id}">
													Delete</a></td>
										</tr>
									</c:forEach>
									<tr class="d-flex">
										<td class="col"></td>
										<td class="col"></td>
									</tr>
									<tr class="d-flex">
										<td class="col"><h5>Total</h5></td>
										<td class="col"><h5>${sessionScope.total}</h5></td>
									</tr>
								</tbody>
							</table>
							<br>
							<div style="display: flex; justify-content: center; padding: 20px 0 20px 0; text-decoration: none;">
								<a href="passenger1.htm"> Proceed to enter details and
									Payment>></a>
							</div>
						</c:when>




						<c:otherwise>
							<h3>Oops.. your cart is empty</h3>
							<p>
								<a href="index.htm">Return to main page</a>
							</p>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>
	</div>
</body>
</html>