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
<script>
	/* $(document).ready(function() {
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
	}); */

	//AJAX

	var xmlHttp;
	xmlHttp = GetXmlHttpObject();
	function names1() {
		if (xmlHttp == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		var destCities = document.getElementById("dest").value;
		var query = "fromCities=" + destCities;

		xmlHttp.onreadystatechange = function stateChanged() {
			if (xmlHttp.readyState == 4) {

				var dataList = document.getElementById('json-datalist1');
				var json = JSON.parse(xmlHttp.responseText);
				for (var i = 0; i < json.list.length; i++) {

					var option = document.createElement("option");
					option.value = json.list[i].cityname;
					option.textContent = name;
					dataList.appendChild(option);
				}

			}
		};

		xmlHttp.open("POST", "fromCitieslist.htm", true);
		xmlHttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlHttp.send(query);
		return false;
	}

	function names() {
		if (xmlHttp == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		var fromCities = document.getElementById("from").value;
		var query = "fromCities=" + fromCities;

		xmlHttp.onreadystatechange = function stateChanged() {
			if (xmlHttp.readyState == 4) {

				var dataList = document.getElementById('json-datalist');
				var json = JSON.parse(xmlHttp.responseText);
				for (var i = 0; i < json.list.length; i++) {

					var option = document.createElement("option");
					option.value = json.list[i].cityname;
					option.textContent = name;
					dataList.appendChild(option);
				}

			}
		};
		xmlHttp.open("POST", "fromCitieslist.htm", true);
		xmlHttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlHttp.send(query);
		return false;
	}

	function GetXmlHttpObject() {
		var xmlHttp = null;
		try {
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
input:required:focus {
	border: 1px solid red;
	outline: none;
}

@import
	url('https://fonts.googleapis.com/css?family=Poppins:200i,400&display=swap')
	;

body {
	font-family: 'poppins';
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.4;
	color: #f3f3f3;
	margin: 0;
}

/*mobile friendly alternative to using  background-attachment: fixed */
body::before {
	content: '';
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	z-index: -1;
	background: var(- -color-darkblue);
	background-image: linear-gradient(115deg, rgba(58, 58, 158, 0.8),
		rgba(136, 136, 206, 0.7)),
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
	width: 100%;
	margin: 3.125rem auto 0 auto;
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
	background: rgba(27, 27, 50, 0.8);
	padding: 2.5rem 0.625rem;
	border-radius: 0.25rem;
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

<span style="font-size: 25px; color: white;">
	<c:choose>
		<c:when test="${!empty sessionScope.username}">
			<jsp:include page="menu.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="menu2.jsp" />
		</c:otherwise>
	</c:choose>
</span>
	<h1>Fly Us</h1>


		<%-- <form:form action="listflights.htm" modelAttribute="flightInformation" commandName="flightInformation"
		method="post">

		<table>
			<tr>
				<td>From:</td>
				<td><form:input type="text" path="from" size="30" id="from"
						list="json-datalist" onkeyup="return names()" required="required" />
					<font color="red"><form:errors path="from" /></font></td>
				<datalist id="json-datalist"></datalist>
			</tr>

			<tr>
				<td>Dest:</td>
				<td><form:input type="text" path="dest" id="dest"
						list="json-datalist1" onkeyup="return names1()" size="30"
						required="required" /> <font color="red"><form:errors
							path="dest" /></font></td>
				<datalist id="json-datalist1"></datalist>
			</tr>

			<tr>
				<td>Departure Date:</td>
				<td><form:input type="date" path="deptDate" id="txtFromDate"
						size="30" required="required" /> <font color="red"><form:errors
							path="deptDate" /></font></td>
			</tr>

			<tr>
				<td>Travel Class:</td>
				<td><form:radiobutton value="travelClass" name="Economy"
						path="travelClass" checked="checked" />Economy <form:radiobutton
						value="travelClass" name="Business" path="travelClass" />Business
					Class</td>
			</tr>


			<tr>
				<td colspan="2"><input type="submit" value="Search flights" /></td>
			</tr>
		</table>

	</form:form> 
 --%>


	<div class="container2">
		<!-- <header class="header"> </header> -->
		<form:form action="listflights.htm" modelAttribute="flightInformation" commandName="flightInformation" method="post">
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
				<form:input type="date" path="deptDate" id="txtFromDate"  /> <font
					color="red"><form:errors path="deptDate" /></font>
			</div>
			<div class="form-group">
				<p>Which package would you like to fly with</p>
				<select id="dropup" name="package" class="form-control" >
					<option disabled selected >Select Package you would
						like to fly with</option>
					<option value="Economy">Economy-class</option>
					<option value="Business">Business-class</option>
				</select>
			</div> 
			
			

			<div class="form-group">
				<button type="submit" id="submit" class="submit-button" value="Search flights">
					Submit</button>
			</div>
		</form:form>
	</div>


</body>
</html>