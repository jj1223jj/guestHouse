<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>후기 삭제</title>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("삭제 되었습니다.");
			location.href="${root}/guestHousePage/guestHouse.do?houseCode=${houseCode}";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("삭제되지 않았습니다. 다시 시도하시길 바랍니다.");
			location.href="${root}/guestHousePage/guestHouse.do?pageNumber=${pageNumber}";
		</script>
	</c:if>
</body>
</html>