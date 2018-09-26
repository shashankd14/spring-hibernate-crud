<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>

	<head>
	
	</head>	
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>CRM-Customer Relationship Manager</h2>			
			</div>
		</div>
		<div id="container">  
			<h3>Save Customer</h3>
				<form:form action="saveCustomer" modelAttribute="customer" method="POST">
				<!-- associate the data with the customer id  -->
					<form:hidden path="id"/>
					<table>
						<tbody>
							<tr>
								<td><label>First Name:</label></td>
								<td><form:input path="firstName"></form:input></td>
							</tr>
							<tr>
								<td><label>Last Name:</label></td>
								<td><form:input path="lastName"></form:input></td>
							</tr>
							<tr>
								<td><label>Email:</label></td>
								<td><form:input path="email"></form:input></td>
							</tr>
							<tr>
								<td><label></label></td>
								<td><input type="submit" value="SAVE"/></td>
							</tr>
						</tbody>
					</table>
							
				</form:form>
				<div>
						<p>
						<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
						<% System.out.println("page conetxt:"+ (request.getContextPath()));%>
						</p>
					</div>
		</div>
	
	</body>

</html>