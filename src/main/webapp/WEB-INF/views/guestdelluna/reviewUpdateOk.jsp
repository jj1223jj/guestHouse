<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>Insert title here</title>
</head>
<body>
check받아서 메인으로

<c:if test="${check > 0 }">
			<script type="text/javascript">
				alert("수정완료되어ㅅ")
			</script>
	</c:if>
	
	<c:if test="${check == 0 }">
		<script type="text/javascript">
			alert("수정실패")
		</script>
	</c:if>
</body>
</html>