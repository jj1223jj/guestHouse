<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check > 0 }">
		<script type="text/javascript">
			//alert("예약 가능한 날짜입니다.");
			var url = "${root}/guestHousePage/reservation.do?houseCode=${houseCode}&memberCode=${memberCode}&checkIn=${checkIn}&checkOut=${checkOut}&people=${people}";
			//alert(url);
			location.href=url; 
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("예약 가능 인원을 초과 하였습니다.");
			location.href="${root}/guestHousePage/guestHouse.do?houseCode=${houseCode}"
		</script>
	</c:if>
</body>
</html>