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
	
	<%-- <c:if test="${reCheck > 0 }">
		<script type="text/javascript">
			alert("예약이 완료 되었습니다.");
			location.href="${root}/guestHousePage/reserveCompleteOk.do?houseCode="+${guestReserveDto.houseCode}+"&payment="+${guestReserveDto.payment}+"&memberCode="+${guestReserveDto.memberCode};
		</script>
	</c:if>
	
	<c:if test="${reCheck ==0 }">
		<script type="text/javascript">
			alert("예약이 완료되지 않았습니다.");
			location.href="${root}/guestHousePage/reservation.do";
		</script>
	</c:if> --%>
	
	<h3 align="center">예약 완료</h3>
	<hr color="#CCCCCC"/>
	<div align="center">
		<div>
			<img src="<spring:url value='/image/${mainImg}' />" />
		</div>
		<div>
			<p id="name">${houseName}</p>
			<p id="explain">${explain}</p>	
			<span id="reserveCode">예약번호: ${reserveCode}</span>&nbsp;&nbsp;&nbsp;
			<span id="payment">결제금액: ${payment}</span>
			
			<!--payment
				houseName
				explain
			 -->
		</div>
	</div>
	
	<hr color="#CCCCCC"/>
</body>
</html>