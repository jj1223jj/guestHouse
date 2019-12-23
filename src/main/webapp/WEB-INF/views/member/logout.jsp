<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그아웃</title>
</head>
<body>

	<!-- 로그아웃을 할 수 있는 사람은 로그인을 한 사람 -->
	<c:remove var="email" scope="session"/>
	<c:remove var="memberLevel" scope="session"/>
	<c:remove var="memberCode" scope="session"/>
	
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<script type="text/javascript">
		alert("로그아웃 되었습니다");
		location.href="${root}/guestHouse.do";	
</script>
</body>
</html>