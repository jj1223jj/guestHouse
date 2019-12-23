<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">
<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>

<script type="text/javascript">
 function exReserveOk(root, exCode, memberCode, exDateS, exPeople, exPayment){
	
	
	alert(root +", "+ exCode +", "+memberCode+", "+exDateS+", "+exPeople+", "+exPayment);
	
	var usePoint =$("#usePoint").val();	// 사용포인트
	if(usePoint == ""){
		usePoint = 0;
	}
	alert(usePoint);
	
	var resPoint;	// 적립포인트
	var realTotal;
	
	if(usePoint==0){
		resPoint = exPayment*0.01;	// 결제금액에서 1%적립
		realTotal = exPayment;
	}else{
		realTotal = exPayment - usePoint;	// 사용한 포인트만큼 결제금액 차감
		resPoint = 0;
	}
	
	var url = root+"/experience/exReserveOk.do?exCode="+exCode;
	url += "&memberCode="+memberCode+"&exDateS="+ exDateS +"&exPeople="+exPeople;
	url += "&exPayment="+realTotal+"&point="+resPoint+"&usePoint="+usePoint;
	
	alert(url);
	
	location.href=url;
};
</script>

</head>
<body>
	<div align="center">
		<h3>예약페이지</h3>
		<br/>
		
		<h1>체험 이용규칙 확인하기</h1>
		<div class="top">
			<div class="experience">
				<div id="Info">
					<p>설명 : ${experienceDto.exExplain}</p>
					<p>주소: ${experienceDto.exAddress}</p>
					<p>체험 시간: ${experienceDto.exTime}</p>
					<img src="<spring:url value='/exImage/${mainImg}' />" />
					
				</div>
				<span id="star">평점: </span>&nbsp;&nbsp;&nbsp;
				<span id="revCount">후기   ${review}  개</span>
			</div>
			<div class="reserve">
				<p id="people">게스트 ${exPeople}명</p>
				<p id="exDate">체험 날짜: ${exDateS}</p>
				
				<br/>
				<p id="price">금액                        	${exPayment/exPeople}원 X ${exPeople} </p>
				<p id="total">총합계(KRW)     ${exPayment}</p>
				
			</div>
		</div>
		
		
		<hr color="#CCCCCC"/>
		
		<div class="bot">
			<div id="pay">
				<h3>결제수단</h3>
				
				<select name="payment" id="payment">
					<option value="select" selected="selected">선택하세요</option>
					<option value="account" id="account">무통장입금</option>
					<option value="card" id="card">카드결제</option>
				</select>
				<br/>
				
				<span>point  </span>
				<span><input id="usePoint"></span>
				<script>
					$(function(){
						$("#usePoint").spinner({
							max: ${point},
							min:0,
							step:100
						});
					});
				</script>
				<%-- <button id="pointBtn" onclick="pointUseFun(${total})">사용</button> --%>
				
				<p id="point"> 사용가능 포인트  : ${point}점</p>
				<!-- <span id="savePoint">적립 포인트: 0점</span> -->
				<br/>
			</div>
		</div>
		
		<%-- <button class="btn" onclick="reserveCompleteFun('${root}','${people}','${checkIn},'${checkOut}','${total}')">예약 요청하기</button> --%>
		<button class="btn" id="btn" onclick="exReserveOk('${root}', '${exReserveDto.exCode}','${memberCode}','${exDateS}','${exPeople}','${exPayment}')">예약요청하기</button>
	</div>
</body>
</html>