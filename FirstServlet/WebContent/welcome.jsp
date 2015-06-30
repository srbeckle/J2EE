<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome.jsp</title>
</head>
<body>
<%@include file="header.html" %>
<%!
	int cube(int n)
	{
	    return n*n*n;
	}
%>

<%
	String  numberIn = request.getParameter("numToCube");
	int numToCube = Integer.parseInt(numberIn);
%>
<%= numToCube + " cubed = " + cube(numToCube) %>
<BR>


</body>
</html>