<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
	<c:if test="${check>0}">	<!-- ==1로 해도 됨 -->
		<div align = "center">
		이미 사용중인 이메일 입니다.
			<form action="${root}/member/emailCheck.do" method="get">
				<input type = "email" name = "email"/>
				<input type="submit" value="확인"/>
			</form>
		</div>
	</c:if>
	<c:if test="${check==0}">
		<div align="center">
		사용 가능한 이메일 입니다.
		</div>
	</c:if>
	
	<script type="text/javascript">
		opener.createForm.email.value="${email}";
		
	</script>
	<div align = "center">
		<a href="javascript:self.close()">닫기</a>
	</div>
</body>
</html>