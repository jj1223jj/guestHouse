<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/base/jquery-ui.css">
<script type="text/javascript" src="${root}/resources/javascript/jquery/base/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50ff539a80f0de17cdf30d7ef1f997fc"></script>

<script type="text/javascript">
	var rangeDate = 31;
	var setSDate, setEDate;
	
	$(function(){
		$('#from').datepicker({
			dateFormat: 'yy-mm-dd',
			minDate: 0,
			onSelect: function(selectDate){
				var stxt = selectDate.split("-");
				stxt[1]=stxt[1]-1;
				var sdate = new Date(stxt[0],stxt[1],stxt[2]);
				var edate = new Date(stxt[0],stxt[1],stxt[2]);
				edate.setDate(sdate.getDate()+rangeDate);
				
				$('#to').datepicker('option',{
					minDate: selectDate,
					beforeShow: function(){
						$("#to").datepicker("option","maxDate",edate);
						setSDate = selectDate;
						console.log(setSDate)
				}});
			}
		});
		
		$('#to').datepicker({
			dateFormat: "yy-mm-dd",
			onSelect: function(selectDate){
				setEDate = selectDate;
				console.log(setEDate)
			}
		});
	});
	
	
	function reservationFun(root,houseCode,memberCode){
		
		var inputCheckIn = $('#from').val();
		var inputCheckOut = $('#to').val();
		//alert(inputCheckIn+","+inputCheckOut);
		
		if(inputCheckIn== ''){
			alert("시작일을 선택해주세요");
			$('input#from').focus();
			return false;
		}else if(inputCheckOut==''){
			alert('종료일을 선택해주세요');
			return false;
		}
		
		var t1 = inputCheckIn.split("-");
		var t2 = inputCheckOut.split("-");
		var t1date = new Date(t1[0],t1[1],t1[2]);
		var t2date = new Date(t2[0],t2[1],t2[2]);
		var diff = t2date - t1date;
		var currDay = 24*60*60*1000;
		if(parseInt(diff/currDay)>rangeDate){
			alert('선택 기간은'+rangeDate+'일을 초과할 수 없습니다.');
			return false;
		}
		
		//alert(t1+","+t1date);
		//alert('성공');
		
		var people = $('#people').val();
		alert(people);
		
		var url = root+"/guestHousePage/reservation.do?houseCode="+houseCode;
		url += "&memberCode="+memberCode+"&checkIn="+ inputCheckIn +"&checkOut="+inputCheckOut+"&people="+people;
		
		alert(url);
		
		location.href=url;
	}
	
	
</script>

</head>
<body>

	<%-- <div class="mainImg">
		<img src="<spring:url value='/image/${mainImg}' />"/>
	</div> --%>
	<div>
		<div class="img">
		<c:forEach var="fileDto" items="${fileList}">
			<c:if test="${fileDto.mainImgName!=null}">
				<img alt="img loading" src="<spring:url value='/image/${fileDto.mainImgName}' />"/>
			</c:if>
			<c:if test="${fileDto.fileName!=null}">
				<img alt="img loading" src="<spring:url value='/image/${fileDto.fileName}' />"/>
			</c:if>
		</c:forEach>
		</div>
		<br/>
		
		
		<br/>
		<!--  onclick="reservationFun('${root}','${hostDto.houseCode}')" -->
		
		<div >
			<div style="margin-left: 50px; display: inline; float: left;">
				<div class="guestHouse">
					<div class="name">guest house name : ${hostDto.houseName}</div>
			
					<div class="explain">설명 : ${hostDto.explain}</div><br/>
					
					<div class="facilites">
						<p>편의시설</p>
						<span id="necessary">necessary : ${hostDto.necessary}</span>&nbsp;&nbsp;&nbsp;
						<span id="wifi">wifi : ${hostDto.wifi}</span>
						<br/>
						<span id="hotWater">hotWater : ${hostDto.hotWater}</span>&nbsp;&nbsp;&nbsp;
						<span id="aircon">aircon : ${hostDto.aircon}</span>
						<br/>
						<span id="safety">safety : ${hostDto.safety}</span>&nbsp;&nbsp;&nbsp;
						<span id="mart">mart : ${hostDto.mart}</span>
						<br/>
						<span id="parking">parking : ${hostDto.parking}</span>&nbsp;&nbsp;&nbsp;
						<span id="kitchen">kitchen : ${hostDto.kitchen}</span>
						<br/>
						<span id="tv">tv : ${hostDto.tv}</span>&nbsp;&nbsp;&nbsp;
						<br/>
					</div>
					<br/>
					
					<div id="datepicker"></div>
					<script type="text/javascript">
						$("#datepicker").datepicker();
					</script>
					<br/>
					
					<div class="review">
						<h2>Review</h2>
						<span id="gStar">별점 : </span>&nbsp;
						<span id="gRevCount"> 후기</span><br/>
						<div>
							<p id="guestName">이름: </p>
							<p id="revDate">작성일:</p>
							<p id=revContent>내용:</p>
						</div>
					</div>
					
					<div class="host">
						<div>
							<img src="<spring:url value='/profileImg/${host.memberImgName}' />"/>
							<p id="hostName">호스트 이름 : ${host.memberName}</p>
							<p id="hostDate">회원가입 : ${regDate}</p>
							<span id="hStar">별점 : </span>&nbsp;
							<span id="revCount">리뷰 수 : </span><br/>
						</div>
						<div id="info"></div>
					</div>
					
					<h2>지역정보</h2>
					<div id="houseMap" style="width: 500px;height: 400px;"></div>
					<script>
						var container = document.getElementById('houseMap');
						var options = {
							center: new kakao.maps.LatLng(${lat}, ${lng}),
							level: 3
						};
				
						var map = new kakao.maps.Map(container, options);
						
						// 마커가 표시될 위치
						var markerPosition = new kakao.maps.LatLng(${lat}, ${lng});
						
						// 마커를 생성
						var marker = new kakao.maps.Marker({
							position: markerPosition
						});
						
						// 마커가 지도에 표시되도록 설정
						marker.setMap(map)
						
					</script>
					
					<br/>
					<div id="notice">
						<h2>유의사항</h2>
						<div id="checkTime">
							<span id="checkInTime"> check in : ${hostDto.checkInTime}</span>&nbsp;
							<span id="checkOutTime"> check out : ${hostDto.checkOutTime}</span>
						</div>
						<div id="etc">
							<h3>기타사항</h3>
							${hostDto.etc}
						</div>
					</div>
				</div>
			</div>
			
			<div class="wrap" style="margin-right: 50px; display: inline; float: left;">
				<div align="center">
				<h4>예약하기</h4>
					<div>
						시작일
					</div>
					<div>
						<input type="text" id="from">
					</div>
					<div>
						~종료일
					</div>
					<div>
						<input type="text" id="to">
					</div>
					<div>
						<input id="people">
						<script>$("#people").spinner();</script>
					</div>
					<button class="btn" onclick="reservationFun('${root}','${hostDto.houseCode}','${memberCode}')">조회</button>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>