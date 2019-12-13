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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37448871d1dc7c24bd47df3b92bf2c3&libraries=services"></script>

<script>
	$(function(){
		
		//현재 날짜
		var date = new Date();
		var today = dateToString(date);
		
		$("#checkIn").prop("placeholder",today);
		$("#checkIn").prop("value",today);
		
		date.setDate(date.getDate()+1);
		var tommorow = dateToString(date);
		
		$("#checkOut").prop("placeholder",tommorow);
		$("#checkOut").prop("value",tommorow);
		
		
		
		// 체크박스 전체와 나머지 클릭했을 때 어떻게 동작할지 처리
		$(".all").click(function(){
			if($(".all:checkbox").is(":checked")){
				$(".etc:checkbox").prop("checked", false);
			}
		});
		$(".etc").click(function(){
			if($(".etc:checkbox").is(":checked")){
				$(".all:checkbox").prop("checked", false);
			}
		});
			
		
		//체크인 달력 띄워주기
		$("#checkIn").datepicker({
			minDate: 0,
			showMonthAfterYear: true,
			yearSuffix: "년",
			dateFormat:"yy-mm-dd",
			monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
			dayNamesMin: [ "월", "화", "수", "목", "금", "토", "일" ],
			onClose: function(selectedDate){
				// #checkOut의 최소설정 날짜(+1), 최대설정 날짜 정해주기(+7)
				var min = new Date(selectedDate);
				min.setDate(min.getDate()+1);
				var minDate = dateToString(min);
				
				var max = new Date(selectedDate);
				max.setDate(max.getDate()+7);
				var maxDate = dateToString(max);
				
				$("#checkOut").datepicker("option",{minDate: minDate, maxDate: maxDate});
			}
		});
		//체크아웃 달력 띄워주기
		$("#checkOut").datepicker({
			minDate: 1,
			maxDate: 7,
			showMonthAfterYear: true,
			yearSuffix: "년",
			dateFormat:"yy-mm-dd",
			monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
			dayNamesMin: [ "월", "화", "수", "목", "금", "토", "일" ],
		});
	});
	
	// date타입을 "yyyy-mm-dd"형식 문자열로 바꿔주는 함수
	function dateToString(date){
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	
	function confirmSubmit(){
		$("input[name='local[]'").each(function(i, e){
			if(e.checked==true){
				$("#local").val($("#local").val()+e.value+",");
			}
		});
	}
</script>



</head>
<body>

	<!-- 셀렉트바로 만들기 -->
	<form name="form" action="${root}/search" method="get" onsubmit="return confirmSubmit()">
	
		<input type="checkbox" name="local[]" value="all" class="all" checked="checked"/>전체<br/>
		<input type="checkbox" name="local[]" value="jeju" class="etc"/>제주시<br/>
		<input type="checkbox" name="local[]" value="jejuEast" class="etc"/>제주시 동부<br/>
		<input type="checkbox" name="local[]" value="jejuWest" class="etc"/>제주시 서부<br/>
		<input type="checkbox" name="local[]" value="seoguipo" class="etc"/>중문/서귀포<br/>
		<input type="checkbox" name="local[]" value="seoguipoEast" class="etc"/>서귀포시 동부<br/>
		<input type="checkbox" name="local[]" value="seoguipoWest" class="etc"/>서귀포시 서부<br/>
		<input type="hidden" name="local" id="local"/>
		<br/>
		
		<div>
			체크인
			<input type="text" name="checkIn" id="checkIn" placeholder="2019-12-12" value="2019-12-12"/><br/>
			체크아웃
			<input type="text" name="checkOut" id="checkOut" placaholder="2019-12-13" value="2019-12-13"/><br/>
		</div><br/>
		가격
		<select title="가격" id="searchPrice" name="price">
			<option value>전체</option>
			<option value="0/50000">5만원이하</option>
			<option value="50000/100000">5~10만원</option>
			<option value="100000/150000">10~15만원</option>
			<option value="150000/">15만원이상</option>
		</select><br/>
		인원
		<select title="인원" id="searchPeople" name="people">
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">4명</option>
			<option value="5">5명이상</option>
		</select><br/>
		<input type="submit" value="검색">
		<br/><br/>
	</form>
		
		<!-- 카카오 지도 api -->
		<input type="text" id="address" placeholder="주소" name="address">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
			    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
			};
			
			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng(37.537187, 127.005476),
			    map: map
			});
			
			var ck="";
			function clk(){
				if(ck!="")
					alert(ck);
			}
			function sample5_execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            var addr = data.address; // 최종 주소 변수
						alert(data.bname);
						alert(data.roadname);
						alert(data.autoJibunAddress);
						alert(data.sigungu+data.sido);
			            // 주소 정보를 해당 필드에 넣는다.
			            document.getElementById("address").value = addr;
			            // 주소로 상세 정보를 검색
			            geocoder.addressSearch(data.address, function(results, status) {
			                // 정상적으로 검색이 완료됐으면
			                if (status === daum.maps.services.Status.OK) {
			
			                    var result = results[0]; //첫번째 결과의 값을 활용
			                    // 해당 주소에 대한 좌표를 받아서
			                    var coords = new daum.maps.LatLng(result.y, result.x);
			                    alert(coords);
			                    ck=coords;
			                    document.getElementById("latlng").value= coords;
			                    // 지도를 보여준다.
			                    mapContainer.style.display = "block";
			                    map.relayout();
			                    // 지도 중심을 변경한다.
			                    map.setCenter(coords);
			                    // 마커를 결과값으로 받은 위치로 옮긴다.
			                    marker.setPosition(coords)
			                }
			            });
			        }
			    }).open();
			}	
		</script>
	
	
		<input type="button" id="btn" value="위도,경도" onclick="clk()"/>
		<input type="hidden" id="latlng" name="latlng"/>
		
	
</body>
</html>