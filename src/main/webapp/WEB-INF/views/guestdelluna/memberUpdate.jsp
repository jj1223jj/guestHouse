<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${root}/guestdelluna/memberUpdateOk.do" method="post"
		onsubmit="return registerForm(this)" name="createForm"
		enctype="multipart/form-data">

		<input type="hidden" name="memberCode" value="${memberDto.memberCode}" />
		<input type="hidden" name="email" value="${memberDto.email}" />

		<c:if test="${memberDto.memberImgName != null }">
			<div>
				<div>
					<span>회원사진</span>
				</div>
				${memberDto.memberImgName } <input type="file" name="file" size="40">

			</div>
		</c:if>

		<c:if test="${memberDto.memberImgName == null }">
			<div>
				<div>
					<span>회원사진</span>
				</div>
				<input type="file" name="file" size="40">
			</div>
		</c:if>
		<div>이름</div>

		<div>
			<input type="text" name="memberName" />
		</div>

		<div>이메일</div>
		<div>
			<input type="text" name="email" value="${memberDto.email}"
				disabled="disabled" />
		</div>

		<div>비밀번호</div>
		<div>
			<input type="password" name="password" />
		</div>

		<div>폰번호</div>
		<div>
			<input type="text" name="phone" />
		</div>

		<div>회원설명</div>
		<div>
			<textarea rows="6" cols="50" name="memberInfo"></textarea>
		</div>

		<div>
			<input type="submit" value="수정" /> <input type="reset" value="취소" />
		</div>

		<c:if test="${memberLevel == 'Host'}">
			<div>
				<a href="${root}/host/reservationView.do">예약현황</a>
			</div>
			<div>
				<a href="${root}/host/salesView.do">매출조회</a>
			</div>
			<div>
				<a href="${root}/host/houseManagement.do">관리</a>
			</div>
		</c:if>

	</form>
</body>
</html>