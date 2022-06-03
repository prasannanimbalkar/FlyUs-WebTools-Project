<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Your Trip</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<style>
input:required:focus {
	border: 1px solid red;
	outline: none;
}

@import
	url('https://fonts.googleapis.com/css?family=Poppins:200i,400&display=swap')
	;

body {
	background-color: #e9e9e9;
	font-family: 'Montserrat', sans-serif;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.4;
	color: #f3f3f3;
	margin: 0;
}

/*mobile friendly alternative to using  background-attachment: fixed */
body::before {
	background-color: #e9e9e9;
	font-family: 'Montserrat', sans-serif;
	content: '';
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	z-index: -1;
	background: var(- -color-darkblue);
	background-image: linear-gradient(115deg, rgba(233, 233, 233, 0.8),
		rgba(233, 233, 233, 0.7)),
		url(https://media.cntraveler.com/photos/58051a446f39a9b41381a212/16:9/w_2560%2Cc_limit/GettyImages-185331541.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}

h1 {
	font-weight: 400;
	line-height: 1.2;
}

p {
	font-size: 1.125rem;
}

h1, p {
	margin-top: 0;
	margin-bottom: 0.5rem;
}

label {
	display: flex;
	align-items: center;
	font-size: 1.125rem;
	margin-bottom: 0.5rem;
}

input, button, select, textarea {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

button {
	border: none;
}

.container2 {
	display: block;
	position: relative;
	z-index: 0;
	margin: 4rem auto 0;
	padding: 5rem 4rem 0 4rem;
	width: 100%;
	max-width: 525px;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/283591/login-background.jpg);
	box-shadow: 0 50px 70px -20px rgba(0, 0, 0, 0.85);
}

.container2::after {
	content: '';
	display: inline-block;
	position: absolute;
	z-index: 0;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-image: radial-gradient(ellipse at left bottom, rgba(22, 24, 47, 1)
		0%, rgba(38, 20, 72, .9) 59%, rgba(17, 27, 75, .9) 100%);
	box-shadow: 0 -20px 150px -20px rgba(0, 0, 0, 0.5);
}

@media ( min-width : 576px) {
	.container2 {
		max-width: 540px;
	}
}

@media ( min-width : 768px) {
	.container2 {
		max-width: 720px;
	}
}

.header {
	padding: 0 0.625rem;
	margin-bottom: 1.875rem;
}

.description {
	font-style: italic;
	font-weight: 200;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
}

.clue {
	margin-left: 0.25rem;
	font-size: 0.9rem;
	color: #e4e4e4;
}

.text-center {
	text-align: center;
}

/* form */
form {
	padding: 2.5rem 0.625rem;
	border-radius: 0.25rem;
	position: relative;
	z-index: 1;
	padding-bottom: 4.5rem;
	border-bottom: 1px solid rgba(255, 255, 255, 0.25);
}

@media ( min-width : 480px) {
	form {
		padding: 2.5rem;
	}
}

.form-group {
	margin: 0 auto 1.25rem auto;
	padding: 0.25rem;
}

.form-control {
	display: block;
	width: 100%;
	height: 2.375rem;
	padding: 0.375rem 0.75rem;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control:focus {
	border-color: #80bdff;
	outline: 0;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.input-radio, .input-checkbox {
	display: inline-block;
	margin-right: 0.625rem;
	min-height: 1.25rem;
	min-width: 1.25rem;
}

.input-textarea {
	min-height: 120px;
	width: 100%;
	padding: 0.625rem;
	resize: vertical;
}

.submit-button {
	display: block;
	width: 100%;
	padding: 0.75rem;
	background: #37af65;
	color: inherit;
	border-radius: 2px;
	cursor: pointer;
}
</style>

</head>
<body>

	<c:choose>
		<c:when test="${!empty sessionScope.username}">
			<jsp:include page="menu.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="menu2.jsp" />
		</c:otherwise>
	</c:choose>

	<h1
		style="color: purple; background-color: lightgray; padding: 10px 100px;">FlyUs</h1>



	<div class="container2">
		<!-- <header class="header"> </header> -->
		<form:form action="listflights.htm" modelAttribute="flightInformation"
			commandName="flightInformation" method="post">
			<div class="form-group">
				<label id="name-label" for="name">From</label>
				<form:input type="text" path="from" size="30" id="from"
					list="json-datalist" onkeyup="return names()" required="required" />
				<font color="red"><form:errors path="from" /></font>
			</div>
			
			<div class="form-group">
				<label id="email-label" for="email">Destination</label>
				<form:input type="text" path="dest" id="dest" list="json-datalist1"
					onkeyup="return names1()" size="30" required="required" />
				<font color="red"><form:errors path="dest" /></font>
			</div>
			
			<div class="form-group">
				<label id="number-label">Departure Date</label>
				<form:input type="date" path="deptDate" id="txtFromDate" size="30"
					required="required" />
				<font color="red"><form:errors path="deptDate" /></font>
			</div>
			
			<div class="form-group">
				<p>Which package would you like to fly with</p>
				<select id="dropup" name="package" class="form-control">
					<option disabled selected>Select Package you would like
						to fly with</option>
					<option value="Economy">Economy-class</option>
					<option value="Business">Business-class</option>
				</select>
			</div>



			<div class="form-group">
				<button type="submit" id="submit" class="submit-button"
					value="Search flights">Submit</button>
			</div>


		</form:form>
	</div>


</body>
</html>