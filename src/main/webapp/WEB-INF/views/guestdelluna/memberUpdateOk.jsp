<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<c:set var="root" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${check >0 }">
		<script type="text/javascript">
			alert("정보수정완료")
			//메인 생기면 메인으로 이동할수있게 url 설정
		</script>
	</c:if>
	
	<c:if test="${check ==0 }">
		<script type="text/javascript">
			alert("수정안됨")
			var url = root + "guestdelluna/memberUpdate.do" 
		</script>
	</c:if>

</body>
</html>