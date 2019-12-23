<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/javascript/jquery/jquery-ui.css"/>
<script type="text/javascript" src="${root}/resources/javascript/search/search.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<script>
	$(function(){
		
		//홈페이지 딱 들어간 시점에서 checkIn과 checkOut 현재날짜 기준으로 placeholder와 value 설정
		var date = new Date();
		var today = dateToString(date);
		
		setCheckIn(today);
		
		date.setDate(date.getDate()+1);
		var tommorow = dateToString(date);
		
		setCheckOut(tommorow);
		
		checkBoxSetting();
		

		$(".all").attr("checked","");
		
		//체크인 달력 띄워주기
		var yearSuffix = "년";
		var dateFormat = "yy-mm-dd";
		var monthNames = [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ];
		var dayNamesMin = [ "월", "화", "수", "목", "금", "토", "일" ];
		$("#checkIn").datepicker({
			minDate: 0,
			showMonthAfterYear: true,
			yearSuffix: yearSuffix,
			dateFormat: dateFormat,
			monthNames: monthNames,
			dayNamesMin: dayNamesMin,
			onClose: function(selectedDate){
				// #checkOut의 최소선택날짜 설정(+1)
				var min = new Date(selectedDate);
				min.setDate(min.getDate()+1);
				var minDate = dateToString(min);
				
				$("#checkOut").datepicker("option",{minDate: minDate});
			}
		});
		//체크아웃 달력 띄워주기
		$("#checkOut").datepicker({
			minDate: 1,
			showMonthAfterYear: true,
			yearSuffix: yearSuffix,
			dateFormat:dateFormat,
			monthNames: monthNames,
			dayNamesMin: dayNamesMin,
		});
	});
	
	//검색조건 submit함수
	function confirmSubmit(){
		
		//선택한 local지역 합치기
		$("input[name='local[]'").each(function(i, e){
			if(e.checked==true){
				$("#local").val($("#local").val()+e.value+",");
			}
		});
	}
</script>

<style type="text/css">
.filterBox{
	position: absolute;
	top :150px;
	left:150px;
	width:500px;
	height:500px;
}
.checkInLabel, .checkOutLabel{
	font-size: 20px;
}
.checkInContainer, .checkOutContainer{
	width:200px;
	display:inline-block;
}
</style>

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/tempalte/header.jsp"></jsp:include>
	<div class="filterBox">
				<form name="form" action="${root}/search" method="get" onsubmit="return confirmSubmit()">
					
					<div class="container">
						<div class="checkInContainer container">
							<div class="checkInLabel container"><label for="checkIn">Check In</label></div>
							<div class="checkInInput container"><input class="form-control" type="text" name="checkIn" id="checkIn"/></div>
						</div>
						<div class="checkOutContainer container">
							<div class="checkOutLabel container"><label for="checkOut">Check Out</label></div>
							<div class="checkOutInput container"><input class="form-control" type="text" name="checkOut" id="checkOut"/></div>
						</div>
					</div>
					
					
					<div class="localContainer form-check-inline">
						<div><label class="form-check-label all"><input class="form-check-input" type="checkbox"/>전체</label></div>
						<div>
							<div><label class="form-check-label etc"><input class="form-check-input" type="checkbox" name="local[]" value="jeju"/>제주시</label></div>
							<div><label class="form-check-label etc"><input class="form-check-input" type="checkbox" name="local[]" value="jejuEast"/>제주시 동부</label></div>
							<div><label class="form-check-label etc"><input class="form-check-input" type="checkbox" name="local[]" value="jejuWest"/>제주시 서부</label></div>
						</div>
						<div>
							<div><label class="form-check-label etc"><input class="form-check-input" type="checkbox" name="local[]" value="seoguipo"/>중문/서귀포</label></div>
							<div><label class="form-check-label etc"><input class="form-check-input" type="checkbox" name="local[]" value="seoguipoEast"/>서귀포시 동부</label></div>
							<div><label class="form-check-label etc"><input class="form-check-input" type="checkbox" name="local[]" value="seoguipoWest"/>서귀포시 서부</label></div>
						</div>
						<input type="hidden" name="local" id="local"/>
						<br/>
					</div>
					
					<div>
						인원
						<select title="인원" id="searchPeople" name="people">
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명이상</option>
						</select><br/>
					</div>
					
					<div>
						숙소이름
						<input class="form-control" type="text" name="searchHouseName" placeholder="숙소명이름"/><input type="submit" class="btn btn-outline-info" value="검색"/>
					</div>
					<br/><br/>
					
				</form>
	</div>		
</body>
</html>
