<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	  <br/>

	<!-- <a href="${root}/ys">윤수</a><br/>


	<br/><br/>
	<h3>승현---------------------------------------------------------</h3>
	<c:if test="${memberLevel == null}">

		<a href="${root}/member/login.do">로그인/회원가입</a>&nbsp;&nbsp;
	</c:if>
	<c:if test="${memberLevel != null}">
		<h3 style="text-align: center;">* ${email} 로그인 중. *</h3>&nbsp;&nbsp;<br/>
		<a href="${root}/member/logout.do">로그아웃</a><br/>
		
		<a href="${root}/experience/exPage.do?exCode=41">체험 페이지</a>
		<br/>
		<a href = "${root}/experience/exReview.do">체험 후기 작성</a>
	
		<c:if test="${memberLevel =='Host'}">
		<a href="${root}/experience/exHost.do">체험 등록하기</a>
		<br/><br/>
		</c:if>
		
		<c:if test ="${memberLevel =='Admin'}">
			<a href="${root}/admin/memberList.do">회원관리</a></br>
			<a href="${root}/admin/houseList.do">게스트하우스 관리(등록 승인, 취소)</a></br>
			<a href="${root}/admin/experienceList.do">체험 관리</a>
			<br/><br/>
		</c:if>
	</c:if>

	<c:if test ="memberLevel =='admin'">
		<a href="${root}/member/levelChange.do">회원 등급 조정</a>
		<a href="${root}/member/">게스트하우스 관리(등록 승인, 취소)</a>
	</c:if>	
	
	----------------------------------------------------------------<br/>
	<a href="${root}/guestdelluna/memberUpdate.do">회원수정(완)</a><br/>
		<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴(완)</a><br/>
		<a href="${root}/guestdelluna/checkReserve.do">전체예약리스트확인 및 취소(완)</a><br/> <!-- 이건 리스트형태로 내가 예약한거 모두 보여주기 --> <!--
		<a href="${root}/guestdelluna/zzimlist.do">찜목록(완)</a><br/>
	--끝--	--끝--	--끝--	--끝--	--끝--	--끝--	--끝--	--끝--<br/>


	후기쓰기 -> 모달<br>
	<a href="${root}/guestdelluna/allMyReview.do">내가 쓴 전체후기 보기</a>
	<a href="${root}/guestdelluna/myReview.do">후기 중 하나 클릭해서 보기</a><br/>

	----------------------------------------------------------------<br/>
	
	<a href="${root}/guestdelluna/myInfo.do">내정보</a>
	
	----------------------------------------------------------------<br/>
	
	
	<!-- 수정 및 삭제는 내가 쓴 리뷰를 들어가야 볼 수 있다. 그래서 내가 쓴 리뷰에 있는 js에서 보내주는 게 나을 수도? -->
	<!--
	<a href="${root}/guestdelluna/reviewUpdate.do">후기 수정</a><br/>	<!-- updateOk도  -->
	<!--
	<a href="${root}/guestdelluna/reviewDelete.do">후기 삭제</a><br/>

	----------아래 두개는 좀 까다로움?????????????????????????????------------<br/>

	<a href="${root}/guestdelluna/managePoint.do">포인트 관리</a><br/>
	<a href="${root}/guestdelluna/payList.do">결제내역</a><br/>

	<a href="${root}/host/register.do">호스트 등록</a>
	<a href="${root}/host/hostPage.do">호스트 페이지</a>
	<a href="${root}/host/reservationView.do">숙소예약현황</a>
	<a href="${root}/host/exReservationView.do">체험예약현황</a>
	<a href="${root}/host/salesView.do">매출조회</a>
	<a href="${root}/host/houseManagement.do">게스트하우스 관리</a>
	<a href="${root}/host/exManagement.do">체험 관리</a>
	<br/>
	
	----------------------------------------------------------------<br/>

	<a href="${root}/guestHousePage/guestHouse.do">게스트하우스</a>
-->
</body>
</html>