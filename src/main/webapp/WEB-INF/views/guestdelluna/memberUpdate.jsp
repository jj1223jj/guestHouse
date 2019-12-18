<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<c:set var="root" value="${pageContext.request.contextPath}" /> <%-- homePage ( 작업하는 프로젝트의 최상위 경로) --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/guestdelluna/jsForMember.js"></script>
</head>
<body>

<div>회원수정</div>
<div>css 설정해준다는뜻</div>

<form action="${root}/guestdelluna/memberUpdateOk.do" method="post" onsubmit="return registerForm(this)" name="createForm" enctype="multipart/form-data">

	<input type="hidden" name="memberCode" value="${memberDto.memberCode}"/>
	
	기입 : <div>이름 , 이메일 , 비밀번호 , 폰번호 , 사진</div>
	노기입 : <div>날짜 , 포인트 , 레벨 , 이미지 3개</div>
	
			<c:if test="${memberDto.memberImgName != null }">
				<div>
					<div>
						<span>회원사진</span>	
					</div>
					${memberDto.memberImgName }
					<input type="file" name="file" size="40">
					
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
		<input type="text" name="memberName"/>
	</div>	
	
	<div>이메일</div>
	<div>
		<input type="text" name="email"/>
	</div>
	
	<div>비밀번호</div>
	<div>
		<input type="password" name="password"/>
	</div>
	
	<div>폰번호</div>
	<div>
		<input type="text" name="phone"/>
	</div>
	
	<div>
		<input type="submit" value="수정"/> <input type="reset" value="취소" />
	</div>

</form>


</body>
</html>