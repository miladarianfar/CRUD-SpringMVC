<%-- 
    Document   : add-customer-form
    Created on : Jan 9, 2021, 3:54:35 AM
    Author     : Milad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css"
              rel="stylesheet"
              href="<c:url value="/resources/css/style.css"/>" />
        <link type="text/css"
              rel="stylesheet"
              href="<c:url value="/resources/css/add-customer-style.css"/>" />
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h2>CRM - Customer Relationship Manager</h2>
            </div>
        </div>

        <div id="container">
            <h3>Save Customer</h3>
            <form:form action="saveCustomer" modelAttribute="customer" method="POST">

                <form:hidden path="id"/>

                <table>
                    <tbody>
                        <tr>
                            <td><label>First name:</label></td>
                            <td><form:input path="firstname" /></td>
                        </tr>

                        <tr>
                            <td><label>Last name:</label></td>
                            <td><form:input path="lastname" /></td>
                        </tr>

                        <tr>
                            <td><label>Email:</label></td>
                            <td><form:input path="email" /></td>
                        </tr>

                        <tr>
                            <td><label></label></td>
                            <td><input type="submit" value="Save" class="save" /></td>
                        </tr>


                    </tbody>
                </table>

            </form:form>
    </body>
</html>
