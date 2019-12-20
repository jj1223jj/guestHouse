<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
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

	<form action="${root}/guestdelluna/memberDeleteOk.do" method="get">

		<div>최종 탈퇴 전 비밀번호를 입력하세요</div>

		<div>이메일</div>
		<div>
			<input type="email" value="${email}" disabled="disabled" /> <input
				type="hidden" value="${email}" name="email" />
		</div>

		<div>비밀번호</div>
		<div>
			<input type="password" name="password" />
		</div>

		<input type="submit" value="탈퇴" /> <input type="reset" value="탈퇴취소" />

	</form>

</body>
</html>