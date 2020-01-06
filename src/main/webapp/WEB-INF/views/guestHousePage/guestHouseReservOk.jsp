<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/guestHouse/reserveOk.css"/>
<%-- <script type="text/javascript" src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script> --%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

</head>

<body>
	<div class="allDiv">
		<h3 align="center">예약 완료</h3>
		<hr color="#CCCCCC"/>
		<div id="wrap">
			
			<div id="mainImg">
				<img src="<spring:url value='/image/${mainImg}' />" width="100%" height="100% " />
			</div>
			
			<div id="info">
				<p id="name">${houseName}</p>
				<p id="explain">${explain}</p>	
				<p id="reserveCode">예약번호: ${reserveCode}</p>
				<p id="payment">결제금액: ${payment}</p>
				<c:if test="${account!=null}">
					<p id="account">계좌번호:${account}</p>
					<p style="color: red;">위 계좌번호로 입금해주세요.</p>
				</c:if>
			</div>
			
		</div>
		<hr color="#CCCCCC" style="margin-top: 3rem;"/>
	</div>
	
	
	<div align="center" style="margin-top: 2rem;">
		<button style="margin-right: 1.5rem;" id="btn" type="button" class="btn btn-warning" name="home" onclick="location.href='${root}'">Home</button>
		<button id="btn" type="button" class="btn btn-light" name="myInfpo" onclick="location.href='${root}/guestdelluna/myInfo.do'">myPage</button>
	</div>
	<!-- footer 겹침현상 제거 -->
	<div style="clear:both; margin-bottom: 8rem;"></div>
</body>
</html>