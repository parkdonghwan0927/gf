<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
  border: 1px solid black;
}
</style>
 <!--Load the AJAX API-->
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

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);
        
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'Topping');
        data2.addColumn('number', 'Slices');
        data2.addRows([
          ['2Mushrooms', 2],
          ['2Onions', 2],
          ['2Olives', 2],
          ['2Zucchini', 2],
          ['22Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
        
        var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart2.draw(data2, options);
      }
    </script>
</head>
<body>
	<h1>${survey.sTitle}</h1>
		<hr>
	<c:forEach items="${resultlist}" var="result">
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
		</div>
	</c:forEach>
	<div id="chart_div"></div>
	<div id="chart_div2"></div>
</body>
</html>