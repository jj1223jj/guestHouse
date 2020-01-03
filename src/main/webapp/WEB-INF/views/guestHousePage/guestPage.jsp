<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

<link rel="stylesheet" href="${root}/resources/javascript/jquery/base/jquery-ui.css">
<script type="text/javascript" src="${root}/resources/javascript/jquery/base/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50ff539a80f0de17cdf30d7ef1f997fc"></script>
<link rel="stylesheet" href="${root}/resources/css/guestHouse/guestHousePage.css" />

<script src="${root}/resources/javascript/review/review.js" type="text/javascript"></script>
<link rel="stylesheet" href="${root}/resources/css/review/review.css" />

<style type="text/css">
html {
	font-size: 16px;
}
</style>
<!-- <script>
$(document).ready(function(){
	
	var divs = document.querySelectorAll('.img div');

	for(var i=0; i<divs.length;++i){
		var div = divs[i];
		var divAspect = div.offsetHeight/div.offsetWidth;
		div.style.overflow='hidden';
		
		var img = div.querySelector('#exImg');
		var imgAspect = div.height / div.width;
		
		
		if(imgAspect <= divAspect){
			// 이미지가 div보다 작은경우 세로를 div에 맞추고 잘라낸다
			var imgWidthActual = div.offsetHeight/ imgAspect;
			var imgWidthToBe = div.offsetHeight / divAspect;
			var marginLeft = -Math.round((imgWidthActual - imgWidthToBe)/2);
			img.style.cssText = 'width: auto; height: 100%; margin-left:'+marginLeft+'rem;'
			
		}else{
			//이미지가 div보다 긴 경우 가로를 div에 맞추고 세로를 잘라냄
			img.style.cssText='width:100% height:auto; margin-left:0;';
		}
	}
	
});
</script> -->
<script>
$(function(){
	ghLoad('${root}' ,'${sessionScope.email}','${hostDto.houseCode}');
});
</script>
<script type="text/javascript">	
	var rangeDate = 31;
	var setSDate, setEDate;
	

	var disabledDays = [];

	<c:forEach items="${dList}" var="i">
		disabledDays.push("${i}");
	</c:forEach>


	function disableSomeDay(date){
		var month = date.getMonth();
		var dates = date.getDate();
		var year = date.getFullYear();
		console.log('Checking (raw): ' + year + '-' + month + '-' + dates);
		
		
		for(i=0; i<disabledDays.length; i++){
			
			if($.inArray(year+'-'+(month+1)+'-'+dates,disabledDays)!=-1|| new Date() > date){
				console.log('bad:  ' + year + '-' + (month+1) + '-' + dates + ' / ' + disabledDays[i]);
				return [false];
			}
		}
		console.log('good:  ' + year + '-' + (month+1) + '-' + dates);
		return [true];
	}
	
	
	jQuery(document).ready(function(){
		jQuery('#from').datepicker({
			dateFormat: 'yy-mm-dd',
			minDate: 0,
			beforeShowDay:disableSomeDay,
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
					}
				});
			}
		});
		
		jQuery('#to').datepicker({
			dateFormat: "yy-mm-dd",
			onSelect: function(selectDate){
				setEDate = selectDate;
				console.log(setEDate)
			}
		});
		starRating();
	}); 
	
	function reservationFun(root,houseCode,memberCode,emailCheck){
		
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
		
	
		/* 
		var url = root+"/guestHousePage/reservation.do?houseCode="+houseCode;
		url += "&memberCode="+memberCode+"&checkIn="+ inputCheckIn +"&checkOut="+inputCheckOut+"&people="+people;
		 *//* 
		alert(emailCheck);
		
		if(emailCheck=='1'){ */
		var url2 = root+"/guestHousePage/limitCheck.do?houseCode="+houseCode;
		url2 += "&memberCode="+memberCode+"&checkIn="+ inputCheckIn +"&checkOut="+inputCheckOut+"&people="+people;
		alert(url2); 
		
		location.href=url2;
	/* 			
			alert("ㅎㅇ");
		}else if(emailCheck=='0'){
			alert("로그인을 해주세요.");
		}; */
		
	}
	
</script>

</head>
<body>

	<%-- 	승인/거절 controller 추가 --%>

	<c:if test="${memberLevel == 'Admin'}">
		<button id="btn" class="btn" name="stateOk"
			onclick="location.href='${root}/admin/state.do?houseCode='+'${hostDto.houseCode}'">승인</button>
		<button id="btn" class="btn" name="stateNo"
			onclick="location.href='${root}/admin/stateNo.do?houseCode='+'${hostDto.houseCode}'">거절</button>
	</c:if>

	<div class="top">
		<div class="img">
			<c:forEach var="fileDto" varStatus="list" items="${fileList}">
				<c:if test="${fileDto.mainImgName!=null}">
					<div id="mainImg">
						<img id="exImg" style="width: 100%; height: 100%;"
							alt="img loading"
							src="<spring:url value='/image/${fileDto.mainImgName}' />" />
					</div>
				</c:if>
			</c:forEach>
			<div id="imagesWrap">
				<c:forEach var="fileDto" varStatus="list" items="${fileList}">
					<c:if test="${fileDto.fileName!=null}">
						<c:if test="${(list.index)%2!=0}">
							<div
								style="width: 50%; height: 50%; /* border: 0.2rem solid green; */ float: left;">
								<img id="exImg" alt="img loading"
									src="<spring:url value='/image/${fileDto.fileName}' />" />
							</div>
						</c:if>
						<c:if test="${(list.index)%2==0}">
							<div
								style="width: 50%; height: 50%; /* border: 0.2rem solid green;  */display: inline-block;">
								<img id="exImg" alt="img loading"
									src="<spring:url value='/image/${fileDto.fileName}' />" />
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="bot">
		<div class="guestHouse">
			<div class="name">${hostDto.houseName}</div>

			<div class="explain">${explain}</div>
			<br />

			<div class="facilites">
				<p>편의시설</p>
				<div id="fRight">
					<p id="necessary">necessary : ${hostDto.necessary}</p>
					<p id="wifi">wifi : ${hostDto.wifi}</p>
					<p id="hotWater">hotWater : ${hostDto.hotWater}</p>
					<p id="aircon">aircon : ${hostDto.aircon}</p>
					<p id="safety">safety : ${hostDto.safety}</p>
				</div>
				<div id="fLeft">
					<p id="mart">mart : ${hostDto.mart}</p>
					<p id="parking">parking : ${hostDto.parking}</p>
					<p id="kitchen">kitchen : ${hostDto.kitchen}</p>
					<p id="tv">tv : ${hostDto.tv}</p>
				</div>
			</div>

			<hr style="color: #cccccc">

			<div id="calendar">
				<p>예약가능날짜</p>
				<div id="datepicker"></div>
			</div>
			<script type="text/javascript">
					jQuery(document).ready(function(){
						jQuery('#datepicker').datepicker({
							dateFormat: 'yy-mm-dd',
							preText:'이전 달',
							nextText: '다음 달',
							monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
							monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
							dayNames:['일','월','화','수','목','금','토'],
							dayNamesShort:['일','월','화','수','목','금','토'],
							dayNamesMin:['일','월','화','수','목','금','토'],
							showMonthAfterYear: true,
							changeMonth: true,
							changeYear: true,
							yearSuffix: '년',
							beforeShowDay:disableSomeDay
						});
					});
					
					
					var disabledDays = [];

					<c:forEach items="${dList}" var="i">
						disabledDays.push("${i}");
					</c:forEach>

					function disableSomeDay(date){
						var month = date.getMonth();
						var dates = date.getDate();
						var year = date.getFullYear();
						console.log('Checking (raw): ' + year + '-' + month + '-' + dates);
						
						
						for(i=0; i<disabledDays.length; i++){
							
							if($.inArray(year+'-'+(month+1)+'-'+dates,disabledDays)!=-1|| new Date() > date){
								console.log('bad:  ' + year + '-' + (month+1) + '-' + dates + ' / ' + disabledDays[i]);
								return [false];
							}
						}
						console.log('good:  ' + year + '-' + (month+1) + '-' + dates);
						return [true];
					}
				
			</script>
			
			<hr style="color: #cccccc">
			<!-- 후기 전체 -->
			<div id="reviewAll">
				<!-- 후기 작성 -->
				<c:if test="${memberLevel!=null}">
					<form action="${root}/guestHousePage/reviewOk.do" method="get"
						name="Form" onsubmit="return check(form)">
						<div id="write">
							<input type="hidden" name="houseCode" id="houseCode"
								value="${hostDto.houseCode}" />
		
							<%-- 후기 갯수가 0개 이거나 현재 페이지가 1일 경우 --%>
		
							<div class="form">
								<div class="title">
									<div id="titleEmail">이메일</div>
									<input type="text" name="email" size="20" value="${email}"
										disabled="disabled" class="form-control" />
								</div>
		
								<div>
									<span class="star-input"> <span class="input"> <input
											type="radio" name="star-input" value="1" id="p1"> <label
											for="p1">1</label> <input type="radio" name="star-input"
											value="2" id="p2"> <label for="p2">2</label> <input
											type="radio" name="star-input" value="3" id="p3"> <label
											for="p3">3</label> <input type="radio" name="star-input"
											value="4" id="p4"> <label for="p4">4</label> <input
											type="radio" name="star-input" value="5" id="p5"> <label
											for="p5">5</label>
									</span> <output for="star-input" name="starValue"> <input
											type="hidden" name="revRate" id="revRate" class="revRate">
										</output>
									</span>
								</div>
		
								<div class="content" style="display: inline-block;">
									<div calss="form-group">
										<textarea rows="5" cols="53" name="revContent" id="revContent"
											class="revContent"></textarea>
									</div>
								</div>
		
								<!-- 별점 스크립트를 위해서 여기에 또 스트립트 선언 해줘야 함  -->
								<script type="text/javascript"
									src="${root}/resources/javascript/review/review.js"></script>
		
								<div class="bottom" style="text-align: left; margin-left: 18rem; margin-top: 1rem;">
		
									<input type="hidden" name="houseCode"
										value="${hostDto.houseCode}" /> <input type="submit"
										class="btn btn-light" value="확인" /> <input type="button"
										class="btn link" value="취소" />
								</div>
							</div>
						</div>
					</form>
				</c:if>
				<!-- 후기 리스트 -->
				<div>
					<div id="contentData"></div>
					<div id="moreReviewB">
						<button id="reviewBtn" type="button" class="btn btn-light"
							onclick="ghMoreView('${root}','${email}','${hostDto.houseCode}')">후기
							더보기</button>
					</div>
				</div>
			</div>

			<hr style="color: #cccccc">
			<div class="host">
				<div id="hostInfo">
					<div style="display: inline-block;">
					<div id="hostName">호스트: ${host.memberName}</div>
					<div id="hostDate">회원가입 : ${regDate}</div>
					</div>
					<div id="hostImg">
					<img id="hostImgSize"
						src="<spring:url value='/profileImg/${host.memberImgName}' />" />
					</div>
				</div>
				<p id="pHostInfo">${host.memberInfo}</p>
			</div>

			<div id="map">
				<p>지역정보</p>
				<div id="houseMap"></div>
			</div>
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
			<div id="notice">
				<p>유의사항</p>
				<div id="checkTime">
					<span id="checkInTime"> check in : ${hostDto.checkInTime}</span>&nbsp;
					<span id="checkOutTime"> check out : ${hostDto.checkOutTime}</span>
				</div>
				<div id="etc" style="margin-top: 1.5rem;">
					<p>기타사항</p>
					${etc}
				</div>
			</div>
			
			
		</div>

		<!-- <div class="wrap" style="display: inline-block;"> -->
		<div id="reserve">
			<div id="reserveMargin">
				<p>예약할 날짜를 입력하세요.</p>

				<hr style="color: #cccccc">

				<span id="formToText">날짜</span>
				<div id="formTo">
					<div style="float: left;">
						<input type="text" id="from" value="체크인">
					</div>
					<div style="display:inline-block;">
						<input type="text" id="to" value="체크아웃">
					</div>
				</div>


				<div>
					<div id="peopleText">인원</div>
					<input id="people" value="1">
				</div>
				<script>
							$(function(){
								$("#people").spinner({
									min:1,
									step:1
								});
							});
				</script>
				<c:if test="${emailCheck == 1}">
					<button class="btn"
						style="width: 100%; margin-top: 1.5rem; background-color: #008489; color: white; font-weight: bold;"
						onclick="reservationFun('${root}','${hostDto.houseCode}','${memberCode}','${emailCheck}')">예약하기</button>
				</c:if>
				<c:if test="${emailCheck==0}">
					<div id="loginText">예약하려면 로그인을 해주세요.</div>
				</c:if>
			</div>
		</div>
		<!-- </div> -->
		
	</div>

	

	<!-- footer 겹침현상 제거 -->
	<div style="clear: both;"></div>

	<!-- 모달 -->

	<div class="modal fade" id="updateModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">후기 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>

				<!-- Modal body -->
				<div class="form-group">
					<form class="form"
						action="${root}/guestHousePage/reviewUpdateOk.do?memberCode=${memberCode}&reserveCode=${reserveCode}&pageNumber=${currentPage}"
						method="get">
						<!-- onsubmit="return checkUp()" -->

						<div class="title">
							<input type="hidden" name="memberCode" value="${memberCode}" /> <input
								type="hidden" name="reserveCode" id="reserveCode"
								value="${reserveCode}" /> <span>
								<!-- 이메일 -->
							</span> <input type="text" name="email" size="20" value="${email}"
								disabled="disabled" class="form-control"
								style="width: 20rem; margin-left: 5.4rem; margin-top: 3rem;" />

						</div>

						<div class="content" style="margin-top: 2rem;">

							<textarea name="revContent" id="modalRevContent"
								class="form-control"
								style="background: #fff; border: none; width: 20rem; margin-left: 5.4rem; -webkit-box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0, 0, 0, 0.16); -moz-box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0, 0, 0, 0.16); box-shadow: 0rem 0.063rem 0.25rem 0.125rem rgba(0, 0, 0, 0.16); border-radius: 0.938rem; display: inline-block;"></textarea>

							<%-- <textarea rows="3" cols="53" name="revContent" id="modalRevContent" class="form-control">${revContent}</textarea>  --%>
						</div>
						<div>
							<link rel="stylesheet" href="${root}/resources/css/review/review.css" />
							<span class="mstar-input"> 
								<span class="minput" style="margin-left: 9rem; margin-bottom: 5rem;"> 
								<input type="radio" name="mstar-input" value="1" id="mp1"> 
								<label for="mp1">1</label> 
								<input type="radio" name="mstar-input" value="2" id="mp2"> 
								<label for="mp2">2</label> 
								<input type="radio" name="mstar-input" value="3" id="mp3"> 
								<label for="mp3">3</label> 
								<input type="radio" name="mstar-input" value="4" id="mp4"> 
								<label for="mp4">4</label> 
								<input type="radio" name="mstar-input" value="5" id="mp5"> 
								<label for="mp5">5</label>
								</span> 
								<output for="mstar-input" name="mstarValue">
									<input type="hidden" name="revRate" id="revRate" class="revRate" />
								</output>
							</span>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<div style="width: 10rem; margin-right: 10rem;" align="center">
								<button id="modalSubmit" type="button" class="btn btn-info"
									onclick='ghReviewModalUpdate(form)'>수정</button>
								<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
							</div>
						</div>

						<!-- 
				<div class="modal-footer" style="text-align: right;">
					<input type="submit" value="확인" />
					<input type="reset" value="취소" onclick="self.close()"/>
				</div> -->
					</form>
				</div>


			</div>
		</div>
	</div>

</body>
</html>