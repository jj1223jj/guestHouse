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


	<a href="${root}/ys">윤수</a>

	<a href="${root}/guestdelluna/zzim.do">찜!</a>
	<a href="${root}/guestdelluna/zzimlist.do">찜목록</a>
	<a href="${root}/guestdelluna/zzimhouseCancel.do">찜취소</a> <!-- 취소는 곧 삭제임 -->

	<a href="${root}/guestdelluna/review.do">후기 쓰기</a>
	<a href="${root}/guestdelluna/reviewUpdate.do">후기 수정</a>
	<a href="${root}/guestdelluna/reviewDelete.do">후기 삭제</a>
	<a href="${root}/guestdelluna/myReview.do">내가 쓴 후기 보기</a>


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