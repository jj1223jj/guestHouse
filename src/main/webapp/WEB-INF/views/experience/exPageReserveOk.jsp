<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

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
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<!--  전체 -->
	<div style="width: 70rem; height: auto; margin: 0 auto; /* border: 0.02rem solid black; */ ">
		<div align="center" style="font-weight: bold; font-size: 2rem; margin: 5rem;">예약 완료</div>
		
		<div id="img" align="center">
			<div style="width: 30rem; height: 30rem; overflow: hidden;">
				<img id="exImg" class="rounded" src="<spring:url value='/exImage/${mainImg}' />" />
				
			</div>
			<div style="margin: 5rem; width: 60rem; /* border: 0.1rem solid red; */ height: auto; ">
				<div style="border: 0.05rem solid #ffa50040; width: 55rem; height: auto; padding: 3rem;">
					<div style="width: 10rem; float: left; font-weight: bold; font-size: 1.5rem;" >체험 이름</div>
					<div id="name" style="width: 29rem; height:3rem; margin-left: 10rem; text-align: left;font-size: 1.3rem;"> ${experienceDto.exName}</div>
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;font-size: 1.5rem;">체험 설명</div>
					<div id="explain" style="word-break: break-all; width: 29rem; margin-left: 10rem; margin-top: 2rem; text-align: left;font-size: 1.3rem;">${experienceDto.exExplain}</div>	
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;font-size: 1.5rem;">예약번호</div>
					<div id="reserveCode"  style="width: 29rem; height:3rem; margin-left: 10rem; text-align: left; margin-top: 2rem;font-size: 1.3rem;">${exReserveCode}</div>
					
					<!-- 카드 결제가 아닐 때, 무통장 입금일 경우 계좌번호를 적어서 입금 할 수 있게 -->
					<c:if test="${imp_uid ==null}">
						<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;font-size: 1.5rem;">계좌번호</div>
						<div id="reserveCode"  style="width: 29rem;height:3rem; margin-left: 10rem; text-align: left; margin-top: 2rem;font-size: 1.3rem;">${experienceDto.exAccount}</div>
					</c:if>
					
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem; font-size: 1.5rem;">결제금액</div>
					<div id="payment" style="width: 29rem; height:3rem; margin-left: 10rem; text-align: left; margin-top: 2rem; font-size: 1.3rem;"> ${exReserveDto.exPayment} 원</div>
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem; margin-top: 2rem; font-size: 1.5rem;">포인트 적립</div>
					<div id="point" style="width: 29rem; margin-left: 10rem; text-align: left; margin-top: 2rem; font-size: 1.3rem;">${resPoint} p</div>
					
					<c:if test="${imp_uid ==null}">
						<div style="width: 35rem; font-weight: bold; margin-top: 4rem; color: #3f51b5;font-size: 1.3rem;">해당 계좌번호로 결제금액을 입금해주세요.</div>
					</c:if>
					
				</div>
				
				<div align="center" style="margin-top: 5rem;">
					<button style="margin-right: 1.5rem;" id="btn" type="button" class="btn btn-warning btn-lg" name="home" onclick="location.href='${root}'">Home</button>
					<button id="btn" type="button" class="btn btn-light btn-lg" name="myInfpo" onclick="location.href='${root}/guestdelluna/myInfo.do'">MY PAGE</button>
				
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>