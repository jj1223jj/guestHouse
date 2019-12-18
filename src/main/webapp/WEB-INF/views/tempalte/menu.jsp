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


	<a href="${root}/ys">윤수</a><br/>


<br/><br/>
	<c:if test="${email == null}">
		<a href="${root}/member/login.do">로그인/회원가입</a>&nbsp;&nbsp;<br/>
	</c:if>
	<c:if test="${email != null}">
		<h3 style="text-align: center;">* ${email} 로그인 중. *</h3>&nbsp;&bsp;<br/>
		<a href="${root}/member/logout.do">로그아웃</a><br/>
		
		<a href="${root}/guestdelluna/memberUpdate.do">회원수정(완)</a><br/>
		<a href="${root}/guestdelluna/memberUpdateOk.do">회원수정ok버튼(완)</a><br/>
		<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴(완)</a><br/>
		<a href="${root}/guestdelluna/memberDeleteOk.do">회원탈퇴ok버튼(완)</a><br/>
		<a href="${root}/guestdelluna/checkReserve.do">전체예약리스트확인 및 취소(완)</a><br/> <!-- 이건 리스트형태로 내가 예약한거 모두 보여주기 -->
		<a href="${root}/guestdelluna/zzimlist.do">찜목록(완)</a><br/>
		<br/>
	</c:if>
	<c:if test ="memberLevel =='admin'">
		<a href="${root}/member/levelChange.do">회원 등급 조정</a>
		<a href="${root}/member/">게스트하우스 관리(등록 승인, 취소)</a>
	</c:if>	
	--끝--	--끝--	--끝--	--끝--	--끝--	--끝--	--끝--	--끝--<br/>
	----------------------------------------------------------------<br/>

	후기쓰기 -> 모달
	<a href="${root}/guestdelluna/allMyReview.do">내가 쓴 전체후기 보기</a>
	<a href="${root}/guestdelluna/myReview.do">후기 중 하나 클릭해서 보기</a><br/>

	
	
	<!-- 수정 및 삭제는 내가 쓴 리뷰를 들어가야 볼 수 있다. 그래서 내가 쓴 리뷰에 있는 js에서 보내주는 게 나을 수도? -->
	<a href="${root}/guestdelluna/reviewUpdate.do">후기 수정</a><br/>	<!-- updateOk도  -->
	<a href="${root}/guestdelluna/reviewDelete.do">후기 삭제</a><br/>

	----------아래 두개는 좀 까다로움?????????????????????????????------------<br/>

	<a href="${root}/guestdelluna/managePoint.do">포인트 관리</a><br/>
	<a href="${root}/guestdelluna/payList.do">결제내역</a><br/>


</body>
</html>