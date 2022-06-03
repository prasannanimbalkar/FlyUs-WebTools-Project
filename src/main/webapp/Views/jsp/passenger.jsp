<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passenger Details</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style>
input:required:focus {
	border: 1px solid red;
	outline: none;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
	function validateEmail(email) {
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}

	function validate() {
		$("#result").text("");
		var email = $("#email").val();
		if (validateEmail(email)) {
			$("#result").text(email + " is valid :)");
			$("#result").css("color", "green");
		} else {
			$("#result").text(email + " is not valid :(");
			$("#result").css("color", "red");
		}
		return false;
	}

	$("form").bind("submit", validate);
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
}</style>
</head>
<body>
	<h1>Please enter all details correctly</h1>
	 <form:form action="passenger.htm" modelAttribute="passenger"
		commandName="passenger" method="post">
		<table>
			<c:forTokens items="i" delims="${sessionScope.noOfTravellers}">
				<tr class="d-flex">
					<td class="col">First Name:</td>
					<td class="col"><form:input type="text" path="firstName"
							size="30" /> <font color="red"><form:errors
								path="firstName" /></font></td>
				</tr>
				<tr class="d-flex">
					<td class="col">Last Name:</td>
					<td class="col"><form:input type="text" path="lastName"
							size="30" /> <font color="red"><form:errors
								path="lastName" /></font></td>
				</tr>
				<tr class="d-flex">
					<td class="col">Gender</td>
					<td class="col"><form:radiobutton value="M" path="gender"
							checked="checked" />Male <form:radiobutton value="F"
							path="gender" />Female</td>
				</tr>
				<tr class="d-flex">
					<td class="col">Email:</td>
					<td class="col"><form:input type="text" path="email"
							id='email' size="30" /> <font color="red"><form:errors
								path="email" /></font></td>
				</tr>
				<tr class="d-flex">
					<td class="col">Date of Birth:</td>
					<td class="col"><form:input type="text" path="dob" id="dob"
							size="30" /> <font color="red"><form:errors path="dob" /></font></td>
				</tr>
				<tr class="d-flex">
					<td class="col">Phone Number:</td>
					<td class="col"><form:input type="text" path="phonenum"
							size="30" /> <font color="red"><form:errors
								path="phonenum" /></font></td>
				</tr>
				<tr class="d-flex">
					<td class="col">Address:</td>
					<td class="col"><form:input type="textarea" path="address"
							size="30" /> <font color="red"><form:errors
								path="address" /></font></td>
				</tr>
			</c:forTokens>
			<tr class="d-flex">
				<td colspan="2"><input type="submit"
					value="Save Details and Enter payment details" /></td>
			</tr>
		</table>
	</form:form>
 


	<%-- <div class="container mt-5 mb-5 bg-light rounded">
		<div class="row mb-2">
			<div class="col-md-12 bg-light rounded shadow-lg text-start">
				<div>
					<form:form action="passenger.htm" modelAttribute="passenger"
		commandName="passenger" method="post">
						<table class="table table-light table-responsive table-sm">
							<thead>
								<tr class="d-flex">
									<th class="col-12"><span id="title">Please enter
											all details correctly</span></th>
								</tr>
							</thead>
							<tbody id="tableBody">

								<c:forTokens items="i" delims="${sessionScope.noOfTravellers}">
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



										<tr class="d-flex"><td class="col">First Name:</td>
										<td class="col"><form:input type="text" path="firstName"
												size="30" /> <font color="red"><form:errors
													path="firstName" /></font></td>
									</tr>


										<tr class="d-flex"><td class="col">Last Name:</td>
										<td class="col"><form:input type="text" path="lastName"
												size="30" /> <font color="red"><form:errors
													path="lastName" /></font></td>
									</tr>


										<tr class="d-flex"><td class="col">Gender</td>
										<td class="col"><form:radiobutton value="M" path="gender"
												checked="checked" />Male <form:radiobutton value="F"
												path="gender" />Female</td>
									</tr>


										<tr class="d-flex"><td class="col">Email:</td>
										<td class="col"><form:input type="text" path="email"
												id='email' size="30" /> <font color="red"><form:errors
													path="email" /></font></td>
									</tr>


										<tr class="d-flex"><td class="col">Date of Birth:</td>
										<td class="col"><form:input type="text" path="dob"
												id="dob" size="30" /> <font color="red"><form:errors
													path="dob" /></font></td>
									</tr>


										<tr class="d-flex"><td class="col">Phone Number:</td>
										<td class="col"><form:input type="text" path="phonenum"
												size="30" /> <font color="red"><form:errors
													path="phonenum" /></font></td>
									</tr>


										<tr class="d-flex"><td class="col">Address:</td>
										<td class="col"><form:input type="textarea"
												path="address" size="30" /> <font color="red"><form:errors
													path="address" /></font></td>
									</tr>

									</tr>

								</c:forTokens>

							</tbody>
						</table>
					</form:form>
				</div>

			</div>
		</div>
	</div> --%>


</body>
</html>