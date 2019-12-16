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
	<c:if test="${email != null }">
	
		<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a><br/>
		<a href="${root}/guestdelluna/memberUpdateOk.do">회원수정ok버튼 / js에서 걸어주기</a><br/>
		<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a><br/>
		<a href="${root}/guestdelluna/memberDeleteOk.do">회원탈퇴ok버튼 / js에서 걸어주기</a>
		<a href="${root}/guestdelluna/memberLogout.do">로그아웃</a>
	
	</c:if>
	
	----------------------------------------------------------------<br/>

	<a href="${root}/guestdelluna/zzim.do">찜!</a><br/>
	<a href="${root}/guestdelluna/zzimlist.do">찜목록</a><br/>
	<a href="${root}/guestdelluna/zzimhouseCancel.do">찜취소</a> <!-- 취소는 곧 삭제임 --><br/>
	
	----------------------------------------------------------------<br/>
	<a href="${root}/guestdelluna/review.do">후기 쓰기</a><br/>
	<a href="${root}/guestdelluna/allMyReview.do">내가 쓴 전체후기 보기</a>
	<a href="${root}/guestdelluna/myReview.do">후기 중 하나 클릭해서 보기</a><br/>
		
	
	<!-- 수정 및 삭제는 내가 쓴 리뷰를 들어가야 볼 수 있다. 그래서 내가 쓴 리뷰에 있는 js에서 보내주는 게 나을 수도? -->
	<a href="${root}/guestdelluna/reviewUpdate.do">후기 수정</a><br/>	<!-- updateOk도  -->
	<a href="${root}/guestdelluna/reviewDelete.do">후기 삭제</a><br/>
	
	
	----------------------------------------------------------------<br/>
	<!-- 체험 및 숙소 둘 다 -->
	<a href="${root}/guestdelluna/checkReserve.do">전체예약리스트확인</a><br/> <!-- 이건 리스트형태로 내가 예약한거 모두 보여주기 -->
	<a href="${root}/guestdelluna/viewMyReserveHouse.do">그중방예약한거보기</a>
	<a href="${root}/guestdelluna/viewMyReserveExp.do">그중체험예약한거보기</a>
	<a href="${root}/guestdelluna/cancelReserve.do">예약취소</a><br/>
	
	----------------------------------------------------------------<br/>
	
	<a href="${root}/guestdelluna/managePoint.do">포인트 관리</a><br/>

	<a href="${root}/guestHousePage/guestHouse.do">게스트하우스페이지</a>

</body>
</html>