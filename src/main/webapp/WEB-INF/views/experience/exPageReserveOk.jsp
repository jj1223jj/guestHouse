<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<!--  전체 -->
	<div style="width: 70rem; height: auto; margin: 0 auto; border: 0.1rem solid black; ">
		<div align="center" style="font-weight: bold; font-size: 1.5rem; margin: 5rem;">예약 완료</div>
		
		<div align="center">
			<div>
				<img class="rounded" src="<spring:url value='/exImage/${mainImg}' />" />
				
			</div>
			<div style="margin: 5rem; width: 60rem; border: 0.1rem solid red; height: auto; ">
				<div style="border: 0.1rem solid orange; width: 40rem; height: auto;">
					<div style="width: 10rem; float: left; font-weight: bold;" >체험 이름</div>
					<div id="name" style="width: 20rem; margin-left: 10rem; text-align: left;"> ${experienceDto.exName}</div>
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">체험 설명</div>
					<div id="explain" style="word-break: break-all; width: 20rem; margin-left: 10rem; margin-top: 2rem; text-align: left;">${experienceDto.exExplain}</div>	
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">예약번호</div>
					<div id="reserveCode"  style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${exReserveCode}</div>
					
				</div>
				<div style="width: 40rem; height: 10rem;">
					<div style="width: 10rem; float: left; font-weight: bold;">결제금액</div>
					<div id="payment" style="width: 20rem; margin-left: 10rem; text-align: left;"> ${exReserveDto.exPayment}</div>
					<div style="width: 10rem; float: left; font-weight: bold; margin-top: 2rem;">포인트 적립</div>
					<div id="point" style="width: 20rem; margin-left: 10rem; text-align: left; margin-top: 2rem;">${resPoint} p</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>