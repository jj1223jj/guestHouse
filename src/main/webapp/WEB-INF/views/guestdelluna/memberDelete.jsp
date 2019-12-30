<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<section id="container">
			<div class="control-group"
				style="width: 70rem; /*  border: 1px solid red; */ margin: 2rem auto; height: 35rem;">
				<div class="innerBox">
					<!-- 가로값이 1280으로 설정되어진 아이 -->
					<h5 style="text-align: center; font-size: 1rem; color: #484848;">회원
						탈퇴 페이지입니다.</h5>
				</div>
				
				<input type="hidden" value="${email}" name="email">

				<div class="fullBg">
					<div class="innerBox formJoinWrap"
						style="margin: 0 auto; height: 31rem;">
						<!-- 아이디 및 비밀번호 -->
						<div class="form-group"
							style="margin: 0 auto; /* border: 0.1rem solid blue; */ height: 29rem;">
							<dt>
								<label for="userName"
									style="width: 25rem; height: 3rem; background-color: #edf6f6; margin-left: 20rem; margin-top: 3rem; margin-bottom: 1rem; line-height: 3rem; margin-bottom: 3rem; padding-left: 1rem;">탈퇴를 위해 다음 과정을 따라 주세요</label>
							</dt>
							<dl class="id">
								<dt>
									<label for="USER_ID" style="margin-left: 20rem;">아이디
										(이메일) </label>
								</dt>
								<dd id="idid">
									<div class="inp">
										<input class="form-control" type="email" id="emailAA"
											name="email" value="${email}" disabled="disabled"
											required maxlength="200"
											title="아이디" style="margin-left: 20rem; width: 25rem;">
										<%-- <button class="btn btn-secondary emailBtn"  type="button" value="중복확인" data-target="#emailModal" data-toggle="modal" style="position: relative; width: 5.188rem; width: 10rem; margin-left: 0.5rem;" onclick="toServer('${root}')">중복확인</button> --%>
									</div>
									<br /> <br />
								</dd>
							</dl>

							<dl class="pwd" style="margin-top: -1rem;">
								<dt>
									<label for="USER_PWD1" style="margin-left: 20rem;">비밀번호
									</label>
								</dt>
								<!-- 에러시 dd의 error 클래스 추가 -->
								<dd style="">
									<div class="inp">
										<input class="form-control" style="margin-left: 20rem; width: 25rem;"
											type="password" id="password99" required
											maxlength="16" title="비밀번호" placeholder="비밀번호를 입력하세요.">

									</div>
								</dd>
							</dl>
								<dl class="pwd" style="margin-top: 3rem">
								<dt>
									<label for="USER_PWD1" style="margin-left: 20rem;">입력창 안에 문장을 입력해주세요.
									</label>
								</dt>
								<!-- 에러시 dd의 error 클래스 추가 -->
								<dd style="">
									<div class="inp">
										<input class="form-control" style="margin-left: 20rem; width: 25rem;"
											type="text" name="deleteMsg" id="password99"  placeholder="제주 스테이를 탈퇴합니다">
									</div>
								</dd>
							</dl>
							<br /> <br />
						</div>
						<!-- //아이디 및 비밀번호 -->
					</div>
					<br /> <br />
				</div>
				<br /><br />
				<br />
				<div class="btn"
					style="margin-top: -9rem; margin-bottom: 5rem; margin-left-2rem; /* border: 0.1rem solid green; */ width: 50rem; padding-left: 20rem;">
					<!-- 비활성화 시  disabled="disabled" 추가 -->
					<input class="btn btn-success" type="submit" id="btnSubmit" onclick="deleteCheck('${root}','${email}')"/>
					<input class="btn btn-light" type="reset" id="btnPwd"
						style="margin-left: 1rem;"/>
				</div>
			</div>
		</section>
</body>
<script type="text/javascript">
function deleteCheck(root, getEmail) {
	
	var deleteMsg = document.getElementsByName("deleteMsg");

	var str = deleteMsg[0].value;

	var getEmail = document.getElementById("emailAA");
	var email = getEmail.value;
	
	var getPassowrd = document.getElementById("password99");
	var password = getPassowrd.value;

	alert(email + password);
	
	if (str == "제주 스테이를 탈퇴합니다") {
		location.href = root + "/guestdelluna/memberDeleteOk.do?password="+password+"&email="+email;
	} else {
		alert("문구 입력을 다시 해주세요");
		return false;
	}

}
</script>

</html>