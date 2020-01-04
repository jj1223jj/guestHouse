<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
<head>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

<link rel="stylesheet" href="${root}/resources/javascript/jquery/Blitzer/jquery-ui.css">
<script type="text/javascript" src="${root}/resources/javascript/jquery/Blitzer/jquery-ui.js"></script>

<script type="text/javascript">
 function exReserveOk(root, exCode, memberCode, exDateS, exPeople, exPayment){
	
	
	//alert(root +", "+ exCode +", "+memberCode+", "+exDateS+", "+exPeople+", "+exPayment);
	
	var usePoint =$("#usePoint").val();	// 사용포인트
	if(usePoint == ""){
		usePoint = 0;
	}
	//alert(usePoint);
	
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
	
	var url2 = root+"/experience/kakaoPay.do?exCode="+exCode;
	url2 += "&memberCode="+memberCode+"&exDateS="+ exDateS +"&exPeople="+exPeople;
	url2 += "&exPayment="+realTotal+"&point="+resPoint+"&usePoint="+usePoint;
	
	//alert($("#payment option:selected").val());
	
	var account =$("#payment option:selected").val();
	
	if(account=='account'){
		//alert(url);
		location.href=url;
	}else{
		location.href=url2;
	}
};
</script>

<script>
$(document).ready(function(){
	
	var divs = document.querySelectorAll('#img div');

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
</script>



</head>
<body>
	<div align="center" style="width: 70rem; border: 0.1rem solid #00000059; margin: 5rem auto;">
		<!-- <h3>예약페이지</h3>
		<br/> -->
		<!--  전체 -->
		<div style="margin: 0rem auto;">
			<div>
				<div style="font-size: 2rem; margin: 5rem; font-weight: bold;">체험 예약 확인하기</div>
				
				<div class="top" style="height: auto;/*  border: 0.1rem dotted orange; */">
					<div class="experience" style="width: 40rem; /* border: 0.1rem dotted black; */ height: 50rem; float: left;">
						<div id="Info" style="/* border: 0.1rem solid red; */ width: 38rem; height: auto; float: left; margin-left: 3rem;">
							<div style="font-weight: bold; float: left; width: 10rem; font-size: 1.5rem;">체험 이름 </div>
							<div style="width: 60rem; margin-left: 4rem; text-align: left; word-break: break-all; margin-bottom: 1.5rem;font-size: 1.3rem;"> ${experienceDto.exName}</div>
							
							<div style="font-weight: bold; float: left; width: 10rem;font-size: 1.5rem;">주소</div>
							<div style="width: 60rem; word-break: break-all; height: auto; margin-left: 0.1rem; text-align: left; margin-bottom: 1.5rem;font-size: 1.3rem;">${experienceDto.exAddress}</div>
							
							<div style="font-weight: bold;float: left; width: 10rem;font-size: 1.5rem;">체험 시간</div>
							<div style="width: 25rem; height: auto; margin-left: 0.1rem; text-align: left; margin-bottom: 1.5rem; font-size: 1.3rem;">${experienceDto.exTime} 시간</div>
							
						</div>
						<div id="img" style="margin-top: 13rem; /* border: 0.1rem solid green; */ width: 30rem; height: 30rem;">
							<div style="width: 30rem; height: 30rem;">
								<img id="exImg" style="width: 100% " src="<spring:url value='/exImage/${mainImg}' />" />
							</div>
						</div>	
						<%-- <span id="star">평점: </span>&nbsp;&nbsp;&nbsp;
						<span id="revCount">후기   ${review}  개</span> --%>
					</div>
					<div style="width:25rem; height:50rem; /* border: 0.1rem dotted purple; */ margin-left: 40rem; padding-top: 8rem;">
						<div class="reserve" style="/* border: 0.1rem solid black; */ width: 26rem; height: 30rem; margin-top: 5rem;">
						
							
							<div id="Info" style="border: 0.1rem solid #ebebeb; width: 25rem; height: auto; float: left; margin-left: 1rem; padding-top: 3rem;">
								<div style="font-weight: bold; float: left; width: 10rem;font-size: 1.5rem;">게스트 </div>
								<div id="people" style="width: 25rem; margin-left: 12rem; text-align: left; word-break: break-all; margin-bottom: 4rem;font-size: 1.3rem;"> ${exPeople}명</div>
								
								<div style="font-weight: bold; float: left; width: 10rem;font-size: 1.5rem;">체험 날짜</div>
								<div id="exDate" style="width: 25rem; word-break: break-all; height: auto; margin-left: 12rem; text-align: left; margin-bottom: 4rem;font-size: 1.3rem;"> ${exDateS}</div>
								
								<div style="font-weight: bold;float: left; width: 10rem;font-size: 1.5rem;">금액</div>
								<fmt:formatNumber var ="pay" type="number" value="${exPayment/exPeople}" />
								<div id="price" style="width: 25rem; height: auto; margin-left: 12rem; text-align: left; margin-bottom: 4rem;font-size: 1.3rem;">  	${pay}원 X ${exPeople}명</div>
								
								<div style="font-weight: bold;float: left; width: 10rem;font-size: 1.5rem;">총 합계</div>
								<div id="total" style="width: 25rem; height: auto; margin-left: 12rem; text-align: left; margin-bottom: 4rem;font-size: 1.3rem;"> ${exPayment} 원</div>
								
							</div>
							
							<%-- <p id="people">게스트:		 ${exPeople}명</p>
							
							<p id="exDate">체험 날짜: ${exDateS}</p>
							
							<br/>
							<p id="price">금액                        	${exPayment/exPeople}원 X ${exPeople} </p>
							<p id="total">총합계(KRW)     ${exPayment}</p>
							<p id="savePoint"> 적립 포인트   ${exPayment*0.01}</p> --%>
						</div>
					</div>
					
				</div>
			</div>
		
		<hr color="#CCCCCC"/>
		
		<div class="bot">
			<div id="pay">
				<div style="font-size: 2rem; margin: 5rem; font-weight: bold;">결제</div>
				
				<select name="payment" id="payment" class="form-control" style="width: 20rem;">
					<option value="select" selected="selected">결제 수단을 선택하세요</option>
					<option value="account" id="account">무통장입금</option>
					<option value="card" id="card">카드결제</option>
				</select>
				<br/>
				
				<span style="margin-right: 1rem; font-size: 1.3rem;">point  </span>
				<span><input id="usePoint" value="0" min="0"></span>
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
				
				<p id="point" style="margin: 2rem; width: 22rem; font-size: 1.3rem;"> 사용가능 포인트는   ${point}점 입니다.</p>
				<!-- <span id="savePoint">적립 포인트: 0점</span> -->
				<br/>
			</div>
		</div>
		
		<%-- <button class="btn" onclick="reserveCompleteFun('${root}','${people}','${checkIn},'${checkOut}','${total}')">예약 요청하기</button> --%>
		<div style="margin-bottom: 5rem; margin-top: 2rem;">
			<button class="btn btn-info btn-lg" type="button" id="btn" onclick="exReserveOk('${root}', '${exReserveDto.exCode}','${memberCode}','${exDateS}','${exPeople}','${exPayment}')">예약요청하기</button>
		</div>
	</div>
	</div>
</body>
</html>