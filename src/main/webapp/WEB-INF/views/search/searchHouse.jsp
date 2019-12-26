<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="pageBlock" value="${5}"/>
<%-- <c:set var="memberCode" value="${5}" scope="session"/> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="${root}/resources/css/search/search.css"/>
<script type="text/javascript" src="${root}/resources/javascript/search/search.js"></script>

<!-- jQueryUI -->
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/javascript/jquery/jquery-ui.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- kakaoMap -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37448871d1dc7c24bd47df3b92bf2c3"></script>

<!-- Swiper -->
<link rel="stylesheet" href="${root}/resources/css/swiper/swiper.css">
<script src="${root}/resources/javascript/swiper/swiper.js"></script>

<script>
	$(function(){
		setRoot('${root}');
		
		
		setHouseList('${jsonHouseList}');

		for(let i=0; i<='${pageBlock}';i++){
			$(".house"+i).mouseover(function(){
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
			    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				marker[i].setImage(markerImage);
			});
			$(".house"+i).mouseout(function(){
				var imageSrc = 'http://t1.daumcdn.net/mapjsapi/images/2x/marker.png', // 마커이미지의 주소입니다    
			    imageSize = new kakao.maps.Size(29, 42), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(13, 49)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				marker[i].setImage(markerImage);
				console.log(marker[i].setImage);
			}); 
		 }

		$(".overlaybox").css("display","block");
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
				dynamicBullets : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
		$(".overlaybox").css("display","none");
		
		
		
		//가격 필터

		//하트 클릭
		heart('3');
		
		//검색 조건 띄워주는 창
		$("#filter").click(function(){
			if($("#filterContent").css("display")=="none")
				$("#filterContent").css("display","block");
			else
				$("#filterContent").css("display","none");
		});
		
		//검색 조건 기본값 설정
		$("input[name='searchHouseName']").val("${searchHouseName}");
		var local='${local}'.split(",");
		if(local.length>1){
			$(local).each(function(i,e){
				$("input[value='"+e+"']").attr("checked","checked");
			})
		}else{
			$("input[class='all']").attr("checked","checked");
		}
		$("option[value='${people}']").attr("selected","");
		
		
		//검색 시점에서 checkIn과 checkOut 날짜 기준으로 placeholder와 value 설정
		setCheckIn('${checkIn}');
		setCheckOut('${checkOut}');
		
		var date = new Date('${checkIn}');
		date.setDate(date.getDate()+1);
		
		// 지역선택 체크박스 전체와 나머지 클릭했을 때 어떻게 동작할지 처리
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
			minDate: date,
			showMonthAfterYear: true,
			yearSuffix: yearSuffix,
			dateFormat:dateFormat,
			monthNames: monthNames,
			dayNamesMin: dayNamesMin,
		});
		
		
		$("#priceHigh").click(function(){
			$("#sort").val("priceHigh");
			var sortValue=$("#sort").val();
			sort(sortValue);
		});
		$("#priceLow").click(function(){
			$("#sort").val("priceLow");
			var sortValue=$("#sort").val();
			sort(sortValue);
		});
		$("#rateSort").click(function(){
			$("#sort").val("revRate");
			var sortValue=$("#sort").val();
			sort(sortValue);
		});
		
		$(".dateButton").click(function(){
			if($(".checkInOutContainer").css("display")=="inline-block"){
				$(".checkInOutContainer").css("display","none");
			}else{
				$(".checkInOutContainer").css("display","inline-block");
				$(".peopleContainer").css("display","none");
				$(".localContainer").css("display","none");
			}
		});
		$(".peopleButton").click(function(){
			if($(".peopleContainer").css("display")=="inline-block"){
				$(".peopleContainer").css("display","none");
			}else{
				$(".peopleContainer").css("display","inline-block");
				$(".localContainer").css("display","none");
				$(".checkInOutContainer").css("display","none");
			}
		});
		$(".localButton").click(function(){
			if($(".localContainer").css("display")=="inline-flex"){
				$(".localContainer").css("display","none");
			}else{
				$(".localContainer").css("display","inline-flex");
				$(".checkInOutContainer").css("display","none");
				$(".peopleContainer").css("display","none");
			}
		});
	});

	
	function sort(sortValue){
		location.href=root+"/search?pageNumber=${pageNumber}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}&sort="+sortValue;
	}
	
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

.filterButton{
	display: inline-block;
}
.btn{
	border-radius: 0.938rem;
}
.custom-select{
	width:8.75rem;
}
.checkInLabel, .checkOutLabel{
	font-size: 1.5rem;
}
.checkInContainer, .checkOutContainer{
	width:14.375rem;
	display:inline-block;
}
.localAll, .localJeju, .localSeoguipo{
	font: 1rem bold;
}
.localAll{
	width: 4.375rem;
}
.localJeju{
	width: 7.5rem;
}
.localSeoguipo{
	width: 8.75rem;
}
.checkInOutContainer .form-control{
	display:inline-block;
	width: 6.875rem;
	height: 1.563rem;
}
.searchContainer .form-control{
	display:inline-block;
	width: 13.125rem;
	height: 1.563rem;
	margin-left: 1.875rem;
}
.calender::before{
	margin-top: 0.625rem;
}
i{
	position: absolute;
	right:0.25rem;
	top:-0.313rem;
}
.custom-control{
	margin-bottom: 0rem !important;
}

.localContainer{
	display: none;
	margin-left: 10.625rem;
}

.peopleContainer{
	margin-top: 1.125rem;
	width: 12.5rem;
	font-size: 1.25rem;	
	margin-left: 6.25rem;
	display: none;
}

.searchContainer{
	font-size: 1.25rem;
	display: inline-block;
}

.searchBtn{
	margin-left:0.625rem;
}
.checkInOutContainer{
	margin-top: 1.188rem;	
	margin-left: 0.938rem;
	display:none;
}

.checkInOutContainer label{
	font-size: 1.25rem
}
.filterBox{
	margin-top:0.938rem;
	margin-bottom:0.938rem;
	width:100%;
	height:7.063rem;
}
.formContainer{
	height:4.688rem;
	width: 52.5rem;
	background-color: #cccccc;
	margin-top: 0.938rem;
}
.filterContainer :first-child{
	margin-left:0.938rem;
}

.houseListContainer{
	background-color: #bbccaa;
	width: 52.5rem;
}
.houseListCount{
	background-color: #aabbcc;
	height: 3.125;
}
.houseContainer{
	background-color: #998877;
	height: 62.5rem;
	padding: 0rem 1.5rem;
}
._gig1e7{
	border-top: black solid 0.125rem;
	width: 49.5rem;
	height: 15.625rem;
}
._ylefn59{
	margin-top: 1.563rem;
	background-color: #ccddee;
	width: 49.5rem;
	height: 14rem;
	position: relative;
}
._houseImg{
	width: 18.75rem;
	height: 12.5rem;
	background-color: #eeffdd;
	display: inline-block;
}
._houseInfo{
	width: 29.75rem;
	height: 12.5rem;
	background: #ffddee;
	display: inline-block;
	position: absolute;
	right: 0rem;
}
._starRate{
	height: 1.125rem;
	background: #ddffee;
	margin-bottom: 0.5rem;
}
._60dc7z{
	margin-left: 0.25rem;
}
._starImg{
	display:inline-flex;
}
.reviewCount{
	font-size: 0.875rem;
	color: #484848;
}
._houseName{
	font-size:1.125rem !important;
}
._houseFacilities{
	font-size: 0.875rem;
	color: #717171;
}
._price{
	font-weight: bold;
	font-size: 1.125rem;
}
._oneNight{
	font-size: 1.125rem;
}
._priceContainer{
	position: absolute;
	bottom: 0rem;
	right: 0rem;
	
}
._heartButton{
	position:absolute;
	border-radius: 2rem;
	top:0.7rem;
	left:0.7rem;
	opacity:0.93;
	z-index: 5;
	width: 2rem;
	height: 2rem;
	background-color: white;
}
._heart{
	background-color: white;
    border: 0rem;
    height: 1rem;
    width: 1rem;
    padding: 0;
    opacity: 0.93;
    position: absolute;
    top: 0.4rem;
    left: 0.35rem;
}
</style>

</head>
<body>
<c:set var="sort" value="${sort}"/>

		<div class="filterBox">
			<div class="filterContainer">
				<div class="filterButton"><button class="dateButton btn btn-outline-primary" type="button">날짜</button></div>
				<div class="filterButton"><button class="peopleButton btn btn-outline-primary" type="button">인원</button></div>
				<div class="filterButton"><button class="localButton btn btn-outline-primary" type="button">지역</button></div>
				<div class="searchContainer">
					<input class="form-control" type="text" name="searchHouseName" placeholder="숙소명이름"/><button type="submit" class="searchBtn btn btn-primary btn-sm">검색</button>
				</div>		
			</div>
			<div class="formContainer">
				<form name="form" action="${root}/search" method="get" onsubmit="return confirmSubmit()">
					
					<div class="checkInOutContainer">
						<div class="checkInContainer">
							<label for="checkIn">Check In</label>
							<input class="form-control" type="text" name="checkIn" id="checkIn"/><i class="calenderIn far fa-calendar-alt fa-3x"></i>
						</div>
						<div class="checkOutContainer">
							<label for="checkOut">Check Out</label>
							<input class="form-control" type="text" name="checkOut" id="checkOut"/><i class="calenderOut far fa-calendar-alt fa-3x"></i>
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
						</select>
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
		    					 <label class="custom-control-label" for="seoguipo">중문 / 서귀포</label>
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
				</form>
			</div>
		</div>
		<div class="houseListContainer">
			<div class="houseListCount">
				300개 이상의 숙소
			</div>
			<div class="houseContainer">
				<div class="house">
					<div class="_gig1e7">
						<div class="_ylefn59">
							<div class="_houseCode" style="display:none;">10</div>
							<div class="_houseImg">
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="<spring:url value='/image/house1.png'/>"/></div>
										<div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="<spring:url value='/image/house2.png'/>"/></div>
										<div class="swiper-slide"><img style="max-width:100%; height:auto;" alt="img loading" src="<spring:url value='/image/house3.png'/>"/></div>
									</div>
									<!-- Add Pagination -->
									<div class="swiper-pagination"></div>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
								<div class="_heartButton">
									<button aria-label="목록에 숙소 추가하기" type="button" class="_heart _r0agyd heart${index.index}"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 1.3rem; width: 1.3rem; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>
								</div>
							</div>
							<div class="_houseInfo">
								<div class="_starRate"><span class="_60dc7z"><span class="_starImg"><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:0.75rem;width:0.75rem;fill:#FF385C"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg></span><span class="reviewRate">4.83</span><span class="reviewCount">(163)</span></span></div>
								<div class="_houseName">바다를 보며 잠이드는 곳 '산책하우스'</div>
								<div class="_houseFacilities" style="margin-top: 0.75rem">인원 3명 · 침대 1개 · 욕실 1개</div>
								<div class="_houseFacilities" style="margin-top: 0.25rem">난방 · 무료 주차 공간 · 헤어드라이어 · 주방</div>
								<div class="_priceContainer"><span class="_price">₩141,596</span><span class="_oneNight">/1박</span></div>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="mapContainer">
			<div id="map">
				${jsonHouseList}
			</div>
		</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


	<%-- boardSize:${boardSize}, currentPage:${currentPage}, count:${count}<br/><br/> --%>
	
	
</body>
</html>