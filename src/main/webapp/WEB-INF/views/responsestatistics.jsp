<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
div {
  border: 1px solid black;
}
</style>
 <!--Load the AJAX API-->

</head>
<body>
	<h1>${survey.sTitle}</h1>
		<hr>
	<c:forEach items="${resultlist}" var="result" varStatus="status">
		<div>
			<p style="font-size:24px; font-family:'돋움'">${result.rQuestion}</p>
			<c:forEach items="${resultlist2}" var="result2">
				<c:if test="${result2.rIndex == result.rIndex}">
					<c:choose>
						<c:when test="${result2.rKind == 'short' || result2.rKind == 'long'}">
							<p>${result2.rExample2}</p>
						</c:when>
						<c:when test="${result2.rKind == 'multiplechoice' || result2.rKind == 'checkbox'}">
							<p>${result2.rExample1} : ${result2.rCount}회</p>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>
			<div id="chart_div${status.index}"></div>
		</div>
		
	</c:forEach>
	
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

  // Load the Visualization API and the corechart package.
  google.charts.load('current', {'packages':['corechart']});

  // Set a callback to run when the Google Visualization API is loaded.
  google.charts.setOnLoadCallback(drawChart);

  // Callback that creates and populates a data table,
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawChart() {
	$.ajax({
		type : "GET",
		url : "/get/chart/data",
		data : {
			sNo : ${survey.sNo}
		},
		success: function (data) {
			let index = 0;
			console.log('getDATA START:');
			console.dir(data);
			console.log('getDATA END:');
			
			for(var key in data) {
			// Create the data table.
			    var data2 = new google.visualization.DataTable();
			    data2.addColumn('string', 'Answer');
			    data2.addColumn('number', 'Count');
			    
			    data[key].forEach(function(element, index, array) {
				    data2.addRows([
				      [element.rExample1, element.rCount]
				    ]);
			    });
	
			    // Set chart options
			    var options = {'title':'question',
			                   'width':400,
			                   'height':300};
	
			    // Instantiate and draw our chart, passing in some options.
			    var chart = new google.visualization.PieChart(document.getElementById("chart_div"+ index));
			    chart.draw(data2, options);
			    index++;
			}
		}
	});  
  }
</script>




</body>
</html>