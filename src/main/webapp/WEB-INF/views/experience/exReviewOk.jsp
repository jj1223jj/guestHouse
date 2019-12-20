<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험등록 완료</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check > 0}">	<!-- 제대로 수정되었으면 1, 아니면 00  -->
		<script type="text/javascript">
			alert("후기가 등록 되었습니다");
			location.href="${root}/experience/exReview.do";
	
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("후기가 등록되지 않았습니다");
			location.href="${root}/experience/exReview.do";
	
		</script>
	</c:if>
</body>
</html>