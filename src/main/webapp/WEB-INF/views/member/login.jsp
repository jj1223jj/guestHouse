<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html lang="ko"><!--<![endif]--><head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta charset="utf-8">

		<!-- <meta name="keywords" content="Paradise city, p-city, p city, pcity, 파라다이스시티, 피시티, 파라다이스씨티, 피씨티, 영종도 복합리조트, 영종도 카지노, 영종도 호텔, 영종도 리조트, vkfkekdltmtlxl, 김수현">
		<meta name="description" content="동북아시아 최초의 복합리조트"> -->
		
		<title>GUEST DELLUNA</title>
		<!-- 
		<meta property="fb:app_id" content="1844741562469039">
		<meta property="og:type" content="website">
		<meta property="og:title" content="파라다이스시티 ">
		<meta property="og:url" content="http://www.p-city.com/front/login">
		<meta property="og:description" content="파라다이스시티 홈페이지">
		<meta property="og:image" content="http://www.p-city.com/resource/front/sns_logo.png">
		
		<script async="" src="https://b92.yahoo.co.jp/search/?p=QM0HYALPLQ&amp;label=&amp;ref=https%3A%2F%2Fwww.p-city.com%2Ffront%2Flogin&amp;rref=https%3A%2F%2Fwww.p-city.com%2Ffront%3Fad%3Dtrue&amp;pt=&amp;item=&amp;cat=&amp;price=&amp;quantity=&amp;r=1575953543.5861688&amp;pvid=v197sw6ckhnk3ze1sjf"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://b92.yahoo.co.jp/search/?p=BWENCH3BVE&amp;label=&amp;ref=https%3A%2F%2Fwww.p-city.com%2Ffront%2Flogin&amp;rref=https%3A%2F%2Fwww.p-city.com%2Ffront%3Fad%3Dtrue&amp;pt=&amp;item=&amp;cat=&amp;price=&amp;quantity=&amp;r=1575953543.8055308&amp;pvid=v197sw6ckhnk3ze1sjf"></script><script src="https://hm.baidu.com/hm.js?4b47cbd74fc60910d3e399da479cb0b7"></script><script src="/resource/front/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/common/component/jquery-upload-file/js/file_handlers.js"></script>
		<script src="/common/js/check.js"></script>
		<script src="/common/js/form.js"></script>
		<script src="/common/js/string.js"></script>
		<script src="/common/js/common.js"></script> -->
		
		
		<script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		
		
		<!-- 카카오 -->
	
		 <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			
		<!-- S : 1-2 js 	
		<script type="text/javascript" src="/pcPub/static/js/common.js"></script>
		<script src="/common/component/jquery-session/jquery.session.js"></script>
		-->
		<!-- E : 1-2 js  -->
		
		<link rel="stylesheet" href="${root}/resources/css/register/test0.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test1.css"/> 
		<link rel="stylesheet" href="${root}/resources/css/register/test2.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test3.css"/>
		
		
		<!-- 
		<script type="text/javascript" src="/pcPub/static/js/ui.js?v=1"></script>
			
		
		
		data
		<script src="/resource/front/inc/js/data/KO/json.data.global.js" type="text/javascript" charset="utf-8"></script>
			
		<script src="/resource/front/js/front.js"></script>
		<link rel="canonical" href="www.p-city.com">
		
		<link rel="alternate" hreflang="KO" href="https://www.p-city.com/front?language=KO">
		<link rel="alternate" hreflang="x-default" href="https://www.p-city.com/front?language=EN">
		
 -->		<!--[if lt IE 9]>
		<script type="text/javascript">
			document.createElement("header"); 
			document.createElement("nav"); 
			document.createElement("section"); 
			document.createElement("article"); 
			document.createElement("footer");
		</script>
		<![endif]-->
		<!-- E : 1-2 css -->
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
	<script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/856602146/?random=1575953543357&amp;cv=9&amp;fst=1575953543357&amp;num=1&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;sendb=1&amp;ig=1&amp;frm=0&amp;url=https%3A%2F%2Fwww.p-city.com%2Ffront%2Flogin&amp;ref=https%3A%2F%2Fwww.p-city.com%2Ffront%3Fad%3Dtrue&amp;tiba=%ED%8C%8C%EB%9D%BC%EB%8B%A4%EC%9D%B4%EC%8A%A4%EC%8B%9C%ED%8B%B0%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80&amp;hn=www.googleadservices.com&amp;rfmt=3&amp;fmt=4"></script></head>
	
	

 -->

	<body class="">
		










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

<!-- <script language="JavaScript">
$(document).ready(function(){
	
	
	$('#USER_ID').focus();

	try {
		addInputHandler({input:$("input"), dataType:"HA", handler:function() {
			checkFormFilled(this);
		}});
	} catch(e) {
		console.log(e);
	}
	/* 
	$(document).on("click",".ui-select-option", function(e){
		checkFormFilled();
	});
	 */
	//레이어 팝업 초기화
	jsRefundLayerInitialize();
});

//로그인이 유효한 경우
function jsLoginOk() {
	//카지노 가이드 확인
	if (toNotNull($("#isCasinoGuide").val()) == "Y") {
		document.location.href = "/front/casino/casinoGuide";
	} else {
		
		document.location.href = "/";
		
	}
}

//휴면회원 해제 알림 레이어 팝업 초기화
function jsRefundLayerInitialize() {
	//레이어 팝업 초기화 설정값 변수 선언
	var title   = "계정 휴면해제 안내";
	var ctxtArr = ["{0} 님의 휴면 상태가 해제되었습니다."
				  ,"휴면 회원이 해제됨에 따라 기존 이용하셨던 서비스를 동일하게 이용할 수 있습니다."
				  ,"파라다이스시티 홈페이지 또는 리조트 내에서의 1년 이상 활동(거래) 이력이 없는 경우, 휴면 회원으로 전환됩니다. "];
	var tClsArr = ["pd0i"
				  ,""
				  ,""];
	var btnObj  = new Object();
	btnObj.leftBtnNm  = "확인";
	btnObj.leftBtnAct = "javascript:jsLoginOk();";
	btnObj.btnTrId    = "#btnOneTr"; 
	//닫기버튼과 확인버튼의 이벤트 통합여부
	btnObj.btnUnionYn = "Y";
	
	//레이어 팝업 초기화
	jsInitInfoPop(true, "#SLEEP_USER", title, ctxtArr, tClsArr, btnObj);
}


 function jsLogin() {
	//카지노 가이드 초기화
	$("#isCasinoGuide").val("");
	
	var genURL = "";
	var sslURL = "";
	var USER_ID = $('#email').val();
	email = email.trim();
	$('#email').val(email);
	
	if ($('#email').val() == null || $('#email').val() == "") {
		alert("이메일주소를 입력해 주세요.");
		$('#email').focus();
	} else if ($('#password').val() == null || $('#password').val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$('#password').focus();
	} else {
		$.ajax({
			url : '/member/loginOk'
			, method : "post"
			, data : $('#form1').serialize()
			, success : function(data, stat, xhr) {
				if (data.result != null) {
					if (data.result == "success") {
						
							alert("로그인 되었습니다.");
							jsLoginOk(data);
							
						
					} else {
						 
						alert("이메일 혹은 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
						
					}
				} else {
					alert("Login을 처리하는데 실패하였습니다.");
				}
			}
		});
	}
}

function jsReservation() {
	rtn = $("#form2").validate();
	
	if (rtn.isValid == false) {
		var sub_fix = "항목을 입력하세요.";
		if (rtn.chkType == "type") {
			sub_fix = "형식이 올바르지 않습니다.";
		}
		
		if (rtn.msg != "") {
			alert(rtn.msg + " " + sub_fix);
		} else {
			alert(sub_fix);
		}
		
		return;		
	}
	$.ajax({
		url : '/front/reservation/checkReservation'
		, method : "post"
		, data : $('#form2').serialize()
		, success : function(data, stat, xhr) {
			if (data.result != null) {
				if (data.result == "success") {
						$("#form2").attr("action", "/front/mypage/reservationNonmember");
						$("#form2").submit();
				} else {
					alert("조회된 예약이 없습니다.");
				}
			} else {
				alert("Login을 처리하는데 실패하였습니다.");
			}
		}
	});
}

//필수 입력폼 작성여부 검사
function checkFormFilled(obj) {
	var filled = true;
	
	$(".btnLogin").addClass("disabled");
	
	$(obj).closest("form").find("input").each(function() {
		if($(this).val() == "") {
			filled = false;
			return;
		}
	});
	
	if(filled) {
		$(obj).closest("form").find(".btnLogin").removeClass("disabled");
	}
}

function redirectToJoin() {
	 window.location.href="/front/member/joinStep1";
}

/* 
function jsChange() {
	$(".LOGIN").hide();
	$("#" + $(':radio[name="noti1"]:checked').val() + "_LOGIN").show();
}
 */
</script>
 
  -->
  <script type="text/javascript">
  $(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
  
  </script>
  
<!-- 컨텐츠 영역 -->
<form action="${root}/member/loginOk.do" method="post" onsubmit="return registForm(this)" name="createForm">
	<section id="container">
		
		<input type="hidden" id="isCasinoGuide" value="">
		<div class="loginWrap">
			<div class="innerBox">
				<h1><span>로그인</span>게스트델루나에 오신 것을 환영합니다.<br>로그인을 하시고 더 편리하게 이용하세요.</h1>
			</div>
			<div class="fullBg">
				<div class="innerBox">
					<div class="reserveLogin clearFixed">
	
						<div>
							<div class="tapBox">
								<ul class="tab">
									<li class="current" data-tab="tab1"><a href="#">회원 로그인</a></li>
									<li data-tab="tab2"><a href="#">카카오 로그인</a></li>
								</ul>
							</div>
							
							<div class="tabcontent current" id="tab1">
							
								<form id="form1" name="form1">
									<div class="loginBox">
										<div class="inp">
											<input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required="">
											<button class="btnDelete" style="display: none;">삭제</button>
										</div>									
										<div class="inp">
											<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required="">
											<button class="btnDelete">삭제</button>
										</div>
										
										<button class="btn btnFull btnLogin" onclick="location:href='${root}/member/loginOk.do'" type="submit">로그인</button>
									</div>
								</form>
							</div>
							
							
							<div class="tabcontent" id="tab2">
							
							<input type="hidden" id="isCasinoGuide" value="">
							
								<form id="form2" name="form2">
									<div class="loginBox">
										<div class="inp">
											<a id="kakao-login-btn"></a>
										    <a href="http://developers.kakao.com/logout"></a>
										    
										    <script type='text/javascript'>
										      //<![CDATA[
										        // 사용할 앱의 JavaScript 키를 설정해 주세요.
										        Kakao.init('5a47c72d35ab36aa08feca719cb2bccf');
										        
										        // 카카오 로그인 버튼을 생성합니다.
										        Kakao.Auth.createLoginButton({
										          container: '#kakao-login-btn',
										          success: function(authObj) {
										            alert(JSON.stringify(authObj));
										            
										            // 로그인 성공시, API를 호출합니다.
										            Kakao.API.request({
										             url: '/v1/user/me',
										             success: function(res) {
										              console.log(res);
										              
										              var userID = res.id;      //유저의 카카오톡 고유 id
										              var userEmail = res.kaccount_email;   //유저의 이메일
										              var userNickName = res.properties.nickname; //유저가 등록한 별명
										              
										              console.log(userID);
										              console.log(userEmail);
										              console.log(userNickName);
										              console.log(JSON.stringify(res.properties.profile_image));
										              
										              $("#kakao-profile").append(res.properties.nickname);
										              $("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
										             },
										             fail: function(error) {
										              alert(JSON.stringify(error));
										             }
										            });
										          },
										          fail: function(err) {
										             alert(JSON.stringify(err));
										          }
										        });
										      //]]>
										    </script>
										    
										    <div id="kakao-logged-group"></div>
											<div id="kakao-profile"></div> 
											
										</div>
									</div>
								</form> 
							</div>
							</div> 
						
	
							<div>
								<div class="joinBox">
									<h2>아직 회원이 아니신가요?</h2>
									<p>회원이 되시면 게스트델루나 멤버십 회원으로서<br>더 큰 혜택과 편리함을 누릴 수 있습니다.</p>
									<button class="btn btnJoin" onclick="location.href='${root}/member/register.do'" type="submit">회원가입</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	</section>
</form>
<!-- //컨텐츠 영역 -->






<style>
.pd0i{padding: 0px !important;}
p.astBefore{color: #999; font-size: 12px !important; margin-left: 12px;}
p.astBefore::before {content: "*"; left: 66px; position: absolute; top: 163px;}
.fs12p{font-size:12px;}
.fs13p{font-size:13px;}
.fs16p{font-size:16px;}


.tabcontent {
	display: none;
}
.tabcontent.current {
	display: block;
}


</style>
<script type="text/javascript">


function setCookie(cname, cvalue, exdays) {
    console.log("overiding setCookie Pc");
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

/**
 * 레이어 팝업 초기화
	offFlag : 레이어 팝업 기본이벤트 제거 여부 (바탕 눌렀을 때 닫기처리 방지)
	title   : 레이어 팝업 타이틀
	ctxtArr : 레이어 팝업 컨텐츠 TEXT
	tClsArr : 레이어 팝업 컨텐츠 TEXT Class 추가
	**주의** > ctxtArr, tClsArr의 길이는 동일하게 구성
	btnObj  : 레이어 팝업 버튼 정보
 */
function jsInitInfoPop(offFlag, popId, title, ctxtArr, tClsArr, btnObj) {
	//레이어 팝업 기본이벤트 제거
	if (offFlag) {
		$(document).off('click','.btnPopClose, .layerPopWrap .bg');
	//레이어 팝업 기본이벤트 복원
	} else {
		$(document).on('click','.btnPopClose, .layerPopWrap .bg', function(){
			return jsLayerEventDefault(this);
		});
	}
	
	//레이어 팝업 닫기 버튼 이벤트 설정
	$(document).on('click','.btnPopClose',function(){
		return jsLayerEventDefault(this);
	});
	
	//레이어 타이틀 지정
	$(popId).find(".layerTitleText").text(title);
	
	//레이어 컨텐츠 초기화
	$(popId).find("div.loginBox").find("p.pb15i").remove();
	//레이어 컨텐츠 지정
	for (var i = ctxtArr.length - 1; i >= 0; i--) {
		//컨텐츠 기본 클래스
		var clsDef = "pb15i";
		//클래스 지정시 지정 클래스 추가
		if (!isNullOrEmpty(tClsArr[i])) {
			clsDef = clsDef + " " + tClsArr[i];
		}
		$(popId).find("div.loginBox").prepend($("<p>").addClass(clsDef).html(ctxtArr[i]));
	}
	
	//버튼 정보 설정
	if (!isNullOrEmpty(btnObj)) {
		//버튼 갯수 확인
		var btnTrId = btnObj.btnTrId;
		$(popId).find("tr.btnAreaTr").empty();
		$(popId).find("tr.btnAreaTr").append($(btnTrId).html())
		
		if ($(popId).find(".LayerbtnLeft").length > 0) {
			//레이어 좌측 버튼 설정(버튼명, 이벤트)
			$(popId).find(".LayerbtnLeft").text(btnObj.leftBtnNm);
			$(popId).find(".LayerbtnLeft").closest("a").attr("onclick", btnObj.leftBtnAct);
			
			//레이어 팝업 닫기 버튼 이벤트 재설정
			if (toNotNull(btnObj.btnUnionYn) == "Y") {
				$(document).off('click','.btnPopClose');
				$(document).on ('click','.btnPopClose', function(){
					jsLayerEventDefault(this);
					//현재 활성화되고 클릭된 레이어 팝업이 알림 팝업일 경우만 이벤트 설정
					if ($(this).closest(popId).length > 0) {
						$(popId).find(".LayerbtnLeft").click();
					}
					return false;
				});
			}
		}
		
		if ($(popId).find(".LayerbtnRight").length > 0) {
			//레이어 우측 버튼 설정(버튼명, 이벤트)
			$(popId).find(".LayerbtnRight").text(btnObj.rightBtnNm);
			$(popId).find(".LayerbtnRight").closest("a").attr("onclick", btnObj.rightBtnAct);
		}
	}
}

//레이어 팝업 기본 이벤트, ui.js > function layerPopClose()
function jsLayerEventDefault(obj) {
	$(obj).closest('.layerPopWrap').removeClass('on');
	$('body').removeClass('hidden');
	return false;
}
</script>



<div class="layerPopWrap" id="SLEEP_USER">
	<div class="bg"></div>
	<div class="layerPopCont">
		<div class="loginWrap">
			<h1 class="pt15i pb15i">
				<span class="layerTitleText fw500">계정 휴면해제 안내</span> 
			</h1>
			<div class="loginBox"><p class="pb15i pd0i">{0} 님의 휴면 상태가 해제되었습니다.</p><p class="pb15i">휴면 회원이 해제됨에 따라 기존 이용하셨던 서비스를 동일하게 이용할 수 있습니다.</p><p class="pb15i">파라다이스시티 홈페이지 또는 리조트 내에서의 1년 이상 활동(거래) 이력이 없는 경우, 휴면 회원으로 전환됩니다. </p>
				<div class="termTxt pb15i">
					<table class="bdNone">
						<tbody>
							<tr class="btnAreaTr bdNone">
			<td colspan="2" class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull" onclick="javascript:jsLoginOk();">
					<span class="LayerbtnLeft">확인</span>
				</a>
			</td>
		</tr> 
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<a href="javascript:void(0);" class="layerPopClose btnPopClose"></a>
	</div>
</div>



<table style="display:none;">
	<tbody>
		<tr id="btnOneTr">
			<td colspan="2" class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull">
					<span class="LayerbtnLeft"></span>
				</a>
			</td>
		</tr>
	</tbody>
</table>

<table style="display:none;">
	<tbody>
		<tr id="btnTwoTr">
			<td class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull">
					<span class="LayerbtnLeft"></span>
				</a>
			</td>
			<td class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull">
					<span class="LayerbtnRight"></span>
				</a>
			</td>
		</tr>
	</tbody>
</table>




<!-- 
device : 
language : KO
geo : KO
-->



	
</body></html>