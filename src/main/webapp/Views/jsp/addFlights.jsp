<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Flight</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#txtFromDate").datepicker({
			numberOfMonths : 2,
			minDate : 0,
			onSelect : function(selected) {
				$("#txtToDate").datepicker("option", "minDate", selected)
			}
		});
		$("#txtToDate").datepicker({
			numberOfMonths : 2,
			onSelect : function(selected) {
				$("#txtFromDate").datepicker("option", "maxDate", selected)
			}
		});
	});
</script>
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
	<%-- <form:form action="addflights.htm" modelAttribute="fd" commandName="fd"
		method="post">
		<table>
			<tr>
				<td>Flight Name</td>
				<td><form:input type="text" path="flight_name" size="30" /><font
					color="red"><form:errors path="flight_name" /></font></td>
			</tr>
			<tr>
				<td>Airplane Id</td>
				<td><form:input type="text" path="airplane_id" size="30" /><font
					color="red"><form:errors path="airplane_id" /></font></td>
			</tr>
			<tr>
				<td>From</td>
				<td><form:input type="text" path="from" size="30" /><font
					color="red"><form:errors path="from" /></font></td>
			</tr>
			<tr>
				<td>Dest</td>
				<td><form:input type="text" path="dest" size="30" /><font
					color="red"><form:errors path="dest" /></font></td>
			</tr>
			<tr>
				<td>Departure Time</td>
				<td><form:input type="text" path="deptTime" size="30" /><font
					color="red"><form:errors path="deptTime" /></font></td>
			</tr>
			<tr>
				<td>Arrival Time</td>
				<td><form:input type="text" path="arrivalTime" size="30" /><font
					color="red"><form:errors path="arrivalTime" /></font></td>
			</tr>
			<tr>
				<td>Travel Class</td>
				<td><form:input type="text" path="travelClass" size="30" /><font
					color="red"><form:errors path="travelClass" /></font></td>
			</tr>
			<tr>
				<td>Total Seats</td>
				<td><form:input type="text" path="totalSeats" size="30" /><font
					color="red"><form:errors path="totalSeats" /></font></td>
			</tr>
			<tr>
				<td>Available Seats</td>
				<td><form:input type="text" path="availableSeats"
						value="${requestScope.flight.availableSeats}" size="30" /><font
					color="red"><form:errors path="availableSeats" /></font></td>
			</tr>
			<tr>
				<td>Amount</td>
				<td><form:input type="text" path="amount" size="30" /><font
					color="red"><form:errors path="amount" /></font></td>
			</tr>
			<tr>
				<td>Departure Date</td>
				<td><form:input type="text" path="deptDate" id="txtFromDate"
						size="30" /><font color="red"><form:errors path="deptDate" /></font></td>
			</tr>
			<tr>
				<td>Arrival Date</td>
				<td><form:input type="text" path="arrDate" id="txtToDate"
						size="30" /><font color="red"><form:errors path="arrDate" /></font></td>

			</tr>

			<tr>
				<td colspan="2"><input type="submit"
					value="Add flight to database" /></td>
			</tr>
		</table>
	</form:form> --%>


	<div class="container mt-5 mb-5 bg-light rounded">
		<div class="row mb-2">
			<div class="col-md-12 bg-light rounded shadow-lg text-start">
				<div>
					<form:form action="addflights.htm" modelAttribute="fd" commandName="fd" method="post">
						<table class="table table-light table-responsive" >
							<thead>
								<tr class="d-flex">
									<th class="col"><span id="title">Add Flights</span></th>
								</tr>
							</thead>
							<tbody id="tableBody">
								
								<tr>
									<td class="col">Flight Name</td>
									<td class="col"><form:input type="text" path="flight_name" size="30" /><font
										color="red"><form:errors path="flight_name" /></font></td>
								</tr>
								<tr>
									<td>Airplane Id</td>
									<td><form:input type="text" path="airplane_id" size="30" /><font
										color="red"><form:errors path="airplane_id" /></font></td>
								</tr>
								<tr>
									<td>From</td>
									<td><form:input type="text" path="from" size="30" /><font
										color="red"><form:errors path="from" /></font></td>
								</tr>
								<tr>
									<td>Dest</td>
									<td><form:input type="text" path="dest" size="30" /><font
										color="red"><form:errors path="dest" /></font></td>
								</tr>
								<tr>
									<td>Departure Time</td>
									<td><form:input type="time" path="deptTime" size="30" /><font
										color="red"><form:errors path="deptTime" /></font></td>
								</tr>
								<tr>
									<td>Arrival Time</td>
									<td><form:input type="time" path="arrivalTime" size="30" /><font
										color="red"><form:errors path="arrivalTime" /></font></td>
								</tr>
								<tr>
									<td>Travel Class</td>
									<td><form:input type="text" path="travelClass" size="30" /><font
										color="red"><form:errors path="travelClass" /></font></td>
								</tr>
								<tr>
									<td>Total Seats</td>
									<td><form:input type="text" path="totalSeats" size="30" /><font
										color="red"><form:errors path="totalSeats" /></font></td>
								</tr>
								<tr>
									<td>Available Seats</td>
									<td><form:input type="text" path="availableSeats"
											value="${requestScope.flight.availableSeats}" size="30" /><font
										color="red"><form:errors path="availableSeats" /></font></td>
								</tr>
								<tr>
									<td>Amount</td>
									<td><form:input type="text" path="amount" size="30" /><font
										color="red"><form:errors path="amount" /></font></td>
								</tr>
								<tr>
									<td>Departure Date</td>
									<td><form:input type="date" path="deptDate"
											id="txtFromDate" size="30" /><font color="red"><form:errors
												path="deptDate" /></font></td>
								</tr>
								<tr>
									<td>Arrival Date</td>
									<td><form:input type="date" path="arrDate" id="txtToDate"
											size="30" /><font color="red"><form:errors
												path="arrDate" /></font></td>

								</tr>

								 <tr>
									<td ><input type="submit"
										value="Add flight to database" /></td>
								</tr>

							</tbody>
						</table>
						<div style="padding: 20px;"><input type="submit"
										value="Add flight to database" /></div>
					</form:form>

				</div>
			</div>
		</div>
	</div>
</body>



</body>
</html>