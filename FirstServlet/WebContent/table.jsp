<%@ page  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="table.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<title>Table</title>
</head>
<body> 
<table id="theTable">
<%@ page import="java.util.Random" %>  
<%
	Random random = new Random();
	int num;
	int cellNum = 0;
	for(int row  = 0; row < 10; row++)
	{
		out.print("<tr>");
		for(int cell = 0; cell < 20; cell++)
		{
			num = random.nextInt(5000);
			out.print("<td id=cell" + cellNum++ + ">" + num + "</td>");
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

<br><br><br>Alarm Lower Limit:
<select name="lowAlarmLimit" id="lowAlarmLimit" onchange="setLowAlarmLimit()">
<option value="1000" selected="selected">1000</option>
<%
	for(int i = 100; i < 5000; i+=100)
	{
		out.print("<option value=\"" + i + "\">" + i + "</option>");
	}
%>
</select>

<br><br>Alarm Medium Limit:
<select name="mediumAlarmLimit" id="mediumAlarmLimit" onchange="setMediumAlarmLimit()">
<option value="3000" selected="selected">3000</option>
<%
	for(int i = 100; i < 5000; i+=100)
	{
		out.print("<option value=\"" + i + "\">" + i + "</option>");
	}
%>
 
</select>

<br><br>Alarm High Limit:
<select name="highAlarmLimit" id="highAlarmLimit" onchange="setHighAlarmLimit">
<option value="4500" selected="selected">4500</option>
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

var lowLimit = Number($('#lowAlarmLimit').val());
var mediumLimit = Number($('#mediumAlarmLimit').val());
var highLimit = Number($('#highAlarmLimit').val());

var numRows = Number($('#theTable tr').length);
var rowLength = Number($('#theTable tr:first td').length);

var defaultBackgroundColor = $("#theTable tr:first td:first").css("backgroundColor"); 
var defaultTextColor =  $("#theTable tr:first td:first").css("color"); 

function setLowAlarmLimit() {
  lowLimit = Number($('#lowAlarmLimit').val());
  showAlarms();
}

function setMediumAlarmLimit() {
	mediumLimit = Number($('#mediumAlarmLimit').val());
	showAlarms();
}

function setHighAlarmLimit() {
	highLimit = Number($('#highAlarmLimit').val());
	showAlarms();
}

function clearAlert()
{
	clearInterval(intervalVar);
	
	$('td').each(function() {
		$(this).css("backgroundColor",defaultBackgroundColor);
		$(this).css("color",defaultTextColor);
	});
}

function blink()
{
	var highAlarmBgColor;
	var highAlarmFgColor;
	var mediumAlarmBgColor;
	var mediumAlarmFgColor;
	var lowAlarmBgColor;
	var lowAlarmFgColor;
	
	var bgHigh1 = "red";
	var bgHigh2 = "white";
	var fgHigh1 = "white";
	var fgHigh2 = "red";
	
	var bgMedium1 = "orange";
	var bgMedium2 = "white";
	var fgMedium1 = "white";
	var fgMedium2 = "orange";
	
	var bgLow1 = "green";
	var bgLow2 = "white";
	var fgLow1 = "white";
	var fgLow2 = "green";
	
	if(cycle == 1)
		{
			highAlarmBgColor = bgHigh1;
			highAlarmFgColor = fgHigh1;
			mediumAlarmBgColor = bgMedium1;
			mediumAlarmFgColor = fgMedium1;
			lowAlarmBgColor = bgLow1;
			lowAlarmFgColor = fgLow1;
			cycle = 2;
		}
	else
		{
		highAlarmBgColor = bgHigh2;
		highAlarmFgColor = fgHigh2;
		mediumAlarmBgColor = bgMedium2;
		mediumAlarmFgColor = fgMedium2;
		lowAlarmBgColor = bgLow2;
		lowAlarmFgColor = fgLow2;
		cycle = 1;
		}
	

	$('#theTable tr td').each(function(){
		if(Number($(this).text()) >= lowLimit && Number($(this).text()) < mediumLimit)
			{
				$(this).css({'backgroundColor' : lowAlarmBgColor, 'color' : lowAlarmFgColor });
			}
	});
	
	
	$('#theTable tr td').each(function(){
		if(Number($(this).text()) >= mediumLimit && Number($(this).text()) < highLimit)
			{
				$(this).css({'backgroundColor' : mediumAlarmBgColor, 'color' : mediumAlarmFgColor });
			}
	});
	
	
	
	$('#theTable tr td').each(function(){
		if(Number($(this).text()) > highLimit)
			{
				$(this).css({'backgroundColor' : highAlarmBgColor, 'color' : highAlarmFgColor });
			}
	});
	
	
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
