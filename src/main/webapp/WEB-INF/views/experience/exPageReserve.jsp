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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
	<div align="center" style="width: 70rem; border: 0.1rem solid black; margin: 0 auto;">
		<!-- <h3>예약페이지</h3>
		<br/> -->
		<!--  전체 -->
		<div style="margin: 0rem auto;">
			<div>
				<div style="font-size: 2rem; margin: 5rem; font-weight: bold;">체험 이용규칙 확인하기</div>
				
				<div class="top" style="height: 40rem; border: 0.1rem dotted orange;">
					<div class="experience" style="width: 40rem; border: 0.1rem dotted black; height: 38rem; float: left;">
						<div id="Info" style="border: 0.1rem solid red; width: 38rem; height: auto; float: left;">
							<div style="font-weight: bold; float: left; width: 10rem;">체험 이름 </div>
							<div style="width: 25rem; margin-left: 0.1rem; text-align: left;"> ${experienceDto.exName}</div>
							
							<div style="font-weight: bold; float: left; width: 10rem;">주소</div>
							<div style="width: 25rem; word-break: break-all; height: auto; margin-left: 0.1rem; text-align: left;">${experienceDto.exAddress}</div>
							
							<div style="font-weight: bold;float: left; width: 10rem;">체험 시간</div>
							<div  style="width: 25rem; height: auto; margin-left: 0.1rem; text-align: left;">${experienceDto.exTime} 시간</div>
							
						</div>
						<div style="margin-top: 8rem; border: 0.1rem solid green;">
							<img src="<spring:url value='/exImage/${mainImg}' />" />
						</div>	
						<%-- <span id="star">평점: </span>&nbsp;&nbsp;&nbsp;
						<span id="revCount">후기   ${review}  개</span> --%>
					</div>
					<div style="width:25rem; height:38rem; border: 0.1rem dotted purple; margin-left: 40rem; padding-top: 8rem;">
						<div class="reserve" style="border: 0.1rem solid black; width: 25rem;">
						
							<p id="people">게스트 ${exPeople}명</p>
							<p id="exDate">체험 날짜: ${exDateS}</p>
							
							<br/>
							<p id="price">금액                        	${exPayment/exPeople}원 X ${exPeople} </p>
							<p id="total">총합계(KRW)     ${exPayment}</p>
							<p id="savePoint"> 적립 포인트   ${exPayment*0.01}</p>
						</div>
					</div>
					
				</div>
			</div>
		
		<hr color="#CCCCCC"/>
		
		<div class="bot">
			<div id="pay">
				<div style="font-size: 2rem; margin: 5rem; font-weight: bold;">결제</div>
				
				<div>결제수단</div>
				<select name="payment" id="payment" class="form-control" style="width: 20rem;">
					<option value="select" selected="selected">선택하세요</option>
					<option value="account" id="account">무통장입금</option>
					<option value="card" id="card">카드결제</option>
				</select>
				<br/>
				
				<span style="margin-right: 1rem;">point  </span>
				<span><input id="usePoint" value="1" min="1"></span>
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
				
				<p id="point" style="margin: 2rem; width: 20rem;"> 사용가능 포인트는   ${point}점 입니다.</p>
				<!-- <span id="savePoint">적립 포인트: 0점</span> -->
				<br/>
			</div>
		</div>
		
		<%-- <button class="btn" onclick="reserveCompleteFun('${root}','${people}','${checkIn},'${checkOut}','${total}')">예약 요청하기</button> --%>
		<div style="margin-bottom: 5rem; margin-top: 2rem;">
			<button class="btn btn-info" type="button" id="btn" onclick="exReserveOk('${root}', '${exReserveDto.exCode}','${memberCode}','${exDateS}','${exPeople}','${exPayment}')">예약요청하기</button>
		</div>
	</div>
	</div>
</body>
</html>