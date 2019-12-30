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
<link rel="stylesheet" href="${root}/resources/css/guestHouse/guestHousePage.css"/>
<link rel="stylesheet" href="${root}/resources/css/review/review.css"/>
<script src="${root}/resources/javascript/review/review.js" type="text/javascript"></script>

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
	}); 
	
	function reservationFun(root,houseCode,email){
		
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
		 */
		alert(email);
		
		if(email!=""){
			var url2 = root+"/guestHousePage/limitCheck.do?houseCode="+houseCode;
			url2 += "&memberCode="+${memberCode}+"&checkIn="+ inputCheckIn +"&checkOut="+inputCheckOut+"&people="+people;
			alert(url2);
			
			location.href=url2;
		}else if(email==""){
			alert("로그인을 해주세요.");
		};
		
	}
	
	
</script>

</head>
<body>

<%-- 	<c:if test="${memberLevel == 'Admin'}">
		<button id="btn" class="btn" name="stateOk" onclick="location.href='${root}/admin/exState.do?exCode='+'${experienceDto.exCode}'">승인</button>
		<button id="btn" class="btn" name="stateNo" onclick="location.href='${root}/admin/exStateNo.do?exCode='+'${experienceDto.exCode}'">거절</button>
	</c:if>
 --%>
		<div class="top">
			<div class="img">
			<c:forEach var="fileDto" varStatus="list" items="${fileList}">
				<c:if test="${fileDto.mainImgName!=null}">
					<div id="mainImg">
						<img id="exImg" style="width: 100%; height: 100%;" alt="img loading" src="<spring:url value='/image/${fileDto.mainImgName}' />"/>
					</div>
				</c:if>
				<c:if test="${fileDto.fileName!=null}">

					<c:if test="${list.index<3}">
						<div id="roomImg" style="display:inline-block; float: left; width: 20rem; height: 27.42rem; overflow: hidden; border: 0.01rem solid blue; margin-right: 0.5rem;">
							<img id="exImg" alt="img loading"
								src="<spring:url value='/image/${fileDto.fileName}' />" />
						</div>
					</c:if>
					<!--  exFileList.size() > 3-->
					<c:if test="${list.index>=3}">
						<div id="roomImg" style="display:inline-block; float: left; width: 15rem; height: 13.5rem; margin-bottom: 0.3rem; overflow: hidden; border: 0.01rem solid blue; margin-right: 0.5rem;">
							<img id="exImg" alt="img loading"
								src="<spring:url value='/image/${fileDto.fileName}' />" />
						</div>
					</c:if>
				</c:if>
			</c:forEach>
			</div>
		</div>
		
		<div class="bot">
			<div class="guestHouse">
				<div class="name">${hostDto.houseName}</div>
		
				<div class="explain">${hostDto.explain}</div><br/>
			
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
				<!-- 리뷰수 count -->
				전체 리뷰 수: ${count}, 이 페이지의 리뷰 수 : ${reviewList.size()}, 현재 페이지: ${currentPage}
				
				<!-- 후기 리스트 -->
				<div>
				<c:if test ="${reviewList.size() > 0}">
					<c:forEach var="reviewDto" items="${reviewList}">
						<div class="form">
							
							<div class="title">
								
								<input type="hidden" name="houseCode" id="houseCode" value="${hostDto.houseCode}"/>						
								<!-- 리뷰 번호  -->
								예약번호: ${reviewDto.reserveCode} &nbsp;&nbsp;
								<input type="hidden" name="exReserveCode" id ="exReserveCode" value="${reviewDto.reserveCode}">
								
								<!-- 이메일 -->
								이메일: ${email}&nbsp;&nbsp;
							
								<!-- 후기 작성 시간 -->
								<fmt:formatDate value="${reviewDto.revDate}" pattern = "yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;
								
								<!-- session의 이메일과 등록한 이메일 같으면 수정, 삭제 화면 보이기 (본인만 수정 삭제 가능)-->
								<c:if test="${email eq reviewDto.email}"> 
									<a href="javascript:GHupdateCheck('${root}','${reviewDto.reserveCode}','${reviewDto.memberCode}','${reviewDto.revContent}')"	>수정</a>
									<a href="javascript:GHdeleteCheck('${root}','${reviewDto.reserveCode}','${reviewDto.memberCode}','${currentPage}','${hostDto.houseCode}')">삭제</a> 		
								</c:if>
							</div>
							<div class="content" >
								${reviewDto.revContent}
							</div>
							<!-- 별점 출력 -->
							<div>
								 ${reviewDto.revRate} 
								<span class="star-out">
								   <span class="output">
								       <input type="hidden" name="star-output" value="${reviewDto.revRate}" id="${reviewDto.revRate}">
								       <label for="${reviewDto.revRate}"></label>
								       <c:if test="${reviewDto.revRate==1}">
								       		<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
								       </c:if>
								       <c:if test="${reviewDto.revRate==2}">
								       		<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
								       </c:if>
								       <c:if test="${reviewDto.revRate==3}">
								       		<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
								       </c:if>
								       <c:if test="${reviewDto.revRate==4}">
								       		<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
								       </c:if>
								       <c:if test="${reviewDto.revRate==5}">
								       		<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
								       </c:if>
					   				</span>
								</span>
							</div>
						</div>
					</c:forEach>
				</c:if>
				</div>

				<!-- 후기 작성 -->
				<form action="${root}/guestHousePage/reviewOk.do" method="get"
					name="Form"
					onsubmit="return check('${revContent}','${revRate}')">
					<div id="write">

						<input type="hidden" name="houseCode" id="houseCode"
							value="${hostDto.houseCode}" />
						<%-- <input type="text" name="exReserveCode" value="${exReserveDto.exReserveCode}"/> --%>
						<%-- 후기 갯수가 0개 이거나 현재 페이지가 1일 경우 --%>
						<c:if test="${reviewList.size()==0 || currentPage==1}">
							<div class="form">
								<div class="title">
									<span>이메일</span> <input type="text" name="email" size="20"
										value="${email}" disabled="disabled" />

								</div>

								<div class="content">
									후기 내용
									<textarea rows="5" cols="53" name="revContent" id="revContent"
										class="revContent"></textarea>
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
									</span> <output for="star-input" name="starValue">
										<input type="hidden" name="revRate" id="revRate"
											class="revRate"></output>
									</span>

								</div>

								<%-- 
								전부 0값 들어감
								<input type="hidden" name="exReserveCode" value="${exReviewDto.exReserveCode}">
								<input type="hidden" name="memberCode" value="${exReviewDto.memberCode}">
								
								<input type="hidden" name="revContent" value="${revContent}">
								 --%>

								<!-- 별점 스크립트를 위해서 여기에 또 스트립트 선언 해줘야 함  -->
								<script type="text/javascript"
									src="${root}/resources/javascript/review/review.js"></script>

								<div class="bottom"
									style="text-align: left; margin-left: 300px; margin-top: 50px;">

									<%-- <button id="exReviewOk" onclick="exReviewChk('${root}')">확인</button> --%>
									<input type="hidden" name="houseCode"
										value="${hostDto.houseCode}" /> <input type="submit"
										value="확인" /> <input type="button" value="취소" />


								</div>
							</div>
						</c:if>
					</div>
				</form>

				<hr style="color: #cccccc">
				<div class="host">
					<p>호스트 소개</p>
					<div id="hostInfo">	
						<p id="hostName">호스트 이름 : ${host.memberName}</p>
						<p id="hostDate">회원가입 : ${regDate}</p>
						<!-- <span id="hStar">별점 : </span>&nbsp;
						<span id="revCount">리뷰 수 : </span><br/> -->
						<p id="pHostInfo"> ${host.memberInfo} </p>
					</div>
					<div id="hostImg" style="border: 1px solid;">
						<img id="hostImgSize" src="<spring:url value='/profileImg/${host.memberImgName}' />"/>
					</div>
				</div>
				
				<div id="map">
					<p>지역정보</p>
					<div id="houseMap" style="width: 500px;height: 400px;"></div>
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
				
				
				
				<br/>
				<div id="notice">
					<p>유의사항</p>
					<div id="checkTime">
						<span id="checkInTime"> check in : ${hostDto.checkInTime}</span>&nbsp;
						<span id="checkOutTime"> check out : ${hostDto.checkOutTime}</span>
					</div>
					<div id="etc" style="margin-top: 1.5rem;">
						<p>기타사항</p>
						${hostDto.etc}
					</div>
				</div>
			</div>
			
			<!-- <div class="wrap" style="display: inline-block;"> -->
			<div id="reserve">
				<p>예약하기</p>
					<div>
						시작일
					</div>
					<div>
						<input type="text" id="from">
					</div>
					<div>
						종료일
					</div>
					<div>
						<input type="text" id="to">
					</div>
					<div style="margin-bottom: 1rem; margin-top: 1rem;">
						<input id="people">
					</div>
						<script>
							$(function(){
								$("#people").spinner({
									min:1,
									step:1
								});
							});
							
						</script>
					<button class="btn" style="background-color: #008489; color: white; font-weight: bold;" onclick="reservationFun('${root}','${hostDto.houseCode}','${email}')">예약</button>
			</div>
			<!-- </div> -->
		</div>

	<!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>