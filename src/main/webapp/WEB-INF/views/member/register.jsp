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
	
<!-- 		<meta charset="UTF-8"> -->
		
		<%-- <link rel="stylesheet" href="${root}/resources/css/register/test0.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test1.css"/> 
		<link rel="stylesheet" href="${root}/resources/css/register/test2.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test3.css"/> --%>
		
		
		<link rel="stylesheet" href="${root}/resources/css/register/register.css"/>
		
<%-- 		<script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script> --%>
		
		<title>게스트하우스 홈페이지</title>
		
		
		
		<script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script>
		
		
	</head>
	

	<body>
	
	
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<!-- <script type="text/javascript">
	function toServer(root) {
		//alert(root);
		var email = document.getElementById("emailAA").value;
		alert(email);
		
		var url = root + "/member/emailCheck.do?";
		var params = "email=" + email;
		$.ajax({
			url:url+params,
			method:"get",
			success:function(check){
				
				$(".form-group #usedEmail").val(email);
				
				if(check==1)
				$(".form-group #container").text("이미 존재하는 아이디입니다.");
				$(".id #chEmail").text("이미 존재하는 아이디입니다.");
				else{
				$(".form-group #container").text("사용가능한 아이디입니다.");
					
				}
			}
		});
		
	}
	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//alert(xhr.responseText);
			/* document.getElementById("container").innerHTML = xhr.responseText; */
			document.getElementById("container").innerHTML = xhr.responseText;
		}
	}
	
</script> -->

<script>
$(document).ready(function(){
	$("#emailAA").blur(function(){
		var email = document.getElementById("emailAA").value;
		//alert(email);
		
		var url =  "${root}/member/emailCheck.do?";
		var params = "email=" + email;
		
		$.ajax({
			url:url+params,
			method:"get",
			success:function(check){
				//console.log("중복이면 0: " + check);
				
				if(check==1){
					$("#idid #id_check").text("이미 존재하는 이메일입니다. 다른 이메일을 사용하시길 바랍니다.");
					$("#idid #id_check").css("color","red");
					$("#btnSubmit").attr("disabled",true);
				}
				else{
					$("#idid #id_check").text("사용가능한 이메일입니다.");
					$("#idid #id_check").css("color","blue");
					
				}
			}
		});
		
	});
	
	$(".pwd #USER_PWD2").blur(function(){
		var pwd = document.getElementById("password99").value;
		var pwd2 = document.getElementById("USER_PWD2").value;
		//alert(pwd + pwd2);
		
		if(pwd!=pwd2){
			$(".pwd #pwsame").text("비밀번호를 잘못 입력하셨습니다.");
			$(".pwd #pwsame").css("color","red");
			$("#btnSubmit").attr("disabled",true);
		}else{
			//$("#btnSubmit").attr("disabled",false);
		}
		
	});
	
	$(".inp #memberName").blur(function(){
		var memberName = document.getElementById("memberName").value;
		var hName = /^[가-힣]+$/;
		
		if(memberName ==""){
			alert("이름을 입력해주세요");
			//$('#memberName').focus();
		}else if(!hName.test(memberName)){
			alert("이름을 한글로 정확히 입력하세요.");
			$("#btnSubmit").attr("disabled",true);
			//$('#memberName').focus();
		}
	});
	$(".inp #phone").blur(function () {
		var phone = document.getElementById("phone").value;
		var pattern = /^[0-9]*$/;
		
		if(!pattern.test(phone)){
			alert("휴대폰 번호를 정확히 입력해주세요.");
			$("#btnSubmit").attr("disabled",true);
		}else{
			$("#btnSubmit").attr("disabled",false);
		}
		
	});
});

</script>


<!-- 컨텐츠 영역 -->
<form action="${root}/member/registerOk.do" method="post" name="createForm"  class="form-horiaontal">

<section id="container">
	<div class="control-group" style="width:70rem;/*  border: 1px solid red; */ margin:5rem auto; height: 75rem;">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			<h1 style="text-align: center;"><span id="register">Sign up</span></h1><br/>
			<h5 style="text-align: center; font-size: 1rem; color:#484848;">제주스테이 회원만을 위한 다양한 혜택과 서비스를 누려보세요.</h5>
			
		</div>
	
		<div class="fullBg" style="height: 60rem;">
			<div class="innerBox formJoinWrap" style="margin: 0 auto; height: 31rem;">
				<!-- 아이디 및 비밀번호 -->
				<div class="form-group" style="margin: 0 auto; /* border: 0.1rem solid blue; */ height: 29rem; ">
					<dt><label for="userName" style="width:45rem; height:3rem; background-color: #edf6f6; margin-left: 13rem; margin-top: 3rem; margin-bottom: 1rem; line-height: 3rem; margin-bottom: 3rem; padding-left: 1rem;">아이디 및 비밀번호</label></dt>
					<dl class="id">
						<dt><label for="USER_ID" style="margin-left:20rem;">아이디 (이메일) </label></dt>
						<dd id="idid">
							<div class="inp">
								<input class="form-control email" type="email" id="emailAA" name="email" required maxlength="200" placeholder="jeju@stay.com" title="아이디" style="margin-left: 20rem;" >
								<%-- <button class="btn btn-secondary emailBtn"  type="button" value="중복확인" data-target="#emailModal" data-toggle="modal" style="position: relative; width: 5.188rem; width: 10rem; margin-left: 0.5rem;" onclick="toServer('${root}')">중복확인</button> --%>
							</div>
							<br/><br/>
							<div>
								<div id="id_check" style="margin-left: 20rem;"></div>
							</div>
						</dd>
					</dl>
					
					<dl class="pwd">
						<dt><label for="USER_PWD1" style="margin-left: 20rem;">비밀번호 </label></dt>
						<!-- 에러시 dd의 error 클래스 추가 -->
						<dd style="">
							<div class="inp">
								<input class="form-control" style="margin-left: 20rem;" type="password" id="password99" name="password" required maxlength="16" title="비밀번호" placeholder="비밀번호를 입력하세요.">
								
							</div>
							
						</dd>
					</dl>
					<br/><br/>
					<dl class="pwd" id="passwordChk">
						<dt style="margin-left: 20rem;"><label for="USER_PWD2">비밀번호 확인</label></dt>
						
						<!-- 에러시 dd의 error 클래스 추가 -->
						<dd>
							<div class="inp">
								<input class="form-control" style="margin-left: 20rem;" type="password" id="USER_PWD2" name="USER_PWD2" required maxlength="16" title="비밀번호 확인" placeholder="비밀번호를 확인하세요.">
							</div>
							<br/><br/>
							<div>
								<div id="pwsame" style="margin-left: 20rem;"></div>
							</div>
							
						</dd>
					</dl>
				</div>
				<!-- //아이디 및 비밀번호 -->
				<div style="width: 46rem; height: 0.1rem; border-bottom: 0.01rem solid #c6c6c6; margin-top: 3rem; margin-left: 12rem;" align="center"></div>
				
				<br/><br/>
				<!-- 기본정보 -->
				<div class="form-group">
					<dt><br/><label for="userInfo" style="width:45rem; height:3rem; background-color: #edf6f6; margin-left: 13rem; margin-top: 0.5rem; margin-bottom: 3rem; line-height: 3rem; padding-left: 1rem;">기본 정보</label></dt>
					
					
					<div class="left">
						<dl class="nameType1">
							<dt><label for="USER_NM" style="margin-left: 20rem;">이름(한글) </label></dt>
							<!-- 에러시 dd의 error 클래스 추가 -->
							<dd>
								<div class="ui-select-wrapper">
									<div class="inp">
										<input class="form-control" type="text" id="memberName" name="memberName" required maxlength="14" title="이름(한글)" style="width: 30rem; margin-left: 20rem;">
										
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<br/>
					<div class="right">
					
						<dl class="phone">
							<dt><label for="Phone" style="margin-left: 20rem; margin-top: 2rem;">휴대폰 번호 </label></dt>
							<dd>
								<div class="inp">
									<input class="form-control" type="tel" id="phone" name="phone" value="" required maxlength="11" placeholder="" title="휴대 전화 번호" style="width: 30rem; margin-left: 20rem;" >
									
								</div>
								
							</dd>
						</dl>
						
					</div>	
					
					
				</div>
				
				
			</div>
			
			
			<br/><br/>
		</div>
		<br/>
		<div class="btn" style="/* margin-bottom: 5rem;  *//* border: 0.1rem solid green; */ width: 50rem; padding-left: 20rem;">
				<!-- 비활성화 시  disabled="disabled" 추가 -->
				<button class="btn btn-success" type="submit" id="btnSubmit">확인</button>
				<button class="btn btn-light" type="submit" id="btnPwd" style="margin-left: 1rem;">취소</button>
			</div>
		
		
		
	</div>
	
</section>

	
</form>
<!-- //컨텐츠 영역 -->
		
		<!-- 모달페이지 -->
	 <div class="modal fade" id="emailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${root}/admin/memberUpdateOk.do" method = "post" onsubmit = "return boardForm(this)" name="createForm">
					 <!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">아이디 중복확인</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
					 <!-- Modal body -->
						<div class="form-group">
												
							<div align="center" height="20" width="125">
								<p align="center" height="20" width="125">아이디(email)</p>
								<input type="text" class="form-control" id="usedEmail" style="width: 10rem;" name="email" />
							</div>
												
							<div id="container"class="container" align="center" style="width: 20rem; height: 5rem;">
								
							</div>
							
							
						</div>
								        
					<!-- Modal footer -->
						<div class="modal-footer">
							<button id="modalSubmit" type="submit" class="btn btn-info">확인</button>
							<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
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
				var btn = $('#btnSubmit');
				btn.Attr("disabled",true);
				//btn.css("background-color","pink");   
				
			}
			else{
				// 비번 제대로 입력
				var btn = $('#btnSubmit');
				//btn.css("background-color","blue");   
				document.getElementById('pwsame').innerHTML = '';
				if(email != "" && name != "" && id != "" && phone !== ""){
					var btn = $('#btnSubmit');
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