<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		
	<c:if test="${check >0 }">
		<c:remove var="email" scope="session" />
		<c:remove var="memberLevel" scope="session" />
		<script type="text/javascript">
			alert("탈퇴되었습니다.");
			location.href="${root}/";
		</script>
	</c:if>
	
	<c:if test="${check ==0 }">
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다. 다시 확인해주세요");
			location.href="${root}/guestdelluna/memberDelete.do";
		</script>
	</c:if>
	
</body>
</html>