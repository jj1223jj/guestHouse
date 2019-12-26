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
<script src="https://kit.fontawesome.com/0fcdcb00af.js" crossorigin="anonymous"></script>

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
		
		$(".calenderIn").click(function(){
			$("#checkIn").datepicker("show");
		});
		$(".calenderOut").click(function(){
			$("#checkOut").datepicker("show");
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
form{
	height: 100%;
}
.filterBoxContainer{
	position: relative;
	top :15.625rem;
	left:62.5rem;
	width:31.25rem;
	height:25rem;
	border-radius: 1.563rem;
	border: 1px white solid;
	background-color: white;
}
.filterBox{
	height: 100%
}
.checkInLabel, .checkOutLabel{
	font-size: 1.5rem;
}
.checkInContainer, .checkOutContainer{
	width:12.5rem;
	display:inline-block;
}
.localAll, .localJeju, .localSeoguipo{
	width: 8.75rem;
	font: 1rem bold;
}
.form-control{
	display:inline-block;
	width: 9.375rem;
}
.calender::before{
	margin-top: 0.625rem;
}
.checkInInput, .checkOutInput{
	position: relative;
	
}
i{
	position: absolute;
	right:-0.25rem;
	top:-0.563rem;
}
.custom-control{
	margin-bottom: 0rem !important;
}

.localContainer{
	position: absolute;
	top : 6.25rem;
	left : 2.5rem;
}

.peopleContainer{
	position: absolute;
	top : 12.5rem;
	left: 1.875rem;
	font-size: 1.25rem;
}

.searchContainer{
	position: absolute;
	top : 12.5rem;
	right: 2.188rem;
	font-size: 1.25rem;
}
.container{
	position: relative;
}
.checkOutContainer{
	position: absolute;
	right: 2.188rem;
}

.searchBtn{
	margin-left:0.625rem;
	margin-bottom: 0.219rem;
}
.checkInOutContainer{
	margin-top: 2.5rem;	
	margin-left: 0.938rem;
}
.backImg{
	height: 62.5rem;
	background-image: url("${root}/resources/images/JEJU STAY.jpg");
}

</style>

</head>
<body>
	<div class="backImg">
	<div class="filterBoxContainer">
		<div class="filterBox container">
				<form name="form" action="${root}/search" method="get" onsubmit="return confirmSubmit()">
					
					<div class="checkInOutContainer">
						<div class="checkInContainer">
							<div class="checkInLabel"><label for="checkIn">Check In</label></div>
							<div class="checkInInput"><input class="form-control" type="text" name="checkIn" id="checkIn"/><i class="calenderIn far fa-calendar-alt fa-3x"></i></div>
						</div>
						<div class="checkOutContainer">
							<div class="checkOutLabel"><label for="checkOut">Check Out</label></div>
							<div class="checkOutInput"><input class="form-control" type="text" name="checkOut" id="checkOut"/><i class="calenderOut far fa-calendar-alt fa-3x"></i></div>
						</div>
					</div>
					
    				<div class="localContainer form-check-inline">
						<div class="localAll">
							<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input all" id="all"/>
		    					 <label class="custom-control-label" for="all">전체</label>
		    				</div>
	    				</div>
	    				<div class="localJeju">
		    				<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input etc" id="jeju" value="jeju"/>
		    					 <label class="custom-control-label" for="jeju">제주시</label>
		    				</div>
		    				<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input etc" id="jejuEast" value="jejuEast"/>
		    					 <label class="custom-control-label" for="jejuEast">제주시 동부</label>
		    				</div>
		    				<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input etc" id="jejuWest" value="jejuWest"/>
		    					 <label class="custom-control-label" for="jejuWest">제주시 서부</label>
		    				</div>
		    			</div>
	    				<div class="localSeoguipo">
		    				<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input etc" id="seoguipo" value="seoguipo"/>
		    					 <label class="custom-control-label" for="seoguipo">중문/서귀포</label>
		    				</div>
		    				<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input etc" id="seoguipoEast" value="seoguipoEast"/>
		    					 <label class="custom-control-label" for="seoguipoEast">서귀포시 동부</label>
		    				</div>
		    				<div class="custom-control custom-checkbox mb-3">
		     					 <input type="checkbox" class="custom-control-input etc" id="seoguipoWest" value="seoguipoWest"/>
		    					 <label class="custom-control-label" for="seoguipoWest">서귀포시 서부</label>
		    				</div>
		    				<input type="hidden" name="local" id="local"/>
	    				</div>
					</div>
					
					<div class="peopleContainer">
						인원
						<select class="custom-select" title="인원" id="searchPeople" name="people">
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명이상</option>
						</select><br/>
					</div>
					
					<div class="searchContainer">
						<div>숙소이름</div>
						<input class="form-control" type="text" name="searchHouseName" placeholder="숙소명이름"/><button type="submit" class="searchBtn btn btn-primary">검색</button>
					</div>
					<br/><br/>
					
				</form>
		</div>
	</div>
	</div>
	
</body>
</html>