<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
예약 목록이 뜨고 상품을 눌렀을 때 해당 url(myReserve 함수)로 이동하게 해주면 완성
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
</body>
</html>