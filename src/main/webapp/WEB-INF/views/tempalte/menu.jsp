<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${root}/host/register.do">호스트 등록</a>
	<a href="${root}/host/hostPage.do">호스트 페이지</a>
	<a href="${root}/host/reservationView.do">예약현황</a>
	<a href="${root}/host/salesView.do">매출조회</a>
	<a href="${root}/host/houseManagement.do">게스트하우스 관리</a>
</body>
</html>