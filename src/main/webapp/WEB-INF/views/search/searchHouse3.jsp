<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="pageBlock" value="${5}"/>
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
		heart('${memberCode}');
		
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
			}
		});
		$(".peopleButton").click(function(){
			if($(".peopleContainer").css("display")=="inline-block"){
				$(".peopleContainer").css("display","none");
			}else{
				$(".peopleContainer").css("display","inline-block");
			}
		});
		$(".localButton").click(function(){
			if($(".localContainer").css("display")=="inline-flex"){
				$(".localContainer").css("display","none");
			}else{
				$(".localContainer").css("display","inline-flex");
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
form{
	height: 75px;
	display: block;
}

.filterButton{
	display: inline-block;
}
.btn{
	border-radius: 15px;
}
.custom-select{
	width:140px;
}
.checkInLabel, .checkOutLabel{
	font-size: 24px;
}
.checkInContainer, .checkOutContainer{
	width:230px;
	display:inline-block;
}
.localAll, .localJeju, .localSeoguipo{
	font: 16px bold;
}
.localAll{
	width: 70px;
}
.localJeju{
	width: 120px;
}
.localSeoguipo{
	width: 140px;
}
.checkInOutContainer .form-control{
	display:inline-block;
	width: 110px;
	height: 25px;
}
.searchContainer .form-control{
	display:inline-block;
	width: 110px;
	height: 25px;
}
.calender::before{
	margin-top: 10px;
}
.checkInInput, .checkOutInput{
	position: relative;
	
}
i{
	position: absolute;
	right:4px;
	top:-5px;
}
.custom-control{
	margin-bottom: 0px !important;
}

.localContainer{
	display: none;
}

.peopleContainer{
	margin-top: 18px;
	width: 200px;
	font-size: 20px;
	display: none;
}

.searchContainer{
	font-size: 20px;
	display: inline-block;
}
.container{
	position: relative;
}

.searchBtn{
	margin-left:10px;
}
.checkInOutContainer{
	margin-top: 19px;	
	margin-left: 15px;
	display:none;
}

.checkInOutContainer label{
	font-size: 20px
}
.filterBox{
	margin-top:15px;
	width:1500px;
	height:50px;
}
.house{
	position:relative;
}
.hi{
	width:100px;
	height: 100px;
}
.houseList:hover{
	cursor: pointer;
}
</style>

</head>
<body>
<c:set var="sort" value="${sort}"/>



	<div>
		<div class="filterBox">
				<div class="filterContainer">
					<div class="filterButton"><button class="dateButton btn btn-outline-primary" type="button">날짜</button></div>
					<div class="filterButton"><button class="peopleButton btn btn-outline-primary" type="button">인원</button></div>
					<div class="filterButton"><button class="localButton btn btn-outline-primary" type="button">지역</button></div>
					<div class="searchContainer">
						<input class="form-control" type="text" name="searchHouseName" placeholder="숙소명이름"/><button type="submit" class="searchBtn btn btn-primary btn-sm">검색</button>
					</div>		
				</div>
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



	<%-- boardSize:${boardSize}, currentPage:${currentPage}, count:${count}<br/><br/> --%>
	<div>
		<button id="priceHigh">가격높은순</button>
		<button id="priceLow">가격낮은순</button>
		<button id="rateSort">별점높은순</button>
		<input id="sort" type="hidden" name="sort"/>
	</div>
	<div id="map"></div>
	
	
	<c:if test="${count==0||boardList.size()==0}">
		검색 결과가 없습니다
	</c:if>
	<c:if test="${count>0}">
		<c:forEach var="i" items="${searchHouseList}" varStatus="index" >
			<div class="houseList house${index.index}" onclick="location.href='${root}/guestHousePage/guestHouse.do?houseCode=${i.houseCode}'">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:forEach var="j" items="${i.fileList}">
							<div class="swiper-slide"><img alt="img loading" src="<spring:url value='/image/${j.fileName}'/>"/></div>
						</c:forEach>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
				<div class="house">
					<div class="houseCode">${i.houseCode}</div>
					<div class="houseName">${i.houseName}</div>
					<div>인원${i.people}</div>
					<div>${i.latLng}</div>
					<div><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height: 12px; width: 12px; fill: #FF385C;"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg>${i.revRate}(${i.revCount})</div>
					<div>${i.price}원/1박</div>
					<c:if test="${i.zzimed==null}">
						<button aria-label="목록에 숙소 추가하기" type="button" class="_r0agyd heart${index.index}"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 16px; width: 16px; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>
					</c:if>
					<c:if test="${i.zzimed!=null}">
						<button aria-label="목록에 숙소 추가하기" type="button" class="_r0agyd heart${index.index}"><svg viewBox="0 0 24 24" fill="#FF385C" fill-opacity="1" stroke="#FF385C" stroke-width="1" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 16px; width: 16px; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>
					</c:if>
				</div>
				
				<br/><br/>
			</div>
		</c:forEach>
		<script>
			if('${local}'==""){
				var center=new kakao.maps.LatLng(33.450701, 126.570667); //지도의 중심좌표.
			}else{
				var center=new kakao.maps.LatLng(33.53630753279682, 126.83552349439641);
			}
				
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: center,
				level: 10 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options);
			$(".overlaybox").css("display","none");
			var control = new kakao.maps.ZoomControl();
			map.addControl(control, kakao.maps.ControlPosition.BOTTOMRIGHT); 
	
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMRIGHT); 
		</script>
		<script>
			var houseJson = $.parseJSON('${houseJson}').houseJson;
			console.log(houseJson);
			var marker= [];
			var customOverlay = [];
			var position = [];
			var content = [];
			var bounds = new kakao.maps.LatLngBounds();

			/* for(let j=0; j<houseJson[i].fileList.length;j++){
			content[i]+=
			'				';
			} */
			for(let i=0; i<houseJson.length;i++){
				
				position[i]= new kakao.maps.LatLng(houseJson[i].lat, houseJson[i].lng);
				bounds.extend(position[i]);
				marker[i]= new kakao.maps.Marker({
					map: map, 
					position: position[i] // 마커의 위치
				});
				
				
				
				
			
				content[i] = '<div class="overlaybox box'+i+'">' +
				'    <div class="boxtitle">'+houseJson[i].houseName+'</div>' +
				'    <ul>' +
				'        <li class="up">' +
				'<div class="swiper-container">' +
				'	<div class="swiper-wrapper">';
				

						for(let j=0; j<houseJson[i].fileList.length;j++){
				content[i]+=	'<div class="swiper-slide"><img alt="img loading" src="<spring:url value="/image/'+houseJson[i].fileList[j].fileName+'"/>"/></div>';
						}
					
					
					
						
				content[i]+=		
				'	</div>' +
				'	<div class="swiper-pagination"></div>' +
				'	<div class="swiper-button-next"></div>' +
				'	<div class="swiper-button-prev"></div>' +
				'</div>' +
				'            <span class="number">인원'+houseJson[i].people+'</span>' +
				'            <span class="people">가격'+houseJson[i].price+'</span>' +
				'            <span class="revRate"><svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height: 12px; width: 12px; fill: #FF385C;"><path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z"></path></svg>'+houseJson[i].revRate+'('+houseJson[i].revCount+')</span>' +
				'			 <div class="houseCode">'+houseJson[i].houseCode+'</div>';
				if(houseJson[i].zzimed==null){
				content[i]+=
				'			 <button aria-label="목록에 숙소 추가하기" type="button" class="_r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 16px; width: 16px; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
				}else{
				content[i]+=
				'			 <button aria-label="목록에 숙소 추가하기" type="button" class="_r0agyd heart'+i+'"><svg viewBox="0 0 24 24" fill="#FF385C" fill-opacity="1" stroke="#FF385C" stroke-width="1" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 16px; width: 16px; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>';
				}
				content[i]+=
				'        </li>' +
				'    </ul>' +
				'</div>';
				console.log(content[i]);

				customOverlay[i] = new kakao.maps.CustomOverlay({
						position: position[i],
						content: content[i],
						clickable: true,
						zIndex: 6,
						xAnchor: 0.3,
						yAnchor: 1.14,
				});

				customOverlay[i].setMap(map);

				kakao.maps.event.addListener(marker[i], 'click', function() {
					for(let j=0; j<houseJson.length;j++){
						$(".box"+j).css("display","none");
						if($(".box"+i).css("display")=="none"){
							$(".box"+i).css("display","block");
						}
					}
				});
				
				kakao.maps.event.addListener(marker[i], 'mouseover', function() {
				    marker[i].setZIndex(5);
				});
				
				kakao.maps.event.addListener(marker[i], 'mouseout', function() {
				    marker[i].setZIndex(3);
				});
			}
			map.setBounds(bounds);
			map.setLevel(10);
			$(".overlaybox").css("display","none");
			kakao.maps.event.addListener(map, 'click', function() {
				$(".overlaybox").css("display","none");
			});
		</script>
	</c:if>
	
	
	
	<div class="page">
		<c:if test="${count>0}">
			<fmt:parseNumber var="result" value="${count/boardSize}" integerOnly="true"/>
			<c:set var="pageCount" value="${count%boardSize==0? result:result+1}"/>
			<fmt:parseNumber var="result2" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result2*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
			
				<c:if test="${startPage>1}">
					<a href="${root}/search?pageNumber=1&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}&sort=${sort}">[처음]</a>
					<a href="${root}/search?pageNumber=${startPage-pageBlock}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}&sort=${sort}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i==currentPage}">
						<a href="#" style="font-weight: bold;" id="${i}" class="n">${i}</a>
					</c:if>
					<c:if test="${i!=currentPage}">
						<a href="${root}/search?pageNumber=${i}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}&sort=${sort}" id="${i}" class="n">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage<pageCount}">
					<a href="${root}/search?pageNumber=${startPage+pageBlock}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}&sort=${sort}">[다음]</a>
					<a href="${root}/search?pageNumber=${pageCount}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}&sort=${sort}">[끝]</a>
				</c:if>
		</c:if>
	</div>
</body>
</html>