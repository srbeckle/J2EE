<%@ page  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="table.css">
<title>Table</title>
</head>
<body> 
<table id="theTable">
<%@ page import="java.util.Random" %>  
<%
	Random random = new Random();
	int num;
	for(int row  = 0; row < 10; row++)
	{
		out.print("<tr>");
		for(int cell = 0; cell < 20; cell++)
		{
			num = random.nextInt(5000);
			out.print("<td>" + num);
			
		}
		out.print("</tr>");
	}
%>
</table>

<br>
<button type="button" onClick="clearAlert()">Clear Alarms
</button>
<button type="button" onClick="showAlarms()">Show Alarms
</button>

&nbsp;Set Alarm Lower Limit:
<select name="alarmLimit" id="alarmLimit" onchange="setAlarmLimit()">
<option value="4900" selected="selected">4900</option>
<%
	for(int i = 100; i < 5000; i+=100)
	{
		out.print("<option value=\"" + i + "\">" + i + "</option>");
	}
%>
 
</select>


<script type="text/javascript">


var cycle = 1;
var intervalVar;
var limit = Number(document.getElementById("alarmLimit").value);

var numRows = document.getElementById("theTable").rows.length;
var rowLength = document.getElementById("theTable").rows[0].cells.length;

var defaultBackgroundColor = document.getElementById("theTable").rows[0].cells[0].style.backgroundColor; 
var defaultTextColor = document.getElementById("theTable").rows[0].cells[0].style.color; 

function setAlarmLimit() {
  limit = document.getElementById("alarmLimit").value;
  showAlarms();
}

function clearAlert()
{
	clearInterval(intervalVar);

	for(var row = 0; row < numRows; row++)
	{
		for(var column = 0; column < rowLength; column++)
		{
			document.getElementById("theTable").rows[row].cells[column].style.backgroundColor = defaultBackgroundColor; 
			document.getElementById("theTable").rows[row].cells[column].style.color = defaultTextColor; 
		}
	}
}

function blink()
{
	var bgColor;
	var fgColor;
	
	var bg1 = "red";
	var bg2 = "white";
	var fg1 = "white";
	var fg2 = "red";
	
	if(cycle == 1)
		{
			bgColor = bg1;
			fgColor = fg1;
			cycle = 2;
		}
	else
		{
		bgColor = bg2;
		fgColor = fg2;
		cycle = 1;
		}
	
	for(var row = 0; row < numRows; row++)
	{
		for(var column = 0; column < rowLength; column++)
		{
			if(Number(document.getElementById("theTable").rows[row].cells[column].innerHTML) > limit)
				{
				//alert(document.getElementById("theTable").rows[row].cells[column].innerHTML);
				document.getElementById("theTable").rows[row].cells[column].style.backgroundColor = bgColor; 
				document.getElementById("theTable").rows[row].cells[column].style.color = fgColor; 
				}
		}
	}
}

function showAlarms()
{
	clearAlert();
	cycle = 1;
    blink();
    intervalVar = setInterval(function () {blink()}, 750);
}

showAlarms();



</script>

</body>
</html>