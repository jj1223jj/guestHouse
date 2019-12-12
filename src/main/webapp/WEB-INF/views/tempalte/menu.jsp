<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br/><br/>
	<c:if test="${email == null}">
		<a href="${root}/member/login.do">로그인/회원가입</a>&nbsp;&nbsp;
	</c:if>
	<c:if test="${email != null}">
		<h3 style="text-align: center;">* ${email} 로그인 중. *</h3>&nbsp;&bsp;
		<a href="${root}/member/logout.do">로그아웃</a>
		<br/>
	</c:if>
	
	<c:if test ="memberLevel =='admin'">
		<a href="${root}/member/levelChange.do">회원 등급 조정</a>
		<a href="${root}/member/">게스트하우스 관리(등록 승인, 취소)</a>
	</c:if>
</body>
</html>