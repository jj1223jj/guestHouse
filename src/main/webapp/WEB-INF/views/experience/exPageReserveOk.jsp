<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	

	
	<h3 align="center">예약 완료</h3>
	
	<div align="center">
		<div>
			<img src="<spring:url value='/exImage/${mainImg}' />" />
		</div>
		<div style="margin-top: 50px;">
			<p id="name">체험 이름: ${experienceDto.exName}</p>
			<p id="explain">체험 설명: ${experienceDto.exExplain}</p>	
			<span id="reserveCode">예약번호: ${exReserveCode}</span>&nbsp;&nbsp;&nbsp;
			<span id="payment">결제금액: ${exReserveDto.exPayment}</span>
			<span id="point">현재 고객님의 포인트는 ${plusPoint}점 입니다.</span>
		</div>
	</div>
	
	
</body>
</html>