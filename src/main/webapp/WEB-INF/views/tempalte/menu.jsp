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
		<h3 style="text-align: center;">* ${email} 로그인 중. *</h3>
		<a href="${root}/member/logout.do">로그아웃</a>
		<br/>
		<a href="${root}/experience/exPage.do">체험 페이지</a>
		<br/>
		<a href = "${root}/experience/exReview.do">체험 후기 작성</a>
		<br/>
		<c:if test="${memberLevel =='Host'}">
		<a href="${root}/experience/exHost.do">체험 등록하기</a>
		<br/>
		</c:if>
		
		<c:if test ="${memberLevel =='Admin'}">
			<a href="${root}/admin/memberList.do">회원관리</a></br>
			<a href="${root}/admin/houseList.do">게스트하우스 관리(등록 승인, 취소)</a></br>
			<a href="${root}/admin/experienceList.do">체험 관리</a>
		</c:if>
	</c:if>
</body>
</html>