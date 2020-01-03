<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>로그인창</title>
</head>
<body>
	
	<c:if test="${memberLevel != null}">
		<c:set var="email" value="${email}" scope="session"/>		<!-- id를 세션으로 집어 넣는 것  -> EL처럼 아이디를 사용 가능해짐 -->
		<c:set var="memberLevel" value="${memberLevel}" scope="session"/>	
		<c:set var="memberCode" value="${memberCode}" scope="session"/>
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			 if('${beforeURL}'==null){
				location.href="${root}/";
			}else{
				location.href="${beforeURL}";
			} 
		</script>	
	</c:if>
	
	<c:if test="${memberLevel == null}">
		<script type="text/javascript">
			alert("로그인 실패하였습니다. 가입하지 않은 이메일이거나 잘못된 비밀번호입니다.");
			location.href="${root}/";	//로그인이 안 되었을 경우 회원가입 페이지로 이동
		</script>	
	</c:if>
</body>
</html>