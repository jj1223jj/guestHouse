<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:if test="${check > 0 && mainImgUploadCheck > 0 && hostRegisterCheck > 0}">
		<script type="text/javascript">
			alert("등록이 완료되었습니다.");
			location.href = "${root}/guestdelluna/myInfo.do";
		</script>
	</c:if>
	<c:if test="${check == 0 || mainImgUploadCheck == 0 || hostRegisterCheck == 0}">
		<script type="text/javascript">
			alert("등록에 실패하였습니다. 다시 시도해주세요.");
			location.href = "${root}/guestdelluna/myInfo.do";
		</script>
	</c:if>
</body>
</html>