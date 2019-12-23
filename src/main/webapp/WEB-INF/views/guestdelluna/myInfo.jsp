<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	/*background-color: rgb(0, 0, 0); 
	background-color: rgba(0, 0, 0, 0.4);
	*/
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	/* background-color: #fefefe; */
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.clickable {
	cursor: pointer;
}

.hover {
	text-decoration: underline;
}

.odd {
	background: #FFC;
}

.even {
	background: #FF9;
}

.active {
	width: 10px;
	height: 10px;
	background: #f60;
	color: white;
}
</style>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.houseList {
		overflow: hidden;
	}
	.houseDiv {
		float: left;
	}
	.houseImg {
		width: 250px;
		height: 160px;
		overflow: hidden;
	}
	
	
	.reviewDiv{
		overflow: hidden;
		width: 600px;
		margin-top: 20px;
	}
	.reviewL {
		float:left;
	}
	.reviewMemberImg {
		width: 48px;
		height: 48px;
		border-radius: 25px;
		overflow: hidden;
	}
	.reviewR {
		float:right;
	}
	.reviewHouseImg {
		width: 50px;
		height: 40px;
		overflow: hidden;
	}
</style>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myInfo.js"></script>
	<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/scroll.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myReview.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/jsForMember.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/mypaylist.js"></script>
</head>
</head>

<body onload="rootPage('${root}')">
	<button id="opener">알림종그림이라는 뜻</button>
	<div id="dialog" title="메시지 확인">
		<script type="text/javascript">
			$(function(root) {
<body>

	<c:set var="cntMsg" value="${cntMsg}" />
	<c:set var="msgDto" value="${msgDto}" />



	<div>알람개수 : ${cntMsg}</div>
	<button id="msgBtn">알림종모양그림</button>

	<!-- The Modal -->
	<div id="myInfoModal" class="infoModal" style="display: none;">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="closeModalInfo">&times;</span> <a
				href="${root}/guestdelluna/myInfo.do">프로필</a>
			<div onclick="deleteAllMsg('${root}')">모두삭제</div>

			<c:forEach varStatus="status" items="${allMsgDto}" var="allMsgDto">

				<div onclick="readMsg('${root}','${allMsgDto.msgCode}')">${allMsgDto.msgContent}</div>
				<div>수신여부 : ${allMsgDto.msgCheck}</div>
				<div onclick="deleteMsg('${root}','${allMsgDto.msgCode}')">삭제</div>

			</c:forEach>

		</div>

	</div>

	<script type="text/javascript">
	
	// Get the modal
	var modal = document.getElementById("myInfoModal");

	// Get the button that opens the modal
	var btn = document.getElementById("msgBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("closeModalInfo")[0];

	// When the user clicks the button, open the modal 
	msgBtn.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
		
		function deleteAllMsg(root){
			
			var url = root + "/guestdelluna/msgAllDelete.do";
			var params = "";
			
			sendRequest("GET", url, callBackFromServer, params);
		}
		
		function callBackFromServer() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				alert("메시지가 삭제 됐습니다");
				setTimeout("location.reload()");
			}
		}
		
		function deleteMsg(root,msgCode){
			var url = root + "/guestdelluna/msgDelete.do";
			var params = "msgCode="+msgCode;
			
			sendRequest("GET", url, callBackFromServer, params);
		}
		
		function readMsg(root,msgCode){
			//읽음으로 상태변경
			var url = root + "/guestdelluna/msgUpdate.do";
			var params = "msgCode="+msgCode;
			
			sendRequest("POST", url, updateCallBackFromServer, params);
		}
		
		function updateCallBackFromServer(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var modal = document.getElementById("myModal");
				modal.style.display = "none";
				window.scrollBy(900,900);
			}
		}
	</script>

	<div>내정보입니다</div>

	<div>
		<div>
			사아아아아아아아아아ㅏㅇ진
			<%-- <img alt="img loading" src="<spring:url value='/profileImg/파일명' />" /> --%>
		</div>
		<div>${memberDto.memberInfo}</div>
	</div>
	<br />
	<a href="${root}/guestdelluna/myInfo.do">내정보</a>
	<div onclick="updateScroll()">회원수정</div>
	<div onclick="deleteScroll()">회원탈퇴</div>
	<div onclick="pointScroll()">포인트관리</div>
	<div onclick="payScroll()">결제내역</div>
	<div onclick="reviewScroll()">내가쓴후기</div>
	<br />
	<br />
	<strong><h1>내가쓴후기</h1></strong>
	<br />

	<script type="text/javascript">
		function updateScroll(){
			window.scrollBy(0,500);
		}
		
		function deleteScroll(){
			window.scrollBy(0,1000);
		}
		
		function pointScroll(){
			window.scrollBy(0,1300);
		}
		
		function payScroll(){
			window.scrollBy(0,1600);
		}
		
		function reviewScroll(){
			window.scrollBy(0,1000);
		}
		
	</script>
	<br />
	<div>체험후기</div>
	<br />
	<div id="fragment-1">

		<c:forEach var="expReview" items="${expReview}" varStatus="status">
			<input type="hidden" name="expReview" value="${expReview}" />
			<input type="hidden" name="countExpReview" value="${countExpReview}" />

			<input type="hidden" class="expSeq" value="${status.count }" />

			<div>번호</div>
			<div class="seqRes">${status.count}</div>
			<div>
				<a href="#">체험 메인사진으로 체험 링크걸어줌</a>
			</div>

			<div>작성 날짜</div>
			<div>
				<fmt:formatDate value="${expReview.revDate}" pattern="yyyy-MM-dd" />
			</div>

			<div>체험 후기내용</div>
			<textarea rows="5" cols="40" name="revContent">${expReview.revContent}</textarea>

			<div>내가준평점</div>
			<div>${expReview.revRate}</div>

			<div>

				<button
					onclick="javscript:focusExpReview('${root}','${expReview.exReserveCode}')"
					class="myBtn${status.count }">수정</button>

				<button
					onclick="javascript:delExpRev('${root}','${expReview.exReserveCode}')">체험
					후기 삭제</button>

				<input type="hidden" name="exReserveCode"
					value=${expReview.exReserveCode } />
			</div>

			<div id="myExpModal" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<span class="close${status.count }"
						onclick="closeModal('${root}','${expReview.exReserveCode}', '${status.count}')">&times;</span>
					<p>후기를입력하세요</p>
					<p>
						<textarea rows="5" cols="40" class="expRevContent"></textarea>
					</p>
					<button
						onclick="expUpdateOk('${root}','${expReview.exReserveCode}'.'${status.count}')">수정완료</button>
				</div>

			</div>
		</c:forEach>
 
	<script type="text/javascript">
	
	$(".seqRes").click(function(){

		var no = $(this).find("td:first").text();

		location = "guestdelluna/myInfo.do?no="+no		// 글번호를 전달한다.

				+"&page=${cri.page}"	// 페이지 전달.

				+"&perPageNum=${cri.perPageNum}"  // 한 페이지에 몇 개를 출력할지 결정.

				+"&searchType=${cri.searchType}"  // 서치 타입을 결정

				+"&keyword=${cri.keyword}";  // 키워드 설정

	});
	
	</script>

	</div>
	<br />
	<div>게스트하우스 후기</div>
	<br />
	<div id="fragment-2">
		
			<c:forEach var="houseReview" items="${houseReview}"
				varStatus="status">
				<div>번호</div>
				<div class="seqRes">${status.count}</div>

				<div>사용 장소</div>
				<div>
					<a href="#">게스트하우스 링크</a>
				</div>

				<div>작성 날짜</div>
				<div>
					<fmt:formatDate value="${houseReview.revDate}" pattern="yyyy-MM-dd" />
				</div>

				<div>후기 내용</div>
				<textarea rows="5" cols="40" name="revContent">${houseReview.revContent}</textarea>
	
				<div>내가준평점</div>
			<div>${houseReview.revRate}</div>

			<div>

				<button
					onclick="javscript:focusHouseReview('${root}','${houseReview.reserveCode}','${status.count}')"
					class="myBtn${status.count }">수정</button>

				<button
					onclick="javascript:delHouseRev('${root}','${houseReview.reserveCode}')">게스트하우스
					후기 삭제</button>

				<input type="hidden" name="reserveCode"
					value=${houseReview.reserveCode } />
			</div>

			<div id="myHouseModal" class="housemodal">

				<!-- Modal content -->
				<div class="modal-houseContent" style="display: none;">
					<span class="closeHouse${status.count }"
						onclick="closeHouseModal('${root}','${houseReview.reserveCode}', '${status.count}')">&times;</span>
					<p>후기를입력하세요</p>
					<p>
						<textarea rows="5" cols="40" class="expRevContent"></textarea>
					</p>
					<button
						onclick="houseUpdateOk('${root}','${houseReview.reserveCode}')">수정완료</button>
				</div>

			</div>
			</c:forEach>
		</div>
	
	<br />
	<strong><h1>회원수정</h1></strong>

	<form action="${root}/guestdelluna/memberUpdateOk.do" method="post"
		onsubmit="return registerForm(this)" name="createForm"
		enctype="multipart/form-data">

		<input type="hidden" name="memberCode" value="${memberDto.memberCode}" />
		
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
			<input type="text" name="email" />
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
	<br />
	<strong><h1>회원탈퇴</h1></strong>
	<div>최종 탈퇴 전 비밀번호를 입력하세요</div>

	<div>이메일</div>
	<div>
		<input type="email" value="${email}" disabled="disabled" /> <input
			type="hidden" value="${email}" id="email" />
	</div>

	<div>비밀번호</div>
	<div>
		<input type="password" class="password" />
	</div>

	
	<c:if test="${memberLevel == 'Host'}">
		<h3>host의 숙소</h3>
		<div class="houseList">
		<c:forEach var="hostHouseList" items="${hostHouseList}">
			<div class="houseDiv">
				<div class="houseImg">
					<img alt="img loading" src="<spring:url value='/image/${hostHouseList.mainImgName}' />"/>
				</div>
				<span class="houseRate">
				<c:if test="${hostHouseList.revRate==1}">
			    	<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==2}">
					<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==3}">
					<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==4}">
					<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostHouseList.revRate==5}">
					<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
				</c:if>
				</span>
				<span>( ${hostHouseList.reviewCount} )</span>
				<span>${hostHouseList.houseName}</span>
			</div>		
		</c:forEach>
		</div>
		
		<h3>host의 체험</h3>
		<div class="houseList">
		<c:forEach var="hostExList" items="${hostExList}">
			<div class="houseDiv">
				<div class="houseImg">
					<img alt="img loading" src="<spring:url value='/ex/${hostExList.mainImgName}' />"/>
				</div>
				<span class="houseRate">
				<c:if test="${hostExList.revRate==1}">
			    	<img src="${root}/resources/css/review/star1.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==2}">
					<img src="${root}/resources/css/review/star2.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==3}">
					<img src="${root}/resources/css/review/star3.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==4}">
					<img src="${root}/resources/css/review/star4.PNG" style="width: 50px;">
				</c:if>
				<c:if test="${hostExList.revRate==5}">
					<img src="${root}/resources/css/review/star5.PNG" style="width: 50px;">
				</c:if>
				</span>
				<span>( ${hostExList.reviewCount} )</span>
				<span>${hostExList.exName}</span>
			</div>		
		</c:forEach>
		</div>
		
<%-- 		<div>
			<h3>숙소후기</h3>
			<c:forEach var="houseReviewList" items="${houseReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${houseReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span>${houseReviewList.revContent}</span>
					<div  class="reviewMemberImg">
						<img alt="img loading" src="<spring:url value='/profileImg/${houseReviewList.memberImgName}' />"/>
					</div>
					<span>${houseReviewList.memberName}</span>
				</div>
				<div class="reviewR">
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/image/${houseReviewList.mainImgName}' />"/>
					</div>
					<span>${houseReviewList.houseName}</span>
				</div>
			</div>
			</c:forEach>
		</div>
		
		<div>
			<h3>체험후기</h3>
			<c:forEach var="exReviewList" items="${exReviewList}">
			<div class="reviewDiv">
				<div class="reviewL">
					<p>
					<fmt:formatDate value="${exReviewList.revDate}" pattern="yyyy-MM-dd"/>
					</p>
					<span>${exReviewList.revContent}</span>
					<div  class="reviewMemberImg">
						<img alt="img loading" src="<spring:url value='/profileImg/${exReviewList.memberImgName}' />"/>
					</div>
					<span>${exReviewList.memberName}</span>
				</div>
				<div class="reviewR">
					<div class="reviewHouseImg">
						<img alt="img loading" src="<spring:url value='/ex/${exReviewList.mainImgName}' />"/>
					</div>
					<span>${exReviewList.exName}</span>
				</div>
			</div>
			</c:forEach>
		</div> --%>
	</c:if>
	
	<button type="button" id="houseBtn" selected="selected">숙소</button>
	<button type="button" id="exBtn">체험</button>
	<div id="scrollView">
	ㅎㅇㅎㅇ
	</div>
	
	<script>
		$("#dialog").dialog({


	<div>다음 문자를 그대로 입력해주세요</div>
	<div>게스트 델루나를 탈퇴합니다</div>
	<input type="text" class="deleteMsg" placeholder="게스트 델루나를 탈퇴합니다">
	<br>

	<input type="submit" value="탈퇴"
		onclick="deleteCheck('${root}','${email}')" />
	<input type="reset" value="탈퇴취소" />
	<br />
	<strong><h1>포인트관리</h1></strong>
	<div id="tabs">
		<ul>
			<li><a href="#fragment-1"><span>포인트 적립 내역</span></a></li>
			<li><a href="#fragment-2"><span>포인트 사용 내역</span></a></li>

		</ul>
		<div id="fragment-1">
			<div>
				<c:forEach var="accuPoint" items="${accuPoint}" varStatus="status">
					<div>번호</div>
					<div class="seqRes">${status.count}</div>

					<div>적립 장소</div>
					<div>
						<a href="#">${accuPoint.accuPlace}</a>
					</div>

					<div>적립 날짜</div>
					<div>
						<fmt:formatDate value="${accuPoint.accuDate}" pattern="yyyy-MM-dd" />
					</div>

					<div>적립포인트</div>
					<div>${accuPoint.accuPoint}</div>
				</c:forEach>
			</div>
		</div>

		<div id="fragment-2">
			<div>
				<c:forEach var="usePoint" items="${usePoint}" varStatus="status">
					<div>번호</div>
					<div class="seqRes">${status.count}</div>

					<div>사용 장소</div>
					<div>
						<a href="#">${usePoint.usePlace}</a>
					</div>

					<div>사용 날짜</div>
					<div>
						<fmt:formatDate value="${usePoint.useDate}" pattern="yyyy-MM-dd" />
					</div>

					<div>사용포인트</div>
					<div>${usePoint.usePoint}</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<br />
	<strong><h1>결제내역</h1></strong>

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear">
		<fmt:formatDate value="${now}" pattern="yyyy-mm-dd" />
	</c:set>

	<div id="tabs2">
		<ul>
			<li><a href="#fragment-3"><span>체험 결제리스트</span></a></li>
			<li><a href="#fragment-4"><span>게스트하우스 결제리스트</span></a></li>
		</ul>

		<div id="fragment-3">

			<table border="1">
				<tr>
					<td>
						<div>
							<input type="checkBox" name="allCheck" id="allCheck" />모두선택
						</div>
					</td>
				</tr>
			</table>

			<c:forEach var="exList" items="${expList}" varStatus="status">

				<table border="1">
					<tr>
						<td><input type="checkbox" name="expCheck" class="expCheck"
							value="${exList.exReserveCode}" /></td>
						<td>
							<div>번호</div>
							<div class="seqRes">${status.count}</div>
						</td>
					</tr>
					<input type="hidden" name="exReserveCode"
						value="${exList.exReserveCode}" />
				</table>

			</c:forEach>

			<c:forEach var="exName" items="${expName}" varStatus="status">
				<table border="1">
					<tr>
						<td>
							<div>체험이름</div>
							<div>
								<a href="#">${exName}</a>
							</div>
						</td>
					</tr>
				</table>
			</c:forEach>

			<c:forEach var="exList" items="${expList}" varStatus="status">
				<table border="1">
					<tr>
						<td>
							<div>체험 날짜</div>
							<div>
								<fmt:formatDate value="${exList.exDate}" pattern="yyyy-MM-dd" />
							</div>
						</td>

						<td>
							<div>예약여부</div>
							<div class="exResState">

								<fmt:formatDate var="startTime" value="${now}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate var="endTime" value="${exList.exDate}"
									pattern="yyyy-MM-dd" />

								<c:if test="${startTime < endTime}">
									<script type="text/javascript">
										var exResState = document
												.getElementsByClassName("exResState");
										exResState['${status.index}'].innerHTML = "예약완료"
									</script>
								</c:if>


								<c:if test="${startTime > endTime}">
									<script type="text/javascript">
										var exResState = document
												.getElementsByClassName("exResState");
										exResState['${status.index}'].innerHTML = "이용완료"
									</script>
								</c:if>

								<c:if test="${startTime == endTime}">
									<script type="text/javascript">
										var exResState = document
												.getElementsByClassName("exResState");
										exResState['${status.index}'].innerHTML = "체험 날짜입니다"
									</script>
								</c:if>
							</div>
						</td>
					</tr>
				</table>

			</c:forEach>

			<button id="opener2">결제 취소</button>
			<div id="dialog2" title="결제 취소 하시겠습니까?"></div>
			<br /> <br /> <br />
		</div>

		<div id="fragment-4">

			<table border="1">
				<tr>
					<td>
						<div>
							<input type="checkBox" name="checkAll" id="checkAll" />모두선택
						</div>
					</td>
				</tr>
			</table>

			<c:forEach var="houseList" items="${houseList}" varStatus="status">

				<table border="1">
					<tr>
						<td><input type="checkbox" name="houseCheck"
							class="houseCheck" value="${houseList.reserveCode}" /></td>
						<td>
							<div>번호</div>
							<div class="seqRes">${status.count}</div>
						</td>
					</tr>

					<input type="hidden" name="houseReserveCode"
						value="${houseList.reserveCode}" />
				</table>

			</c:forEach>

			<c:forEach var="houseName" items="${houseName}">
				<table border="1">
					<tr>
						<td>
							<div>게스트하우스 이름</div>
							<div>
								<a href="#">${houseName}</a>
							</div>
						</td>
					</tr>
				</table>
			</c:forEach>

			<c:forEach var="houseList" items="${houseList}" varStatus="status">
				<table>
					<tr>
						<td>
							<div>체크인날짜</div>
							<div class="resDate">
								<fmt:formatDate value="${houseList.checkIn}"
									pattern="yyyy-MM-dd" />
							</div>
						</td>

						<td>
							<div>체크아웃날짜</div>
							<div class="resDate">
								<fmt:formatDate value="${houseList.checkOut}"
									pattern="yyyy-MM-dd" />
							</div>
						</td>

						<td>
							<div>예약여부</div>
							<div class="houseResState">

								<fmt:formatDate var="startTime" value="${now}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate var="endTime" value="${houseList.checkOut}"
									pattern="yyyy-MM-dd" />

								<c:if test="${startTime < endTime}">
									<script type="text/javascript">
										var houseResState = document
												.getElementsByClassName("houseResState");
										houseResState['${status.index}'].innerHTML = "예약완료"
									</script>
								</c:if>


								<c:if test="${startTime > endTime}">
									<script type="text/javascript">
										var houseResState = document
												.getElementsByClassName("houseResState");
										houseResState['${status.index}'].innerHTML = "이용완료"
									</script>
								</c:if>
							</div>
						</td>
					</tr>
				</table>

			</c:forEach>

			<button id="opener3">결제 취소</button>
			<div id="dialog3" title="결제 취소 하시겠습니까?"></div>
		</div>

		<script type="text/javascript">
		$("#allCheck").click(function() {

			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".expCheck").prop("checked", true);
			} else {
				$(".expCheck").prop("checked", false);
			}

		})

		var expCheck = document.getElementsByClassName("expCheck");
		var exReserveOk = document.getElementsByClassName("exReserveOk");
		var exResState = document.getElementsByClassName("exResState");
		$("#dialog2").dialog({

			autoOpen : false
		});

		$("#opener2").each(function(i, e) {
			$(this).click(function() {
				$("#dialog2").dialog("open");

				$(function(obj) {
					var str = "";
					var cnt = 0;

					$("#dialog2").dialog({

						buttons : [ {
							text : "네",
							click : function(obj) {
								//네를 누르면 div태그의 예약완료가 사라져야함		
								for (i = 0; i < expCheck.length; i++) {
									if (expCheck[i].checked == true) {
										//alert(expCheck.length);

										str += expCheck[i].value + ",";
										++cnt

									}
								}

								//	alert(str)
								deleteExpPayState('${root}', str)

								if (cnt == 0) {
									window.alert("선택된 것이 없습니다.")
									return false
								}
								alert("취소 완료되었습니다");
								setTimeout("location.reload()");
								$(this).dialog("close")
							}
						},

						{
							text : "아니오",
							click : function() {
								$(this).dialog("close")
							}
						} ]
					})
				})
			})
		})
		//--------------------------------------------------------------------------------
		$("#checkAll").click(function() {

			var chk = $("#checkAll").prop("checked");
			if (chk) {
				$(".houseCheck").prop("checked", true);
			} else {
				$(".houseCheck").prop("checked", false);
			}

		})

		var reserveOk = document.getElementsByClassName("reserveOk");
		var houseCheck = document.getElementsByClassName("houseCheck");
		var resDate = document.getElementsByClassName("resDate");
		var houseReserveCode = document.getElementsByName("houseReserveCode");
		$("#dialog3").dialog({
			autoOpen : false
		});

		$("#opener3").each(function(i, e) {
			$(this).click(function() {
				$("#dialog3").dialog("open");

				$(function() {

					var cnt = 0;
					var str = "";

					$("#dialog3").dialog({

						buttons : [ {
							text : "네",
							click : function(obj) {
								//네를 누르면 div태그의 예약완료가 사라져야함		
								for (i = 0; i < houseCheck.length; i++) {
									if (houseCheck[i].checked == true) {

										str += houseCheck[i].value + ",";
										++cnt

									}
								}

								//window.alert(str);		2,3, 이렇게 넘어옴 당연히

								deleteHousePayState('${root}', str);

								if (cnt == 0) {
									window.alert("선택된 것이 없습니다.")
									$(this).dialog("close")
									return false
								}
								alert("취소 완료되었습니다");
								setTimeout("location.reload()");
								$(this).dialog("close")
							}
						},

						{
							text : "아니오",
							click : function() {
								$(this).dialog("close")
							}
						} ]
					})
				})
			})
		})

		$(function() {
				$('#tabs2').tabs();
			});
		</script>

	</div>

	<script type="text/javascript">
		$("#dialog1").dialog({
			autoOpen : false
		});
		$("#opener1").click(function() {
			$("#dialog1").dialog("open");
		});

		
		
		function deleteCheck(root, getEmail) {

			var deleteMsg = document.getElementsByClassName("deleteMsg");

			var str = deleteMsg[0].value;

			var getPassword = document.getElementsByClassName("password");
			var password = getPassword[0].value;

			var getEmail = document.getElementById("email");
			var email = getEmail.value;

			if (str == "게스트 델루나를 탈퇴합니다") {
				location.href = root
						+ "/guestdelluna/memberDeleteOk.do?password="
						+ password + "&email=" + email;
			} else {
				alert("문구 입력을 다시 해주세요");
				return false;
			}

		}

		$(function() {
			$("#tabs").tabs();
		})
	</script>

</body>
</html>