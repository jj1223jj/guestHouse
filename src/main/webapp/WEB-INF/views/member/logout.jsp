<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<title>회원 로그아웃</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

	<!-- 로그아웃을 할 수 있는 사람은 로그인을 한 사람 -->
	<c:remove var="email" scope="session"/>
	<c:remove var="memberLevel" scope="session"/>
	<c:remove var="memberCode" scope="session"/>
	
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<script type="text/javascript">
		alert("로그아웃 되었습니다");
		 Kakao.init('5a47c72d35ab36aa08feca719cb2bccf');
		 Kakao.Auth.logout();
		 
		location.href="${root}/";	
</script>
</body>
</html>