<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->

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

body {
color:#484848;
}

/* .btn-primary{
    background-color: #7bc143;
    border-color: #7bc143;
    color: #FFF; }
.btn-primary:hover,
.btn-primary:focus {
    border-color: #6fb03a;
    background-color: #6fb03a;
    color: #FFF; }
.btn-primary:active,
.btn-primary:visited,
.btn-primary:active:focus,
.btn-primary:active:hover {
    border-color: #639d34;
    background-color: #639d34;
    color: #FFF; } */
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
							<div class="checkInInput"><input readonly="readonly" style="background-color: white;" class="form-control" type="text" name="checkIn" id="checkIn"/><i class="calenderIn far fa-calendar-alt fa-3x"></i></div>
						</div>
						<div class="checkOutContainer">
							<div class="checkOutLabel"><label for="checkOut">Check Out</label></div>
							<div class="checkOutInput"><input readonly="readonly" style="background-color: white;" class="form-control" type="text" name="checkOut" id="checkOut"/><i class="calenderOut far fa-calendar-alt fa-3x"></i></div>
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

	
	<div style="background: url(http://fiximage.10x10.co.kr/web2018/main/bg_pattern_slash.png) 0 0 repeat;    height: 44rem;">
		<div style="width: 90rem; height: 40rem; margin: 0 auto;"  >
			<div align="center">
				<div style="width: 100%; height: 10rem; line-height: 10rem; font-size: 3rem; margin-top: 10rem; font-weight: bold;">JEJU GUEST HOUSE</div>

			</div>
			
			<c:forEach var="ho" items="${houseImgDto}" varStatus="i">
	
				<div id="demo${i.index}" class="carousel slide" data-ride="carousel" style="width: 20rem; height: 20rem; float: left; margin-left: 2rem; margin-top: 5rem;">
			
					
					 <a href="${root}/guestHousePage/guestHouse.do?houseCode=${ho.houseCode}" style="display: block;"/>
				
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo${i.index}" data-slide-to="0" class="active"></li>
				    <li data-target="#demo${i.index}" data-slide-to="1"></li>
				    <li data-target="#demo${i.index}" data-slide-to="2"></li>
				  </ul>
				
				  <!-- The slideshow -->
				  <div class="carousel-inner" style="width: 20rem; height: 20rem;">
				    <div class="carousel-item active" style="width: 20rem; height: 20rem;">
				      <img style="width: 20rem; height: 20rem;" src="${root}/image/${ho.fileList[0].fileName}" alt="이미지가 없습니다.">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 20rem; height: 20rem;" src="${root}/image/${ho.fileList[1].fileName}" alt="이미지가 없습니다.">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 20rem; height: 20rem;" src="${root}/image/${ho.fileList[2].fileName}" alt="이미지가 없습니다.">
				    </div>
				  </div>
				
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo${i.index}" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo${i.index}" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
		
				<div style="width: 20rem; margin-top: 1.5rem; font-weight: bold;text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${ho.houseName}</div>
				<div style="width: 20rem; text-align: right;">₩ ${ho.price}/박</div>
				
				<!-- 별점 출력 -->
					<div style="width: 4rem; float: left;" >
						
						<span class="star-out">
						   <span class="output">
						       <input type="hidden" name="star-output" value="${ho.revRate}" id="${ho.revRate}">
						       <label for="${ho.revRate}"></label>
						       <c:if test="${ho.revRate==0}">
						       		<img src="${root}/resources/css/review/star0.png" style="width: 50px;">
						       </c:if>
						       <c:if test="${0 < ho.revRate and ho.revRate <= 1}">
						       		<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${1 < ho.revRate and ho.revRate <= 2}">
						       		<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${2 < ho.revRate and ho.revRate <= 3}">
						       		<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${3 < ho.revRate and ho.revRate <= 4}">
						       		<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${4 < ho.revRate and ho.revRate <=5}">
						       		<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
						       </c:if>
						   </span>
						   
						
						</span>
					</div>
				
				
				<%-- <div style="width: 20rem;">${ho.revRate}</div> --%>
				<div style="width: 20rem;">(${ho.revCount})</div>



				</div>
			</c:forEach>
		</div>
	</div>


	
	<div style="background-color: #FBD65C; height: 20rem; margin-top:10rem; margin-bottom: 30rem;">
		<div style="width: 90rem; margin: auto;">
			<div style="display: inline-block; margin-top: 4rem; float: left;">
			<a href="${root}/experience?checkIn=&checkOut=&local=&people=1&searchExName=">
				<img style="width: 40rem; height: 32rem;"
				src="${root}/resources/images/maxresdefault.jpg" alt="이미지가 없습니다.">
			</a>
			
			</div>
			<div style="font-weight: bold;width: 35rem;display:  inline-block;margin-top: 12rem;margin-left: 3rem;">
					<div style="font-size: 2.5rem; margin-bottom: 1rem;">제주시의 매력을 만나세요!</div>
					<div style="font-size: 1rem; color: orangered;">
						호스트와 함께하는 체험을 예약하고
						제주의 새로운 모습을 발견하세요!
					</div>
			</div>
			<div style="/* border:  1px solid; */display: inline-block;margin-top: 2.8rem;margin-left: 2rem;width: 48rem;height: 15rem;">
				<div style="/* border: 1px solid red; */float: left;width: 15.2rem;height: 15rem;/* margin-top: auto; *//* display:  inline-block; */">
					<a href="${root}/experience?checkIn=&checkOut=&local=&people=1&searchExName=">
						<img style="width: 100%; height: 100%;" src="${root}/resources/images/1.jpg" alt="img">
					</a>
					
				</div>
				<div style="/* border: 1px solid red; */width: 15.2rem;height: 15rem; margin-left: 1rem;display:  inline-block;">
					<a href="${root}/experience?checkIn=&checkOut=&local=&people=1&searchExName=">
						<img style="width: 100%; height: 100%;" src="${root}/resources/images/2.jpeg" alt="img">
					</a>
					
				</div>
				<div style="/* border: 1px solid red; */width: 15.2rem;height: 15rem; margin-left: 1rem;display:  inline-block;">
					<a href="${root}/experience?checkIn=&checkOut=&local=&people=1&searchExName=">
						<img style="width: 100%; height: 100%;" src="${root}/resources/images/3.jpg" alt="img">
					</a>
					
				</div>
			</div>

		</div>
	</div>
	
	<div style="background: url(http://fiximage.10x10.co.kr/web2018/main/bg_pattern_slash.png) 0 0 repeat;  margin-top: 10rem; height: 44rem; margin-bottom: 5rem;">
		<div style="width: 90rem; height: 41rem; margin: 0 auto;"  >
		<div align="center">
			<div style="width: 100%; height: 10rem; line-height: 10rem; font-size: 3rem; margin-top: 10rem; font-weight: bold;">JEJU EXPERIENCE</div>
		</div>

		<c:forEach var="ex" items="${experienceImgDto}" varStatus="i">

			<div id="exDemo${i.index}" class="carousel slide" data-ride="carousel" style="width: 20rem; height: 20rem; float: left; margin-left: 2rem; margin-top: 5rem;">
				
				<a href="${root}/experience/exPage.do?exCode=${ex.exCode}" style="display: block;"/>
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#exDemo${i.index}" data-slide-to="0" class="active"></li>
				    <li data-target="#exDemo${i.index}" data-slide-to="1"></li>
				    <li data-target="#exDemo${i.index}" data-slide-to="2"></li>
				  </ul>
				
				  <!-- The slideshow -->
				  <div class="carousel-inner" style="width: 20rem; height: 20rem;">
				    <div class="carousel-item active" style="width: 20rem; height: 20rem;">
				      <img style="width: 20rem; height: 20rem;" src="${root}/exImage/${ex.exFileList[0].fileName}" alt="img">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 20rem; height: 20rem;" src="${root}/exImage/${ex.exFileList[1].fileName}" alt="img">
				    </div>
				    <div class="carousel-item">
				      <img style="width: 20rem; height: 20rem;" src="${root}/exImage/${ex.exFileList[2].fileName}" alt="img">
				    </div>
				  </div>
				
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#exDemo${i.index}" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#exDemo${i.index}" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
		
				<div style="width: 20rem; margin-top: 1.5rem;font-weight: bold; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${ex.exName}</div>
				<div style="width: 20rem; text-align: right;">1인당 ₩ ${ex.exPrice}</div>
				<%-- <div style="width: 20rem;">${ex.revRate}</div> --%>
				
				<!-- 별점 출력 -->
					<div style="width: 4rem; float: left;" >
						
						<span class="star-out">
						   <span class="output">
						       <input type="hidden" name="star-output" value="${ex.revRate}" id="${ex.revRate}">
						       <label for="${ex.revRate}"></label>
						       <c:if test="${ex.revRate==0}">
						       		<img src="${root}/resources/css/review/star0.png" style="width: 50px;">
						       </c:if>
						       <c:if test="${0 < ex.revRate and ex.revRate <= 1}">
						       		<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${1 < ex.revRate and ex.revRate <= 2}">
						       		<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${2 < ex.revRate  and ex.revRate<= 3}">
						       		<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${3 < ex.revRate and ex.revRate <= 4}">
						       		<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
						       </c:if>
						       <c:if test="${4 < ex.revRate and ex.revRate <= 5}">
						       		<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
						       </c:if>
						   </span>
						   
						
						</span>
					</div>
				
				
				<div style="width: 20rem;">(${ex.revCount})</div>
				
				</div>
			</c:forEach>
		</div>
	</div>
	<br/><br/>

				
	
	
	<!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>
