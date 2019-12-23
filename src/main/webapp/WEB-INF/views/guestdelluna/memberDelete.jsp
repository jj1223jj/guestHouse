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

	

		<div>최종 탈퇴 전 비밀번호를 입력하세요</div>

		<div>이메일</div>
		<div>
			<input type="email" value="${email}" disabled="disabled" /> <input
				type="hidden" value="${email}" name="email" />
		</div>

		<div>비밀번호</div>
		<div>
			<input type="password" name="password" />
			<input type="hidden" name="password" value=""${password}/>
		</div>
		
		<div>다음 문자를 그대로 입력해주세요</div>
		<div>게스트 델루나를 탈퇴합니다</div>
		<input type="text" class="deleteMsg" placeholder="게스트 델루나를 탈퇴합니다"><br>

		<input type="button" value="탈퇴" onclick="deleteCheck('${root}','${password}','${email}')"/> <input type="reset" value="탈퇴취소" />
		
</body>

<script type="text/javascript">
	function deleteCheck(root,password,email){
		
		var deleteMsg = document.getElementsByClassName("deleteMsg");
		
		var str = deleteMsg[0].value;
		
		var getPassword = document.getElementsByName("password");
		var password = getPassword[0].value;
		
		var getEmail = document.getElementsByName("email");
		var email = getEmail[0].value;
		
		alert(str);
		alert(email);
		alert(password);
		
		if(str == "게스트 델루나를 탈퇴합니다"){
			location.href  = root + "/guestdelluna/memberDeleteOk.do?password=" +password+"&email="+email;
		}
		else{
			alert("문구 입력을 다시 해주세요");
			return false;
		}
		
	}
</script>

</html>