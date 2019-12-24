<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">

	function reserveCompleteFun(root, houseCode, memberCode, checkIn, checkOut, people, total){
		
		
		alert(root +", "+ houseCode +", "+memberCode+", "+people+", "+checkIn+", "+checkOut+", "+total);
		
		var usePoint =$("#usePoint").val();	// 사용포인트
		alert(usePoint);
		
		var resPoint;	// 적립포인트
		var realTotal;
		
		if(usePoint==0){
			resPoint = total*0.01;	// 결제금액에서 1%적립
			realTotal = total;
		}else{
			realTotal = total - usePoint;	// 사용한 포인트만큼 결제금액 차감
			resPoint = 0;
		}
		
		var url = root+"/guestHousePage/reserveComplete.do?houseCode="+houseCode;
		url += "&memberCode="+memberCode+"&checkIn="+ checkIn +"&checkOut=" +checkOut+"&people="+people;
		url += "&total="+realTotal+"&point="+resPoint+"&usePoint="+usePoint;
		
		var url2 = root+"/guestHousePage/kakaoPay.do?houseCode="+houseCode;
		url2 += "&memberCode="+memberCode+"&checkIn="+ checkIn +"&checkOut=" +checkOut+"&people="+people;
		url2 += "&total="+realTotal+"&point="+resPoint+"&usePoint="+usePoint;
		
		alert($("#payment option:selected").val());
		
		var account =$("#payment option:selected").val();
		
		if(account=='account'){
			alert(url);
			location.href=url;
		}else{
			location.href=url2;
		}
	};
	
/* 	function pointUseFun(total){
		var usePoint =$("#usePoint").val();
		var resPoint;							// 적립포인트						
		
		if(usePoint==0){
			resPoint = total * 0.01;
			$("#savePoint").replaceWith("<span>"+resPoint+"점</span>");
		}else if(usePoint!=0){
			resPoint = 0;
			$("#savePoint").replaceWith("<span>"+resPoint+"점</span>");
		}
	}; */
	
</script>
</head>
<body>
	<div align="center">
		<h3>예약페이지</h3>
		<br/>
		
		<h1>숙소 이용규칙 확인하기</h1>
		<div class="top">
			<div class="guestHouse">
				<div id="Info">
					<span>${hostDto.explain}</span>
					<img src="<spring:url value='/image/${mainImg}' />" />
				</div>
				<span id="star">평점: </span>&nbsp;&nbsp;&nbsp;
				<span id="revCount">후기     개</span>
			</div>
			<div class="reserve">
				<p id="people">게스트 ${people}명</p>
				<span id="checkIn">${checkIn} </span>
				<span>→</span>
				<span id="checkOut">${checkOut}</span>
				<br/>
				<p id="price">금액                        	${hostDto.price} X ${night} X ${people}</p>
				<p id="total">총합계(KRW)     ${total}</p>
			</div>
		</div>
		
		<hr color="#CCCCCC"/>
		
		<div class="mid">
			<div class="notice">
				<h3>주의할 사항</h3>
				<div>
					${hostDto.etc}
				</div>
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
		<button class="btn" onclick="reserveCompleteFun('${root}', '${hostDto.houseCode}','${memberCode}','${checkIn}','${checkOut}','${people}','${total}')">예약요청하기</button>
	</div>
</body>
</html>