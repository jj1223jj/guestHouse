<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${valueExp >0}">
		<script type="text/javascript">
			alert("삭제됐습니다");
			//메인으로 이동하는 url넣어주기
		</script>
	</c:if>
	
	<c:if test="${valueExp ==0}">
		<script type="text/javascript">
			alert("삭제실패");
			//페이지 유지
		</script>
	</c:if>
	
	<c:if test="${valueHouse >0}">
		<script type="text/javascript">
			alert("삭제됐습니다");
			//메인으로 이동하는 url넣어주기
		</script>
	</c:if>
	
	<c:if test="${valueHouse ==0}">
		<script type="text/javascript">
			alert("삭제실패");
			//페이지 유지
		</script>
	</c:if>
</body>
</html>