<%-- 
    Document   : list-customer
    Created on : Jan 9, 2021, 2:11:27 AM
    Author     : Milad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css"
		  rel="stylesheet"
                  href="<c:url value="/resources/css/style.css"/>" />
    </head>
    <body>
        
        <div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Customer -->
		
			<input type="button" value="Add Customer"
				   onclick="window.location.href='showFormForAdd'; return false;"
				   class="add-button"
			/>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
                                        <th>Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
                                    <!-- update customers -->
                                    <c:url var="updateLink" value="/home/showFormForUpdate">
                                        <c:param name="customerId" value="${tempCustomer.id}"/>
                                    </c:url>
                                    
                                    <!-- delete customers -->
                                    <c:url var="deleteLink" value="/home/delete">
                                        <c:param name="customerId" value="${tempCustomer.id}"/>
                                    </c:url>
					<tr>
						<td> ${tempCustomer.firstname} </td>
						<td> ${tempCustomer.lastname} </td>
						<td> ${tempCustomer.email} </td>
                                                <td>
                                                    <a href="${updateLink}">Update</a>
                                                    |
                                                    <a href="${deleteLink}" 
                                                       onclick="if(!(confirm('Are you sure you want delete this customer?'))) return false">Delete</a>
                                                </td>
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>

        
    </body>
</html>
