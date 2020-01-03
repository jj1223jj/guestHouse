<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${exStateOk > 0 }">	<!-- 제대로 수정되었으면 1, 아니면 00  -->
		<script type="text/javascript">
			alert("승인이 완료 되었습니다.");
			self.close();
	
		</script>
	</c:if>
	
	<c:if test="${exStateOk == 0}">
		<script type="text/javascript">
			alert("승인이 완료되지 않았습니다. 다시 시도하시길 바랍니다.");
			self.close();
	
		</script>
	</c:if>
	
	<c:if test="${exStateNo > 0 }">	<!-- 제대로 수정되었으면 1, 아니면 00  -->
		<script type="text/javascript">
			alert("승인거절이 완료 되었습니다.");
			self.close();
	
		</script>
	</c:if>
	
	<c:if test="${exStateNo == 0}">
		<script type="text/javascript">
			alert("승인거절이 완료되지 않았습니다. 다시 시도하시길 바랍니다.");
			self.close();
	
		</script>
	</c:if>
	
</body>
</html>