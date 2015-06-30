<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="table.css">
<title>Table</title>
</head>
<body>

&nbsp;Set Alarm Lower Limit:
<select name="alarmLimit" id="alarmLimit" onchange="myFunction()">
  <option value="500">500</option>
  <option value="1000">1000</option>
  <option value="1500">1500</option>
  <option value="2000">2000</option>
  <option value="2500">2500</option>
  <option value="3000">3000</option>
  <option value="3500">3500</option>
  <option value="4000">4000</option>
  <option value="4500">4500</option>
</select>


<script type="text/javascript">


var cycle = 1;
var intervalVar;
var limit = 4750;

var numRows = document.getElementById("theTable").rows.length;
var rowLength = document.getElementById("theTable").rows[0].cells.length;

function myFunction() {
   alert(document.getElementById("alarmLimit").value);
}


</script>

</body>
</html>