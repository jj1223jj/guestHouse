<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<c:set var = "root" value="${pageContext.request.contextPath}"/>
<!--[if IE 8]><html lang="ko" class="ie8"><![endif]-->
<!--[if IE 9]><html lang="ko" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="ko">
	<!--<![endif]-->
	<head>
	
		<meta charset="UTF-8">
		
		<%-- <link rel="stylesheet" href="${root}/resources/css/register/test0.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test1.css"/> 
		<link rel="stylesheet" href="${root}/resources/css/register/test2.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test3.css"/> --%>
		
		
		
		<script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		
		<title>게스트하우스 홈페이지</title>
		
		
		
		<script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script>
		
		
	</head>
	

	<body>
		
	
	
<script type="text/javascript">
var emailFormat = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var blank_pattern = /[\s]/g;

$(document).ready(function() {
	
	//if($("#email").length > 0)      { addInputHandler({input:$("#email")      , dataType:"HA"}); }
	
	 
	// 아이디, 비밀번호, 비밀번호  확인 유효성 실시간 검사
	/* try {
		addInputHandler({input:$("#email"), dataType:"HA", handler:jsIdValidation});
	} catch(e) {
		console.log(e);
	} */

	/* try {
		addInputHandler({input:$("#password"), dataType:"N", handler:jsPwd1Validation});
	} catch(e) {
		console.log(e);
	}

	$("#USER_PWD2").on("change", function() {
		jsPwd2Validation();
	});

	try {
		addInputHandler({input:$("#email"), dataType:"AP", handler:function() {
			$("#email").closest("dd").removeClass("error");
		}});
	} catch(e) {
		console.log(e);
	}

	if($("#email").length > 0) {
		try {
			addInputHandler({input:$("#phone"), dataType:"N", handler:function() {
				$("#phone").closest("dd").removeClass("error");
			}});
		} catch(e) {
			console.log(e);
		}
	} */
	

});




function jsPwd1Validation() {
	$("#password").closest("dd").removeClass("error");
	
	var rtn = $("#form1").validate();
	if(rtn.msg == "비밀번호" && rtn.isValid == false) {
		$("#USER_PWD1").closest("dd").addClass("error");
		$("#USER_PWD1").closest("div.inp").next(".errorText").text("영문, 숫자, 특수 기호 조합으로 8~16자 이내로 입력해주세요.");
	}
	$("#USER_PWD1").focus();
}





/*





*/


</script>

<!-- 컨텐츠 영역 -->
<form action="${root}/member/registerOk.do" method="post" name="createForm" >
<section id="container">
	<div class="loginWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			<h1><span>회원가입</span>게스트하우스 멤버십 회원만을 위한<br />다양한 혜택과 서비스를 누려보세요.</h1>
			
		</div>
	
		<div class="fullBg">
			<div class="innerBox formJoinWrap">
				<!-- 아이디 및 비밀번호 -->
				<div class="formJoin">
					<h2>아이디 및 비밀번호</h2>
					<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
					<dl class="id">
						<dt><label for="USER_ID">아이디 (이메일) <span class="color">*</span></label></dt>
						<dd>
							<div class="inp">
								<input type="email" id="email" name="email" required maxlength="200" placeholder="guesthouse@guesthouse.com" title="아이디" >
								<input type="button" value="중복확인" style="position: absolute; width: 83px; margin-left: 20px;"onclick="emailCheck(createForm,'${root}')">
							</div>
							<p class="text"> - 일부 도메인은 수신에 제한이 있을 수 있습니다. <br />스팸메일함으로도 수신이 되지 않을 경우, 다른 이메일을 사용하시기 바랍니다. </p>
							<div class="errorText">
								<!-- 에러 메시지 -->
							</div>
						</dd>
					</dl>
					
					<dl class="pwd">
						<dt><label for="USER_PWD1">비밀번호 <span class="color">*</span></label></dt>
						<!-- 에러시 dd의 error 클래스 추가 -->
						<dd>
							<div class="inp">
								<input type="password" id="password" name="password" required maxlength="16" title="비밀번호" placeholder="비밀번호를 입력하세요.">
								
							</div>
							
							<div class="errorText">
								<!-- 에러 메시지 -->
							</div>
						</dd>
					</dl>
					<dl class="pwd">
						<dt><label for="USER_PWD2">비밀번호 확인 <span class="color">*</span></label></dt>
						<!-- 에러시 dd의 error 클래스 추가 -->
						<dd>
							<div class="inp">
								<input type="password" id="USER_PWD2" name="USER_PWD2" required maxlength="16" title="비밀번호 확인">
								<p id="pwsame" style="color:red;"></p>

								<button class="btnDelete">삭제</button>
							</div>
							<div class="errorText">
								<!-- 에러 메시지 -->
							</div>	
						</dd>
					</dl>
				</div>
				<!-- //아이디 및 비밀번호 -->
				
				<!-- 기본정보 -->
				<div class="formInfo clearFixed">
					<h2>기본 정보</h2>
					<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
					
					
					<div class="left">
						<dl class="nameType1">
							<dt><label for="USER_NM">이름(한글) <span class="color">*</span></label></dt>
							<!-- 에러시 dd의 error 클래스 추가 -->
							<dd>
								<div class="ui-select-wrapper">
									<div class="inp">
										<input type="text" id="memberName" name="memberName" required maxlength="14" title="이름(한글)" style="width: 543px;">
										
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="right">
					
						<dl class="phone">
							<dt><label for="Phone">휴대폰 번호 <span class="color">*</span></label></dt>
							<dd>
								<div class="inp">
									<input type="tel" id="phone" name="phone" value="" required maxlength="11" placeholder="" title="휴대 전화 번호" style="width: 540px;" >
									
								</div>
								
								<div class="errorText">
									<!-- 에러 메시지 -->
								</div>
							</dd>
						</dl>
						
					</div>	
				</div>
			</div>
			<div class="btnJoin">
				<!-- 비활성화 시  disabled="disabled" 추가 -->
				<button class="btn btnFull" type="submit" id="btnPwd" disabled="disabled"><span>확인</span></button>
			</div>
		</div>
		
	</div>
</section>
</form>
<!-- //컨텐츠 영역 -->
		
		
		
<script>
	
	
	$('#password').on('input', checkInput);
	$('#USER_PWD2').on('input', checkInput);
	$('#email').on('input', checkInput);
	$('#memberName').on('input', checkInput);
	$('#phone').on('input', checkInput);
	
		
		function checkInput() {
			
			var email = $('#email').val();
			var password = $('#password').val();
			var passwordChk = $('#USER_PWD2').val();
			var name = $('#memberName').val();
			var id = $('#phone').val(); 
			
			if (password !="" && passwordChk != "" && password != passwordChk) {
				
				document.getElementById('pwsame').innerHTML = '비밀번호가 일치하지 않습니다. 다시 입력하세요.';
				/* alert("비밀번호가 일치하지 않습니다." +password +"," + passwordChk);
				$("#USER_PWD2").val("");
				$("#USER_PWD2").focus();
				focusTgt = "#USER_PWD2";*/
				var btn = $('#btnPwd');
				btn.Attr("disabled",true);
				//btn.css("background-color","pink");   
				
			}
			else{
				// 비번 제대로 입력
				var btn = $('#btnPwd');
				//btn.css("background-color","blue");   
				document.getElementById('pwsame').innerHTML = '';
				if(email != "" && name != "" && id != "" && phone !== ""){
					var btn = $('#btnPwd');
					btn.removeAttr("disabled");
				}
			
			}
		}
				
		
		/* if(email != "" && name != "" && id != ""){
					var btn = $('#btnPwd');
					btn.removeAttr("disabled");
				} */
			
		
		
	</script>
		

	</body>
</html>