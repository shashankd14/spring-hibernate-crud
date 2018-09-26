<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<title>List Customers</title>	
	</head>
	<body>
		<div id="wrapper">
		
			<div id="header">
			
				<h2>CRM-Customer Relationship Management</h2>
				
				<div id="container">
					<div id="content">
					
					<input type="button" value = "Add Customer"
						onclick="window.location.href = 'showFormForAdd'; return false;"
						class="add-button"/>
					<!-- add html table -->	
					<table>
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
						
						<!-- loop to print customers -->
						
						<c:forEach var="tempCustomer" items="${customers}">
							<!-- construct an "update link with customer id" -->
							<c:url var="updateLink" value="/customer/showFormForUpdate">
								<c:param name="customerId" value="${tempCustomer.id}"></c:param>
							
							</c:url>
							
							<!-- construct a delete link with customer id -->
							<c:url var="deleteLink" value="/customer/delete">
								<c:param name="customerId" value="${tempCustomer.id}"></c:param>
							
							</c:url>
						 <tr>
							<th>${tempCustomer.firstName}</th>
							<th>${tempCustomer.lastName}</th>
							<th>${tempCustomer.email}</th>
							
							<!-- display update link -->
							<th><a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
        						onclick="return confirm('Are you sure you want to delete this customer?');"
							>Delete</a>
							
							
							</th>
						</tr>
						
						</c:forEach>
					
					</table>
					</div>
				
				</div>
			
			</div>
		</div>
	</body>
</html>