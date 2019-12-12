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
		
		<link rel="stylesheet" href="${root}/resources/css/register/test0.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test1.css"/> 
		<link rel="stylesheet" href="${root}/resources/css/register/test2.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test3.css"/>
		
		
		<script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		
		<title>게스트하우스 홈페이지</title>
		
		<meta property="fb:app_id" content="1844741562469039" />
		<meta property="og:type" content="website" />
		<meta property="og:title" content="파라다이스시티" />
		<meta property="og:url" content="http://www.p-city.com/front/member/joinStep3?noti01=Y&noti02=Y&noti03=Y&noti04=Y&noti05=Y" />
		<meta property="og:description" content="" />
		<meta property="og:image" content="http://www.p-city.com/resource/front/sns_logo.png" />
	<!-- 	
		<script src="/resource/front/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		 -->
		<!-- 
		<script src="/common/component/jquery-upload-file/js/file_handlers.js"></script>
		<script src="/common/js/check.js"></script>
		<script src="/common/js/form.js"></script>
		<script src="/common/js/string.js"></script>
		<script src="/common/js/common.js"></script>
		
		
		<!-- S : 1-2 js 
		<script type="text/javascript" src="/pcPub/static/js/common.js"></script>
		<script src="/common/component/jquery-session/jquery.session.js"></script>
	
	
		<script type="text/javascript" src="/pcPub/static/js/ui.js?v=1"></script>
			
		-->	
		<!-- data
		<script src="/resource/front/inc/js/data/KO/json.data.global.js" type="text/javascript" charset="utf-8"></script>
			
		<script src="/resource/front/js/front.js"></script>
		<link rel="canonical" href="www.p-city.com" />
		-->
		<script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script>
		
		<!--[if lt IE 9]>
		<script type="text/javascript">
			document.createElement("header"); 
			document.createElement("nav"); 
			document.createElement("section"); 
			document.createElement("article"); 
			document.createElement("footer");
		</script>
		<![endif]-->
		<!-- E : 1-2 css -->
	</head>
	
	<!-- <script type="text/javascript">
	$(document).ready(function() {
		var title = $(".tit_38").html() + "";
		if (title == "undefined") {
			title = "";
		} else {
			title = title.replace(/(<([^>]+)>)/gi, "");
		}
		
		var copy = $(".t_copy").html() + "";
		if (copy == "undefined") {
			copy = "파라다이스시티 홈페이지";
		} else {
			copy = copy.replace(/(<([^>]+)>)/gi, "");
		}
		
		$("meta[property='og\\:title']").attr("content", $("meta[property='og\\:title']").attr("content") + " " + title);
		$("meta[property='og\\:description']").attr("content", copy);
		
		//공지사항 (SBU별) 적용, 2019.04.25
		if (typeof jsSbuNoticeWrite == 'function') {
			jsSbuNoticeWrite();
		}
		
		
	});
	</script>

 -->

	<body>
		



<!-- <script type="text/javascript">
$(document).ready(function() {
	
});

//30분
var basicTime = 3600;    
var timeLimited = basicTime;
var timerchecker = null; 

function sessionTimer() {
	//이벤트가 발생했을경우 대기시간 초기화 
	if(window.event) { 
		timeLimited = basicTime;
		clearTimeout(timerchecker); 
	}

	if(timeLimited <= 0) {
		clearTimeout(timerchecker); 
		alert("장시간 미사용으로 자동 로그아웃 되었습니다."); 
		location.href = "/front/logout"; 
	} else {
		timeLimited--; 
		timerchecker = setTimeout("sessionTimer()", 1000); 
	}
}


</script>
 -->


<script>
var emailFormat = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var blank_pattern = /[\s]/g;
$(document).ready(function() {
	/* 
	if($("#USER_NM").length > 0)      { addInputHandler({input:$("#USER_NM")      , dataType:"HA"}); }
	
	 */
	// 아이디, 비밀번호, 비밀번호  확인 유효성 실시간 검사
	try {
		addInputHandler({input:$("#USER_ID"), dataType:"HA", handler:jsIdValidation});
	} catch(e) {
		console.log(e);
	}

	try {
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
	}

	
	
	
/* 	$(".btnJoin button").on("click", function() {
		if($(this).attr("disabled")) {
			return false;
		}
	});
	 */
	
	/* $("#SBU_NM").text("");
	
	selectVal("#USER_NATIONNO", "");
	
	
		$('#USER_NATIONNO').attr('disabled', true);
	
 */
	

	
	
});

	
	$(".ui-select-wrapper div.selectBox.req > a").each(function() {
		if(toNotNull($(this).next().find("li a.selection").data("value")) == "") {
			filled = false;
			return;
		}
	});
	
	/* 
	var wordFormat = /\d+/;
	var patt = new RegExp(wordFormat);
	
	var yearTxt = $("#USER_YEAR").next(".selectBox").find(".ui-select-trigger").text();
	var monthTxt = $("#USER_MONTH").next(".selectBox").find(".ui-select-trigger").text();
	var dayTxt = $("#USER_DAY").next(".selectBox").find(".ui-select-trigger").text();
	
	if(!patt.test(yearTxt)) {
		filled = false;
		return;
	}
	
	if(!patt.test(monthTxt)) {
		filled = false;
		return;
	}
	
	if(!patt.test(dayTxt)) {
		filled = false;
		return;
	}
	 
	if(filled) {
		$(".btnJoin button").attr("disabled", false);
	}
	*/
/* }/////////////// */

/* // select box 값 세팅 함수
function selectVal(id, val){
	var valueIdx;
	$(id).next().find('li').each(function(){
		if($(this).find('a').attr('data-value') == val){
			valueIdx = $(this).index();
		}
	});
	
	var $select = $(id).next().find('li>a').eq(valueIdx).closest(".ui-select-wrapper").find("select");
	
	$select.val(val);
	$(id).next().find('li>a').eq(valueIdx).addClass("selection").parent().siblings().find(".ui-select-option").removeClass("selection");
	$(id).next().find('li>a').eq(valueIdx).closest('.ui-select-options').hide().siblings(".ui-select-trigger").text($(id).next().find('li>a').eq(valueIdx).text());
} */

/* function jsJusoPopup(){
	var pop = window.open("/common/component/juso/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
} */



function jsIdValidation() {	
	$("#USER_ID_V").val("");
	$("#USER_ID").closest("dd").removeClass("error");
	
	if ($("#USER_ID").val() == "") {
		$("#USER_ID").closest("dd").addClass("error");
		$("#USER_ID").closest("div.inp").next(".errorText").text("이메일주소를 입력해 주세요");
		//alert("이메일주소를 입력해 주세요");
		$("#USER_ID").focus();
		
		return;
	}
	
	/*
	if(blank_pattern.test($('#USER_ID').val()) == true || emailFormat.test($('#USER_ID').val()) == false){
		$("#USER_ID").closest("dd").addClass("error");
		$("#USER_ID").closest("div.inp").next(".errorText").text("형식이 올바르지 않습니다.");
		//alert($("#USER_ID").attr("title") + " 형식이 올바르지 않습니다.");
		$("#USER_ID").focus();
		return false;
	}
	
	
	if (isEmail($("#USER_ID").val()) == false) {
		$("#USER_ID").closest("dd").addClass("error");
		$("#USER_ID").closest("div.inp").next(".errorText").text("형식이 올바르지 않습니다.");
		//alert($("#USER_ID").attr("title") + " 형식이 올바르지 않습니다.");
		$("#USER_ID").focus();
		
		return;
	}
	 
 	$.ajax({
		url : "/front/member/idValidation"
		, method : "post"
		, data : "M_EMAIL=" + $("#USER_ID").val()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.result != null) {
					if (data.result == "success") {
						//$("#USER_ID").closest("dd").addClass("error");
						//$("#USER_ID").closest("div.inp").next(".errorText").text("사용 가능한 아이디 입니다.");
						//alert("사용 가능한 아이디 입니다.");
						$("#USER_ID_V").val("Y"); 
					} else {
						$("#USER_ID").closest("dd").addClass("error");
						$("#USER_ID").closest("div.inp").next(".errorText").text("사용중인 이메일 입니다.");
						//alert("사용중인 이메일 입니다.");
						$("#USER_ID").focus();
					}
				} else {
					$("#USER_ID").closest("dd").addClass("error");
					$("#USER_ID").closest("div.inp").next(".errorText").text("중복을 처리하는데 실패하였습니다.");
					//alert("중복을 처리하는데 실패하였습니다.");
				}
			}
		}
	});*/ 
}

function jsPwd1Validation() {
	$("#USER_PWD1").closest("dd").removeClass("error");
	
	var rtn = $("#form1").validate();
	if(rtn.msg == "비밀번호" && rtn.isValid == false) {
		$("#USER_PWD1").closest("dd").addClass("error");
		$("#USER_PWD1").closest("div.inp").next(".errorText").text("영문, 숫자, 특수 기호 조합으로 8~16자 이내로 입력해주세요.");
	}
	$("#USER_PWD1").focus();
}

function jsPwd2Validation() {
	$("#USER_PWD2").closest("dd").removeClass("error");
	
	if ($("#password").val() != $("#USER_PWD2").val()) {
		$("#USER_PWD2").closest("dd").addClass("error");
		$("#USER_PWD2").closest("div.inp").next(".errorText").text("비밀번호가 일치하지 않습니다.");
		$("#USER_PWD2").val("");
		$("#USER_PWD2").focus();
	}
}


function jsJoin() {
	//로딩바 시작
	fullLoding($("#container"));
	
	var validChk = true;
	var focusTgt = "";
	
	
	if(blank_pattern.test($('#email').val()) == true || emailFormat.test($('#email').val()) == false){
		//alert($("#USER_EMAIL").attr("title") + " 형식이 올바르지 않습니다.");
		$("#email").closest("dd").addClass("error");
		$("#email").closest("div.inp").next(".errorText").text("이메일 형식이 올바르지 않습니다.");
		focusTgt = "#email";
		validChk = false;
		
	} else if($("#phone").length > 0 && $("#phone").val().length < 12) {
		
		$("#phone").closest("dd").addClass("error");
		$("#phone").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
		focusTgt = "#phone";
		validChk = false;
	} 
	
	rtn = $("#form1").validate();
	var genURL = "";
	var sslURL = "";
	if (rtn.isValid == false) {
		var sub_fix = "항목을 입력하세요.";
		if (rtn.chkType == "type") {
			if(rtn.msg == "비밀번호") {
				sub_fix = "형식이 올바르지 않습니다.";
			} else {
				sub_fix = "형식이 올바르지 않습니다.";
			}
		}
		
		if (rtn.msg != "") {
			alert(rtn.msg + " " + sub_fix);
		} else {
			alert(sub_fix);
		}
		
		validChk = false;
	}

	if ($("#password").val() != $("#USER_PWD2").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#USER_PWD2").val("");
		$("#USER_PWD2").focus();
		focusTgt = "#USER_PWD2";
		validChk = false;
	}
	
	//유효성 검사 실패시 로딩바 제거
	if (!validChk) {
		fullLodingClose();
		//포커싱 타겟이 있으면 포커싱
		if (!isNullOrEmpty(focusTgt)) {
			$(focusTgt).focus();
		}
		return;
	}
	
	jsChangeDisabledFalseBeforeSubmit(); 
	
	
	/* $.ajax({
		url : sslURL + "/front/member/joinProc"
		, method : "post"
		, data : $("#form1").serialize()
		, async : false
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.result != null) {
					//회원가입에 성공하면 로그인 처리
					if (data.result == "success") {
						$.ajax({
							url : sslURL + "/front/loginProc"
							, method : "post"
							, async : false
							, data : {USER_ID : toNotNull($('#USER_ID').val()), USER_PWD : toNotNull($("#USER_PWD1").val())}
							, success : function(data, stat, xhr) {
								if (stat == "success") {
									if (data.result != null) {
										if (data.result == "success") {
											var url = genURL + "/front/member/joinStep4";
											
											
											
											location.href = url;
										} else {
											jsChangeDisabledTrue();
											alert("login을 처리하는데 실패하였습니다.");
										}
									} else {
										jsChangeDisabledTrue();
										alert("login을 처리하는데 실패하였습니다.");
									}
								}
							}
						});
					} else {
						jsChangeDisabledTrue();
						alert("회원가입을 처리하는데 실패하였습니다.");
					}
				} else {
					jsChangeDisabledTrue();
					alert("회원가입을 처리하는데 실패하였습니다.");
				}
			} else {
				jsChangeDisabledTrue();
				alert("회원가입을 처리하는데 실패하였습니다.");
			}
			//로딩바 닫기
			fullLodingClose();
		}
	});
} */

/*
function jsChangeDisabledFalseBeforeSubmit() {
	$("#form1").find("select").each(function() {
		$(this).prop("disabled", false);
		$(this).next("div.selectBox").removeClass("disabled");
	});
	
	$("#form1").find("input").each(function() {
		$(this).prop("disabled", false);
	});
}

 function jsChangeDisabledTrue() {
	
		$("#USER_ID").prop("disabled", true);
	
		
} 

function jsEqualChange(){
	if($("input:checkbox[id='agg01']").is(":checked")==true){
		var USER_ID =  $("#USER_ID").val();
		if(USER_ID == ""){
			alert("이메일주소를 입력해 주세요");
			$("input:checkbox[id='agg01']").prop("checked", false);
			return;
		}else{
			$("#USER_EMAIL").val($("#USER_ID").val());
		}
	}else{
		$("#USER_EMAIL").val("");
	}
}
*/

/* function jsFullLodingClose() {
	//로딩바 닫기
	fullLodingClose();
} */

</script>

<!-- 컨텐츠 영역 -->
<form action="${root}/member/registerOk.do" method="post" onsubmit="return registForm(this)" name="createForm">
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
								<!-- <input type="hidden" id="USER_ID_V" name="USER_ID_V" value="Y"> -->
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
								<input type="password" id="password" name="password" required maxlength="16" title="비밀번호" placeholder="영문, 숫자, 특수 기호 조합 8~16자 이내">
								<button class="btnDelete">삭제</button>
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
										<button class="btnDelete">삭제</button>
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
									<button class="btnDelete">삭제</button>
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
				<button onclick="jsJoin(); return false;" class="btn btnFull" type="submit"><span>확인</span></button>
			</div>
		</div>
		
	</div>
</section>
</form>
<!-- //컨텐츠 영역 -->
		


	</body>
</html>