<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html lang="ko">
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="${root}/resources/css/register/register.css" />
	<link rel="stylesheet"	href="${root}/resources/css/guestdelluna/menuLayout.css">
<script type="text/javascript"
   src="${root}/resources/javascript/guestdelluna/menuLayout.js"></script>
<%-- <script src="${root}/resources/javascript/jquery/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script> --%>
<title>회원 정보 수정</title>
<script type="text/javascript"
	src="${root}/resources/javascript/member/member.js"></script>
</head>
<body>
	<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#emailAA")
									.blur(
											function() {
												var email = document
														.getElementById("emailAA").value;

												var url = "${root}/member/emailCheck.do?";
												var params = "email=" + email;

												$
														.ajax({
															url : url + params,
															method : "get",
															success : function(
																	check) {

																if (check == 1) {
																	$(
																			"#idid #id_check")
																			.text(
																					"이미 존재하는 이메일입니다. 다른 이메일을 사용하시길 바랍니다.");
																	$(
																			"#idid #id_check")
																			.css(
																					"color",
																					"red");
																	$(
																			"#btnSubmit")
																			.attr(
																					"disabled",
																					true);
																} else {
																	$(
																			"#idid #id_check")
																			.text(
																					"사용가능한 이메일입니다.");
																	$(
																			"#idid #id_check")
																			.css(
																					"color",
																					"blue");

																}
															}
														});

											});

							$(".pwd #USER_PWD2")
									.blur(
											function() {
												var pwd = document
														.getElementById("password99").value;
												var pwd2 = document
														.getElementById("USER_PWD2").value;
												//alert(pwd + pwd2);

												if (pwd != pwd2) {
													$(".pwd #pwsame")
															.text(
																	"비밀번호를 잘못 입력하셨습니다.");
													$(".pwd #pwsame").css(
															"color", "red");
													$("#btnSubmit").attr(
															"disabled", true);
												} else {
													//$("#btnSubmit").attr("disabled",false);
												}

											});

							$(".inp #memberName")
									.blur(
											function() {
												var memberName = document
														.getElementById("memberName").value;
												var hName = /^[가-힣]+$/;

												if (memberName == "") {
													alert("이름을 입력해주세요");
													//$('#memberName').focus();
												} else if (!hName
														.test(memberName)) {
													alert("이름을 한글로 정확히 입력하세요.");
													$("#btnSubmit").attr(
															"disabled", true);
													//$('#memberName').focus();
												}
											});
							$(".inp #phone").blur(
									function() {
										var phone = document
												.getElementById("phone").value;
										var pattern = /^[0-9]*$/;

										if (!pattern.test(phone)) {
											alert("휴대폰 번호를 정확히 입력해주세요.");
											$("#btnSubmit").attr("disabled",
													true);
										} else {
											$("#btnSubmit").attr("disabled",
													false);
										}

									});
						});
	</script>


	<div id="wrap" style="margin-top: 3rem;">

		<div class="menuL" style="margin-top: 6.5rem;">
			<ul>
				<li><a href="${root}/guestdelluna/allMyReview.do"
					style="color: black;">후기</a></li>
				<c:if test="${memberCode == memberDto.memberCode}">
					<li><a href="${root}/guestdelluna/memberUpdate.do"
						style="color: black;">회원수정</a></li>
					<li><a href="${root}/guestdelluna/managePoint.do"
						style="color: black;">포인트관리</a></li>
					<li><a href="${root}/guestdelluna/payList.do"
						style="color: black;">결제내역</a></li>
					<c:if test="${memberLevel == 'Host'}">
						<hr style="border: 0.0315rem solid #ddd;" />
						<li><a href="${root}/host/reservationView.do"
							style="color: black;">숙소예약현황</a></li>
						<li><a href="${root}/host/exReservationView.do"
							style="color: black;">체험예약현황</a></li>
						<li><a href="${root}/host/salesView.do" style="color: black;">매출조회</a></li>
						<li><a href="${root}/host/houseManagement.do"
							style="color: black;">게스트하우스 관리</a></li>
						<li><a href="${root}/host/exManagement.do"
							style="color: black;">체험 관리</a></li>
					</c:if>
					<li><a href="${root}/guestdelluna/memberDelete.do"
						style="color: black;">회원탈퇴</a></li>
				</c:if>
			</ul>
		</div>

		<div class="menuR" style="margin-left: -10rem; margin-top: 5rem;">

			<form action="${root}/guestdelluna/memberUpdateOk.do" method="post"
				name="createForm" class="form-horiaontal" style="margin-left: -14rem;"
				enctype="multipart/form-data">

				<section id="container">
					<div class="control-group"
						style="width: 70rem; /*  border: 1px solid red; */ margin: 2rem auto; height: 90rem;">
						<div class="innerBox">
							<!-- 가로값이 1280으로 설정되어진 아이 -->
							<h5 style="text-align: center; font-size: 1.5rem; color: #484848;">회원 수정</h5>
						</div>

						<input type="hidden" value="${memberDto.email}" name="email">

						<div class="fullBg">
							<div class="innerBox formJoinWrap"
								style="margin: 0 auto; height: 31rem;">
								<!-- 아이디 및 비밀번호 -->
								<div class="form-group"
									style="margin: 0 auto; /* border: 0.1rem solid blue; */ height: 29rem;">
									<dt>
										<label for="userName"
											style="width: 45rem; height: 3rem; background-color: #edf6f6; margin-left: 13rem; margin-top: 3rem; margin-bottom: 1rem; line-height: 3rem; margin-bottom: 3rem; padding-left: 1rem;">아이디
											및 비밀번호</label>
									</dt>
									<dl class="id">
										<dt>
											<label for="USER_ID" style="margin-left: 20rem;">아이디
												(이메일) </label>
										</dt>
										<dd id="idid">
											<div class="inp">
												<input class="form-control email" type="email" id="emailAA"
													name="email" value="${memberDto.email}" disabled="disabled"
													required maxlength="200" placeholder="jeju@stay.com"
													title="아이디" style="margin-left: 20rem;">
												<%-- <button class="btn btn-secondary emailBtn"  type="button" value="중복확인" data-target="#emailModal" data-toggle="modal" style="position: relative; width: 5.188rem; width: 10rem; margin-left: 0.5rem;" onclick="toServer('${root}')">중복확인</button> --%>
											</div>
											<br /> <br />
											<div>
												<div id="id_check" style="margin-left: 20rem;"></div>
											</div>
										</dd>
									</dl>

									<dl class="pwd">
										<dt>
											<label for="USER_PWD1" style="margin-left: 20rem;">비밀번호
											</label>
										</dt>
										<!-- 에러시 dd의 error 클래스 추가 -->
										<dd style="">
											<div class="inp">
												<input class="form-control" style="margin-left: 20rem;"
													type="password" id="password99" name="password" required
													maxlength="16" title="비밀번호" placeholder="비밀번호를 입력하세요.">

											</div>

										</dd>
									</dl>
									<br /> <br />
									<dl class="pwd" id="passwordChk">
										<dt style="margin-left: 20rem;">
											<label for="USER_PWD2">비밀번호 확인</label>
										</dt>

										<!-- 에러시 dd의 error 클래스 추가 -->
										<dd>
											<div class="inp">
												<input class="form-control" style="margin-left: 20rem;"
													type="password" id="USER_PWD2" name="USER_PWD2" required
													maxlength="16" title="비밀번호 확인" placeholder="비밀번호를 확인하세요.">
											</div>
											<br /> <br />
											<div>
												<div id="pwsame" style="margin-left: 20rem;"></div>
											</div>

										</dd>
									</dl>
								</div>
								<!-- //아이디 및 비밀번호 -->
								<div
									style="width: 46rem; height: 0.1rem; border-bottom: 0.01rem solid #c6c6c6; margin-top: 3rem; margin-left: 12rem;"
									align="center"></div>

								<br /> <br />
								<!-- 기본정보 -->
								<div class="form-group">
									<dt>
										<br /> <label for="userInfo"
											style="width: 45rem; height: 3rem; background-color: #edf6f6; margin-left: 13rem; margin-top: 0.5rem; margin-bottom: 3rem; line-height: 3rem; padding-left: 1rem;">기본
											정보</label>
									</dt>


									<div class="left">
										<dl class="nameType1">
											<dt>
												<label for="USER_NM" style="margin-left: 20rem;">이름(한글)
												</label>
											</dt>
											<!-- 에러시 dd의 error 클래스 추가 -->
											<dd>
												<div class="ui-select-wrapper">
													<div class="inp">
														<input class="form-control" type="text" id="memberName"
															name="memberName" required maxlength="14" title="이름(한글)"
															style="width: 30rem; margin-left: 20rem;">

													</div>
												</div>
											</dd>
										</dl>
									</div>
									<br />
									<div class="right">
										<dl class="phone">
											<dt>
												<label for="Phone"
													style="margin-left: 20rem; margin-top: 2rem;">휴대폰
													번호 </label>
											</dt>
											<dd>
												<div class="inp">
													<input class="form-control" type="tel" id="phone"
														name="phone" value="" required maxlength="11"
														placeholder="" title="휴대 전화 번호"
														style="width: 30rem; margin-left: 20rem;">
												</div>
											</dd>
										</dl>
									</div>
									<br /> <br />
									<div class="form-group">
										<label for="InputSubject1"
											style="margin-left: 20rem; font-weight: 700; font-family: -apple-system, BlinkMacSystemFont;">
											회원 이미지</label> <input id="fileInput" filestyle="" type="file"
											name="file" data-class-button="btn btn-default"
											data-class-input="form-control" data-button-text=""
											data-icon-name="fa fa-upload" class="form-control"
											tabindex="-1"
											style="position: absolute; clip: rect(0px, 0px, 0px, 0px);" accept="image/*">

										<div class="bootstrap-filestyle input-group"
											style="margin-left: 20rem; width: 32.5rem">

											<input type="text" id="userfile" class="form-control"
												name="file" style="background-color: #ffffff"> <span
												class="group-span-filestyle input-group-btn" tabindex="0">

												<label for="fileInput" class="btn btn-default "> <span
													class="glyphicon fa fa-upload"></span>
											</label>
											</span>
										</div>
									</div>
									<div>
										<dl class="memInfo" style="margin-top: -2rem">
											<dt>
												<label style="margin-left: 20rem; margin-top: 2rem;">회원
													정보 </label>
											</dt>
											<dd>
												<div class="inp">
													<textarea class="form-control" style="margin-left: 20rem;"
														rows="6" cols="65" name="memberInfo"></textarea>
												</div>
											</dd>
										</dl>
									</div>
									<script type="text/javascript">
										$(document)
												.ready(
														function() {

															$("#fileInput")
																	.on(
																			'change',
																			function() { // 값이 변경되면

																				if (window.FileReader) { // modern browser

																					var filename = $(this)[0].files[0].name;

																				} else { // old IE

																					var filename = $(
																							this)
																							.val()
																							.split(
																									'/')
																							.pop()
																							.split(
																									'\\')
																							.pop(); // 파일명만 추출

																				}

																				// 추출한 파일명 삽입

																				$(
																						"#userfile")
																						.val(
																								filename);

																			});

														});
									</script>
								</div>
							</div>
							<br /> <br />
						</div>
						<br />
						<br /> <br />
						<div class="btn"
							style="margin-top: 5rem; margin-bottom: 5rem; /* border: 0.1rem solid green; */ width: 50rem; padding-left: 20rem;">
							<!-- 비활성화 시  disabled="disabled" 추가 -->
							<button class="btn btn-success" type="submit" id="btnSubmit">확인</button>
							<button class="btn btn-light" type="submit" id="btnPwd"
								style="margin-left: 1rem;">취소</button>
						</div>



					</div>

				</section>


			</form>
		</div>
		</div>
			<!-- //컨텐츠 영역 -->

			<!-- 모달페이지 -->
			<div class="modal fade" id="emailModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="${root}/admin/memberUpdateOk.do" method="post"
							onsubmit="return boardForm(this)" name="createForm">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">아이디 중복확인</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="form-group">

								<div align="center" height="20" width="125">
									<p align="center" height="20" width="125">아이디(email)</p>
									<input type="text" class="form-control" id="usedEmail"
										style="width: 10rem;" name="email" />
								</div>

								<div id="container" class="container" align="center"
									style="width: 20rem; height: 5rem;"></div>


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

					if (password != "" && passwordChk != ""
							&& password != passwordChk) {

						document.getElementById('pwsame').innerHTML = '비밀번호가 일치하지 않습니다. 다시 입력하세요.';
						/* alert("비밀번호가 일치하지 않습니다." +password +"," + passwordChk);
						$("#USER_PWD2").val("");
						$("#USER_PWD2").focus();
						focusTgt = "#USER_PWD2";*/
						var btn = $('#btnSubmit');
						btn.Attr("disabled", true);
						//btn.css("background-color","pink");   

					} else {
						// 비번 제대로 입력
						var btn = $('#btnSubmit');
						//btn.css("background-color","blue");   
						document.getElementById('pwsame').innerHTML = '';
						if (email != "" && name != "" && id != ""
								&& phone !== "") {
							var btn = $('#btnSubmit');
							btn.removeAttr("disabled");
						}

					}
				}
			</script>
</body>
</html>