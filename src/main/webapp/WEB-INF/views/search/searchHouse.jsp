<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/javascript/jquery/jquery-ui.css"/>
<script type="text/javascript" src="${root}/resources/javascript/search/search.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37448871d1dc7c24bd47df3b92bf2c3"></script>
<style type="text/css">
#map {
  width: calc(100% - 840px);
  height:calc(100% - 183px);
  position: fixed;
  right: 0px;
  top: 0px;
}
#filterContent{
	display:none;
}
.houseCode{
	display:none;
}
</style>
<script>
	$(function(){
		
		//하트 클릭
		$("._r0agyd").click(function(){
			
			var data;
			if($(this).children().attr("fill")=="currentColor"){
				$(this).children().attr("fill", "#FF385C");
				$(this).children().attr("fill-opacity", "1");
				$(this).children().attr("stroke","#FF385C");
				$(this).children().attr("stroke-width","1");
				data= { memberCode: "1", zzim: "1", houseCode: $(this).parent().children("div[class='houseCode']").text()};
			}else{
				$(this).children().attr("fill", "currentColor");
				$(this).children().attr("fill-opacity", "0");
				$(this).children().attr("stroke","#222222");
				$(this).children().attr("stroke-width","1.4");
				data= { memberCode: "1", houseCode: $(this).parent().children("div[class='houseCode']").text()};
			}
			$.ajax({
				  method: "GET",
				  url: "${root}/guestdelluna/zzim.do",
				  data: data,
				  success: function(){
					  alert("hi");
				  },
				  error: function(){
					  alert("아직안됨");
				  }
				})
			
		});
		
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
		
		/* $(".page > a").each(function(i,e){
			$('#'+(i+1)).attr("href",'${root}/search?pageNumber='+(i+1)+'&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}');
		}); */
		/* $("#2").attr("href",'${root}/search?pageNumber=2&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}');
		$(".page > a").click(function(){
			var url=this+'&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}';
			$(this).attr('href',url);			
		}); */
		
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

</head>
<body>
	<button id="filter">필터</button>
	<div id="filterContent">
		<form action="${root}/search" method="get" onsubmit="return confirmSubmit()">
			<div>
				체크인
				<input type="text" name="checkIn" id="checkIn"/><br/>
				체크아웃
				<input type="text" name="checkOut" id="checkOut"/><br/>
			</div><br/>
			
			
			<div>
				지역
				<input type="checkbox" class="all"/>전체<br/>
				<input type="checkbox" name="local[]" value="jeju" class="etc"/>제주시<br/>
				<input type="checkbox" name="local[]" value="jejuEast" class="etc"/>제주시 동부<br/>
				<input type="checkbox" name="local[]" value="jejuWest" class="etc"/>제주시 서부<br/>
				<input type="checkbox" name="local[]" value="seoguipo" class="etc"/>중문/서귀포<br/>
				<input type="checkbox" name="local[]" value="seoguipoEast" class="etc"/>서귀포시 동부<br/>
				<input type="checkbox" name="local[]" value="seoguipoWest" class="etc"/>서귀포시 서부<br/>
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
				검색
				<input type="text" name="searchHouseName" placeholder="숙소명이름"/><input type="submit" value="검색"/>
			</div>
			<br/><br/>
		</form>
	</div>




	boardSize:${boardSize}, currentPage:${currentPage}, count:${count}<br/><br/>
	
	<div id="map"></div>
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
	</script>
	
	<c:if test="${count==0||boardList.size()==0}">
		검색 결과가 없습니다
	</c:if>
	<c:if test="${count>0}">
		<c:forEach var="i" items="${searchHouseList}">
			<div class="house">
				<div class="houseCode">${i.houseCode}</div>
				<div class="houseName">${i.houseName}</div>
				${i.people}
				${i.latLng}
				${i.price}원/1박
				<button aria-label="목록에 숙소 추가하기" type="button" class="_r0agyd"><svg viewBox="0 0 24 24" fill="currentColor" fill-opacity="0" stroke="#222222" stroke-width="1.4" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round" style="height: 16px; width: 16px; display: block; overflow: visible;"><path d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6" stroke-linejoin="round"></path></svg></button>
			</div>
			<script>
				var latLng = '${i.latLng}';
				var index = latLng.indexOf(",");
				var lat = latLng.substring(0,index-1);
				var lng = latLng.substring(index+1);
				
				var content = '${i.houseName}';
				var markerPosition  = new kakao.maps.LatLng(lat, lng); 
				
				var marker = new kakao.maps.Marker({
				    position: markerPosition,
				});


				marker.setMap(map);
				// 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: content // 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			    function makeOverListener(map, marker, infowindow) {
			        return function() {
			            infowindow.open(map, marker);
			        };
			    }

			    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			    function makeOutListener(infowindow) {
			        return function() {
			            infowindow.close();
			        };
			    }
				
			</script>
			<br/><br/>
		</c:forEach>
	</c:if>
	<div class="page">
		<c:if test="${count>0}">
			<c:set var="pageBlock" value="${2}"/>
			<fmt:parseNumber var="result" value="${count/boardSize}" integerOnly="true"/>
			<c:set var="pageCount" value="${count%boardSize==0? result:result+1}"/>
			<fmt:parseNumber var="result2" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result2*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
			
				<c:if test="${startPage>1}">
					<a href="${root}/search?pageNumber=1&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}">[처음]</a>
					<a href="${root}/search?pageNumber=${startPage-pageBlock}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i==currentPage}">
						<a href="#" style="font-weight: bold;" id="${i}" class="n">${i}</a>
					</c:if>
					<c:if test="${i!=currentPage}">
						<a href="${root}/search?pageNumber=${i}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}" id="${i}" class="n">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage<pageCount}">
					<a href="${root}/search?pageNumber=${startPage+pageBlock}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}">[다음]</a>
					<a href="${root}/search?pageNumber=${pageCount}&checkIn=${checkIn}&checkOut=${checkOut}&local=${local}&people=${people}&searchHouseName=${searchHouseName}">[끝]</a>
				</c:if>
		</c:if>
	</div>
</body>
</html>