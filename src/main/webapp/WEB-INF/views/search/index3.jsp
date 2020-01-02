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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/javascript/jquery/jquery-ui.css"/>
<script type="text/javascript" src="${root}/resources/javascript/search/search.js"></script>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->


 
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
		$("input[class='custom-control-input etc']").each(function(i, e){
			if(e.checked==true){
				$("#local").val($("#local").val()+e.value+",");
			}
		});
	}
</script>

<style type="text/css">
html{
	font-size: 16px;
}
form{
	height: 100%;
}
.filterBoxContainer{
	box-shadow: rgba(0, 0, 0, 0.28) 0px 8px 28px !important;
	position: relative;
	top :15.625rem;
	left:75%;
	width:31.25rem;
	height:25rem;
	border-radius: 1.563rem;
	border: 1px white solid;
	background-color: white;
	margin-left: -15rem;
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
	height: 55rem;
	/* background-image: url("${root}/resources/images/JEJU_STAY.jpg"); */
	background-image: url("https://images.unsplash.com/photo-1519808511465-c935152e1cf1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80");
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
		     					 <input type="checkbox" class="custom-control-input all" id="all" checked="checked"/>
		    					 <label  class="custom-control-label" for="all">전체</label>
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
	
	<div style="width: 150rem; height: 60rem; margin: 0 auto;"  >
		<div align="center">
			<div style="width: 100%; height: 10rem; line-height: 10rem; font-size: 3rem; margin-top: 10rem; font-weight: bold;">JEJU GUEST HOUSE</div>
		</div>
		
		<c:forEach var="i" begin="0" end="3">
			<div id="demo" class="carousel slide" data-ride="carousel" style="width: 30rem; height: 30rem; float: left; margin-left: 5rem; margin-top: 5rem;">
		
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				
				  <!-- The slideshow -->
				  <div class="carousel-inner" style="width: 30rem; height: 30rem;">
				    <div class="carousel-item active" style="width: 30rem; height: 30rem;">
				      <img style="width: 30rem; height: 30rem;" src="https://images.unsplash.com/photo-1558006297-a916366218d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="Los Angeles">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 30rem; height: 30rem;" src="https://images.unsplash.com/photo-1523149394814-4649a15b95fd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Chicago">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 30rem; height: 30rem;" src="https://images.unsplash.com/photo-1551062526-7405947cbca9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80" alt="New York">
				    </div>
				  </div>
				
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
		
			</div>
		</c:forEach>
	</div>
	
	<div style="width: 150rem; height: 60rem; margin: 0 auto;" >
		<div align="center">
			<div style="width: 100%; height: 10rem; line-height: 10rem; font-size: 3rem; margin-top: 10rem; font-weight: bold;">JEJU EXPERIENCE</div>
		</div>
		
		<c:forEach var="i" begin="0" end="3">
			<div id="demo" class="carousel slide" data-ride="carousel" style="width: 30rem; height: 30rem; float: left; margin-left: 5rem; margin-top: 5rem;">
		
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				
				  <!-- The slideshow -->
				  <div class="carousel-inner" style="width: 30rem; height: 30rem;">
				    <div class="carousel-item active" style="width: 30rem; height: 30rem;">
				      <img style="width: 30rem; height: 30rem;" src="https://images.unsplash.com/photo-1558006297-a916366218d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="Los Angeles">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 30rem; height: 30rem;" src="https://images.unsplash.com/photo-1523149394814-4649a15b95fd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Chicago">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 30rem; height: 30rem;" src="https://images.unsplash.com/photo-1551062526-7405947cbca9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80" alt="New York">
				    </div>
				  </div>
				
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
		
			</div>
		</c:forEach>
	</div>
	
	<!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>
