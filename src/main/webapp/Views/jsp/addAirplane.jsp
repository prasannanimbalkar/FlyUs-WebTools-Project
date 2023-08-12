<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Airplane</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
input:required:focus {
  border: 1px solid red;
  outline: none;
}
</style> 
</head>
<body  class="bg-light">
<%-- <form:form action="addAirplane.htm" modelAttribute="airplane" commandName="airplane" method="post">
<pre>
Please enter the details

Airline Name: <form:input type="text" path="airlineName" name="airlineName" size="30" required="required"/>

Owner:        <form:input type="text" path="owner" name="owner" size="30" required="required" />

			  <input type="submit" value="Add Airplane" />
</pre>
</form:form> --%>

<div class="container mt-5 mb-5 bg-light rounded">
			<div class="row mb-2">
				<div class="col-md-12 bg-light rounded shadow-lg text-start">
					<div>
						<form:form action="addAirplane.htm" modelAttribute="airplane" commandName="airplane" method="post">
							<table class="table table-light table-responsive table-sm">
								<thead>
									<tr class="d-flex">
										<th class="col-12"><span id="title">Please enter the details</span></th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<tr class="d-flex">
										<th class="col bg-secondary light-bg">Airline Name: </th>
										<th class="col bg-secondary light-bg">Owner: </th>
										<th class="col bg-secondary light-bg"></th>
										
									</tr>
									
										<tr class="d-flex">

											<td class="col"><form:input type="text" path="airlineName" name="airlineName" size="30" required="required"/></td>
											<td class="col"><form:input type="text" path="owner" name="owner" size="30" required="required" /></td>
											
											<td class="col"><input type="submit" value="Add Airplane" /></td>
										</tr>
									

								</tbody>
							</table>
						</form:form>
					</div>

				</div>
			</div>
		</div>


</body>
</html>