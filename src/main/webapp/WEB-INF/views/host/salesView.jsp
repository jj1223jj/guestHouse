<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript"
   src="${root}/resources/javascript/guestdelluna/menuLayout.js"></script>
  <link rel="stylesheet" href="${root}/resources/css/guestdelluna/menuLayout.css">
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
          onClose: function(selectedDate){
        	  $('#to').datepicker("option", "minDate", selectedDate);
          },
          numberOfMonths: 1,
          maxDate: 'today'
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        dateFormat: 'yy-mm-dd',
        numberOfMonths: 1,
        maxDate: 'today',
        onClose: function(selectedDate){
      	  $('#from').datepicker("option", "maxDate", selectedDate);
        }
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
  function searchDate(root, param) {
		var from = document.getElementById("from").value;
		var to = document.getElementById("to").value;
		
		var url = root + "/host/searchDate.do";
		
		
		if (from != "" && to != "") {
			//alert(to);
			//return false;
			var params = "from=" + from + "&to=" + to + "&pageNumber=" + param;
			sendRequest("GET", url, fromServer, params);
		} else {
			alert("날짜를 정확하게 선택해주세요.");
			return false;
		}
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("searchDateView").innerHTML = xhr.responseText;
			var currentPage = $("#currentPage").val();
			var page = "#" + currentPage.toString();
			$(page).css({
				'color' : '#008489',
				'font-size' : '1.2rem',
				'font-weight' : 'bold'
			});
		}
	}
  </script>
  <style>
  	.chartDiv, .searchDateDiv {
  		margin-top: 2rem;
  	}
  	input, select {
		padding: 0.3rem 0.6rem;
		border-radius: 0.3rem;
		border: 1px solid #ddd;
		background-color: #ffffff;
	}
	button {
		width: 4rem;
	    height: 2.3rem;
		background-color: #008489;
		color: #ffffff;
		font-weight: bold;
		font-size: 1rem;
		border-radius: 0.3rem;
		border: none;
	}
	#searchDate {
	    display: inline-block;
	   	margin-left: 25rem;
	}
	#searchDateView {
		margin-top: 1rem;
	}
	.totalPayment {
		float: right;
		text-align: left;
	    margin-bottom: 1rem;
	    font-size: 1.1rem;
   	 	margin-right: 1rem;
	}
	.totalPayment span {
	    margin-left: 1rem;
	}
  </style>
</head>
<body onload="selected('${year}')">
<div id="wrap">
	<div class="menuL">
	<ul>
		<li>
			<a href="${root}/guestdelluna/allMyReview.do">후기</a>
		</li>
		<li>
			<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a>
		</li>
		<li>
			<a href="${root}/guestdelluna/managePoint.do">포인트관리</a>
		</li>
		<li>
			<a href="${root}/guestdelluna/payList.do">결제내역</a>
		</li>
		<c:if test="${memberLevel == 'Host'}">
		<hr style="border: 0.0315rem solid #ddd;"/>
			<li>
				<a href="${root}/host/reservationView.do">숙소예약현황</a>
			</li>
		<li>
			<a href="${root}/host/exReservationView.do">체험예약현황</a>
		</li>
		<li>
			<a href="${root}/host/salesView.do">매출조회</a>
		</li>
		<li>
			<a href="${root}/host/houseManagement.do">게스트하우스 관리</a>
		</li>
		<li>
			<a href="${root}/host/exManagement.do">체험 관리</a>
		</li>
		</c:if>
		<li>
			<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a>
		</li>
	</ul>
	</div>

	<div class="menuR">
	
	<h3>년도별 매출조회</h3>
	<div class="chartDiv">
		<select id="year" name="year" onchange="toServer('${root}')">
			<option>${currentYear-3}</option>
			<option>${currentYear-2}</option>
			<option>${currentYear-1}</option>
			<option>${currentYear}</option>
		</select>
		
		<div id="columnchart_values">
		</div>
	</div>
	
	<h3>기간별 매출 검색</h3>
	<div class="searchDateDiv">
		<form id="searchDate">
			<label for="from"></label>
			<input type="text" id="from" name="from">
			<label for="to">~</label>
			<input type="text" id="to" name="to">
		 	<button type="button" onclick="return searchDate('${root}', '')">조회</button>
	 	</form>
	 	
	 	<div id="searchDateView" style="text-align:center">
	 		<h5 style="margin-top: 2rem">조회를 원하는 날짜를 선택해주세요.</h5>
	 	</div>
	</div>
	</div>
  </div>
	
</body>
</html>