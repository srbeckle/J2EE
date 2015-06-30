<%@ page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%
String p1 = request.getParameter("firstNum");
String p2 = request.getParameter("secondNum");

int n1 = Integer.parseInt(p1);
int n2 = Integer.parseInt(p2);
%>

<%= n1 %> Divided by <%= n2 %> = <%= n1/n2 %>

</body>
</html>