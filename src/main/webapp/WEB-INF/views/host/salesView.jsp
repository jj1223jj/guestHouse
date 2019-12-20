<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var monthArr = new Array();
			<c:forEach var="result" items="${monthTotal}">
				monthArr.push(parseInt("${result}"));
			</c:forEach>
		
		var data = google.visualization.arrayToDataTable([
	        ["Element", "매출", { role: "style" } ],
	        ["1월", monthArr[0], "#b87333"],
	        ["2월", monthArr[1], "silver"],
	        ["3월", monthArr[2], "gold"],
	        ["4월", monthArr[3], "color: #e5e4e2"],
	        ["5월", monthArr[4], "#b87333"],
	        ["6월", monthArr[5], "silver"],
	        ["7월", monthArr[6], "gold"],
	        ["8월", monthArr[7], "color: #e5e4e2"],
	        ["9월", monthArr[8], "#b87333"],
	        ["10월", monthArr[9], "silver"],
	        ["11월", monthArr[10], "gold"],
	        ["12월", monthArr[11], "color: #e5e4e2"]
	      ]);

	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);

	      var options = {
	        title: "월 별 매출조회",
	        width: 800,
	        height: 400,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      chart.draw(view, options);
	}
	function toServer(root) {
		var year = document.getElementById("year").value;
		location.href = root + "/host/salesView.do?year=" + year;
		
		
	}
	function selected(year) {
		document.getElementById("year").value = year;
		
	}
  $( function() {
    var dateFormat = "yy/mm/dd",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          dateFormat: 'yy-mm-dd',
          numberOfMonths: 1
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        dateFormat: 'yy-mm-dd',
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  
    
    
    
    
  } );
  function searchDate(root) {
		var from = document.getElementById("from").value;
		var to = document.getElementById("to").value;
		
		var url = root + "/host/searchDate.do";
		
		
		if (from != "" && to != "") {
			var params = "from=" + from + "&to=" + to;
			sendRequest("GET", url, fromServer, params);
		} else {
			alert("날짜를 정확하게 선택해주세요.");
			return false;
		}
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("searchDateView").innerHTML = xhr.responseText;
		}
	}
  </script>
  <style>
  	#searchDate {
  		margin-top: 200px;
  	}
  </style>
</head>
<body onload="selected('${year}')">
	<h3>숙소매출조회</h3>
	
	<select id="year" name="year" onchange="toServer('${root}')">
		<option>${currentYear-3}</option>
		<option>${currentYear-2}</option>
		<option>${currentYear-1}</option>
		<option>${currentYear}</option>
	</select>
	
	<div id="columnchart_values" style="width: 900px; height: 300px;">
	</div>
	
	
	<form id="searchDate">
		<label for="from"></label>
		<input type="text" id="from" name="from">
		<label for="to">~</label>
		<input type="text" id="to" name="to">
	 	<button type="button" onclick="return searchDate('${root}')">조회</button>
 	</form>
 	
 	<div id="searchDateView"></div>
	
</body>
</html>