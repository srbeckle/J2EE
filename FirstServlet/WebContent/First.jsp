<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First JSP on Tomcat</title>
<%!
	public String getColor()
	{
	Random random = new Random();
	int red = random.nextInt(255);
	int blue = random.nextInt(255);
	int green = random.nextInt(255);
	int color = (red << 16) + (blue << 8) + green;
	String colorString = Integer.toHexString(color);
	return "#" + colorString;
	}
%>
</head>
<body bgcolor="<%= getColor() %>">

<h1><% out.print(2 * 6); %></h1>
</body>
</html>