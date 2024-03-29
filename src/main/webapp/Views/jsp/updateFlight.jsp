<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Flight</title>
<style>
input:required:focus {
	border: 1px solid red;
	outline: none;
}
</style>
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
</head>
<body>
	<form:form action="updateFlight.htm" modelAttribute="fd"
		commandName="fd" method="post">
		<table>
			<tr>
				<td>Flight ID</td>
				<td><form:input type="text" path="flight_id"
						value="${requestScope.flight.flight_id}" size="30" /><font
					color="red"><form:errors path="flight_name" /></font></td>
			</tr>
			<tr>
				<td>Flight Name</td>
				<td><form:input type="text" path="flight_name"
						value="${requestScope.flight.flight_name}" size="30" /><font
					color="red"><form:errors path="flight_name" /></font></td>
			</tr>
			<tr>
				<td>Airplane Id</td>
				<td><form:input type="text" path="airplane_id"
						value="${requestScope.flight.airplane_id}" size="30" /><font
					color="red"><form:errors path="airplane_id" /></font></td>
			</tr>
			<tr>
				<td>From</td>
				<td><form:input type="text" path="from"
						value="${requestScope.flight.from}" size="30" /><font color="red"><form:errors
							path="from" /></font></td>
			</tr>
			<tr>
				<td>Dest</td>
				<td><form:input type="text" path="dest"
						value="${requestScope.flight.dest}" size="30" /><font color="red"><form:errors
							path="dest" /></font></td>
			</tr>
			<tr>
				<td>Departure Time</td>
				<td><form:input type="text" path="deptTime"
						value="${requestScope.flight.deptTime}" size="30" /><font
					color="red"><form:errors path="deptTime" /></font></td>
			</tr>
			<tr>
				<td>Arrival Time</td>
				<td><form:input type="text" path="arrivalTime"
						value="${requestScope.flight.arrivalTime}" size="30" /><font
					color="red"><form:errors path="arrivalTime" /></font></td>
			</tr>
			<tr>
				<td>Travel Class</td>
				<td><form:input type="text" path="travelClass"
						value="${requestScope.flight.travelClass}" size="30" /><font
					color="red"><form:errors path="travelClass" /></font></td>
			</tr>
			<tr>
				<td>Total Seats</td>
				<td><form:input type="text" path="totalSeats"
						value="${requestScope.flight.totalSeats}" size="30"
						readonly="true" /><font color="red"><form:errors
							path="totalSeats" /></font></td>
			</tr>
			<tr>
				<td>Available Seats</td>
				<td><form:input type="text" path="availableSeats"
						value="${requestScope.flight.availableSeats}" size="30" /><font
					color="red"><form:errors path="availableSeats" /></font></td>
			</tr>
			<tr>
				<td>Amount</td>
				<td><form:input type="text" path="amount"
						value="${requestScope.flight.amount}" size="30" /><font
					color="red"><form:errors path="amount" /></font></td>
			</tr>
			<tr>
				<td>Departure Date</td>
				<td><form:input type="text" path="deptDate" id="txtFromDate"
						value="${requestScope.flight.deptDate}" size="30" /><font
					color="red"><form:errors path="deptDate" /></font></td>
			</tr>
			<tr>
				<td>Arrival Date</td>
				<td><form:input type="text" path="arrDate" id="txtToDate"
						value="${requestScope.flight.arrDate}" size="30" /><font
					color="red"><form:errors path="arrDate" /></font></td>

			</tr>

			<tr>
				<td colspan="2"><input type="submit"
					value="Update flight to database" /></td>
			</tr>

		</table>



	</form:form>
	<a href="adminHome.htm">Go Back to Menu Page</a>
</body>
</html>