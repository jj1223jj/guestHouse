<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myInfo.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
</head>
<body>

	<button id="opener">알림종그림이라는 뜻</button>
	<div id="dialog" title="메시지 확인">
		<script type="text/javascript">
			$(function(root) {

				/* value로 메시지넘버를 받아야함 */

			})
		</script>
	</div>

	<div>
		<div>내정보입니다</div>

		<div>
			<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/managePoint.do">포인트관리</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/payList.do">결제내역</a>
		</div>
		<div>
			<a href="${root}/guestdelluna/allMyReview.do">내가쓴후기</a>
		</div>
	</div>
	
	<div>
		<div><img alt="img loading" src="<spring:url value='/profileImg/파일명' />"/></div>
		<div>${memberDto.memberInfo}</div>
	</div>
	
	<script>
		$("#dialog").dialog({
			autoOpen : false
		});
		$("#opener").click(function() {
			$("#dialog").dialog("open");
		});
	</script>

</body>
</html>