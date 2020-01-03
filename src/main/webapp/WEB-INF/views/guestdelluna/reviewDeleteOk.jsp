<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<c:if test="${check > 0 }">
		<script type="text/javascript">
			alert("삭제 완료");
			setTimeout("location.reload()");
		</script>
	</c:if>

	<c:if test="${check ==0 }">
		<script type="text/javascript">
			alert("삭제 실패");
			setTimeout("location.reload()");
		</script>
	</c:if>

</body>
</html>