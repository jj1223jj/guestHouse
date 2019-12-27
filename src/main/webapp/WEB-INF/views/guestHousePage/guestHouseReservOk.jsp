<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/guestHouse/reserveOk.css"/>
</head>
<body>
	<div class="allDiv">
		<h3 align="center">예약 완료</h3>
		<hr color="#CCCCCC"/>
		<div id="wrap">
			<div id="mainImg">
				<img src="<spring:url value='/image/${mainImg}' />" />
			</div>
			<div id="info">
				<p id="name">${houseName}</p>
				<p id="explain">${explain}</p>	
				<span id="reserveCode">예약번호: ${reserveCode}</span>&nbsp;&nbsp;&nbsp;
				<span id="payment">결제금액: ${payment}</span>
			</div>
		</div>
	</div>
	<!-- <hr color="#CCCCCC"/> -->
	
	<!-- footer 겹침현상 제거 -->
	<div style="clear:both;"></div>
</body>
</html>