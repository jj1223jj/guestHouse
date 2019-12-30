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

textarea[name=revContent]:disabled {
	background: #F8FBEF
}

* {
	margin: 0;
	padding: 0;
}

html {
	font-size: 16px;
}

#wrap {
	width: 70rem;
	margin: 0 auto;
	overflow: hidden;
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
	width: 20%;
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

/* The Modal (background) */
.houseRevModal {
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
.content-modal {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	/* background-color: #fefefe; */
}

/* The Close Button */
.closeHouseModal {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.closeHouseModal hover, .closeHouseModal:focus {
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
.houseList, .exList {
	overflow: hidden;
}

.houseDiv {
	float: left;
}

.houseImg {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 250px;
	height: 160px;
	overflow: hidden;
}

.houseImg > img {
	width: 250px;
}

.reviewL {
	float: left;
}

.reviewMemberImg {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 48px;
	height: 48px;
	border-radius: 25px;
	overflow: hidden;
}

.reviewMemberImg > img {
	width: 48px;
}

.reviewR {
	float: right;
}

.reviewHouseImg {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 105px;
	height: 65px;
	overflow: hidden;
}
.reviewR > span {
	display: block;
	text-align: center;
	margin-top: 1rem;
}
.reviewHouseImg > img{
	width: 105px;
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
	<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/scroll.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myReview.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/jsForMember.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/mypaylist.js"></script>
</head>

<body onload="rootPage('${root}', '${memberLevel}')">
<div id="wrap" style="margin-top: 5rem;">
	<div class="menuL">
	<button id="opener">알림종그림이라는 뜻</button>
	<!-- <div id="dialog" title="메시지 확인"> -->


	<c:set var="cntMsg" value="${cntMsg}" />
	<c:set var="msgDto" value="${msgDto}" />



	<div>알람개수 : ${cntMsg}</div>
	<button id="msgBtn">알림종모양그림</button>

	<!-- The Modal -->
	<div id="myInfoModal" class="infoModal" style="display: none;">

		<!-- Modal content -->
		<div class="modal-content">
		<div style="margin-top: 0px;margin-bottom: 20px ">
			<span style="float: right;" class="closeModalInfo">&times;</span>
		</div>	
		<div>
			<a style="float: left;"  href="${root}/guestdelluna/myInfo.do">프로필</a>
			<span style="float: right; margin-right: 10px;" onclick="deleteAllMsg('${root}')">모두삭제</span>
		</div>
		<div>
			<c:forEach varStatus="status" items="${allMsgDto}" var="allMsgDto">
			<div>
				<span style="margin-right: 20%" onclick="readMsg('${root}','${allMsgDto.msgCode}')" >${allMsgDto.msgContent}</span>
				<span style="float: right; margin-left: 10%; margin-right: 5%;">${allMsgDto.msgCheck}</span>
				<span style="float: right" onclick="deleteMsg('${root}','${allMsgDto.msgCode}')">삭제</span>
			</div>
			</c:forEach>
		</div>
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

		function deleteAllMsg(root) {

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

		function deleteMsg(root, msgCode) {
			var url = root + "/guestdelluna/msgDelete.do";
			var params = "msgCode=" + msgCode;

			sendRequest("GET", url, callBackFromServer, params);
		}

		function readMsg(root, msgCode) {
			//읽음으로 상태변경
			var url = root + "/guestdelluna/msgUpdate.do";
			var params = "msgCode=" + msgCode;

			sendRequest("POST", url, updateCallBackFromServer, params);
		}

		function updateCallBackFromServer() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var modal = document.getElementById("myModal");
				modal.style.display = "none";
				window.scrollBy(900, 900);
			}
		}
	</script>

	<div>내 정보</div>

	<div>
		<div>
			<%-- <img alt="img loading" width="200" height="200"
						src="<spring:url value='/image/${memberDto.memberImgName}'/>">
			 --%>			
		</div>
		<div>${memberDto.memberInfo}</div>
		<div><a href="${root}/guestdelluna/allMyReview.do">내가 쓴 후기</a></div>
	</div>
	<br />
	<a href="${root}/guestdelluna/myInfo.do">내정보</a>
	<a href="${root}/guestdelluna/memberUpdate.do">회원수정</a>
	<a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a>
	<br />
	<a href="${root}/guestdelluna/managePoint.do">포인트관리</a>
	<a href="${root}/guestdelluna/payList.do">결제내역</a>
	<a href="${root}/guestdelluna/allMyReview.do">내가 쓴 후기</a>
	<br />
	<c:if test="${memberLevel == 'Host'}">
	<a href="${root}/host/reservationView.do">숙소예약현황</a>
	<a href="${root}/host/exReservationView.do">체험예약현황</a>
	<a href="${root}/host/salesView.do">매출조회</a>
	<br/>
	<a href="${root}/host/houseManagement.do">게스트하우스 관리</a>
	<a href="${root}/host/exManagement.do">체험 관리</a>
	</c:if>
	</div>

	<div class="menuR">
	
	<div class="infoDiv">
		<div class="infoImg">
			<img alt="img loading" src="<spring:url value='/profileImg/${memberDto.memberImgName}'/>">
		</div>
		<p>안녕하세요. 저는 ${memberDto.memberName}입니다.</p>
		<span>
		회원 가입: 
		<fmt:formatDate value="${memberDto.regDate}" pattern="yyyy"/>
		</span>
		<div class="memberInfo">${memberDto.memberInfo}</div>
	</div>
	
	<c:if test="${memberLevel == 'Host'}">
		<div class="houseList">
		<h3> ${memberDto.memberName}님의 숙소</h3>
			<c:forEach var="hostHouseList" items="${hostHouseList}">
				<div class="houseDiv">
					<div class="houseImg">
						<img alt="img loading"
							src="<spring:url value='/image/${hostHouseList.mainImgName}'/>"/>
					</div>
					<div class="houseRate"> <c:if
							test="${hostHouseList.revRate==1}">
							<img src="${root}/resources/css/review/star1.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostHouseList.revRate==2}">
							<img src="${root}/resources/css/review/star2.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostHouseList.revRate==3}">
							<img src="${root}/resources/css/review/star3.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostHouseList.revRate==4}">
							<img src="${root}/resources/css/review/star4.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostHouseList.revRate==5}">
							<img src="${root}/resources/css/review/star5.PNG"
								style="width: 50px;">
						</c:if>
						 <span>( ${hostHouseList.reviewCount} )</span> 
					</div><div class="houseName">${hostHouseList.houseName}</div>
				</div>
			</c:forEach>
		</div>

		<div class="houseList">
		<h3> ${memberDto.memberName}님의 체험</h3>
			<c:forEach var="hostExList" items="${hostExList}">
				<div class="houseDiv">
					<div class="houseImg">
						<img alt="img loading"
							src="<spring:url value='/ex/${hostExList.mainImgName}' />" />
					</div>
					<div class="houseRate"> <c:if
							test="${hostExList.revRate==1}">
							<img src="${root}/resources/css/review/star1.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostExList.revRate==2}">
							<img src="${root}/resources/css/review/star2.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostExList.revRate==3}">
							<img src="${root}/resources/css/review/star3.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostExList.revRate==4}">
							<img src="${root}/resources/css/review/star4.PNG"
								style="width: 50px;">
						</c:if> <c:if test="${hostExList.revRate==5}">
							<img src="${root}/resources/css/review/star5.PNG"
								style="width: 50px;">
						</c:if>
						<span>( ${hostExList.reviewCount} )</span> 
					</div> <div class="houseName">${hostExList.exName}</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	
		<c:if test="${memberLevel == 'Host'}">
	<div class="reviewWrap">
		<button type="button" id="houseBtn" class="reviewBtn">숙소</button>
		<button type="button" id="exBtn" class="reviewBtn">체험</button>
		<div id="houseReview">
		</div>
		<div id="exReview">
		</div>
		<div id="myHouseReview">
		</div>
		<div id="myExReview">
		</div>
	</div>
	<div class="moreViewDiv"><button class="moreView" type="button" onclick="moreView()"> 후기 더보기</button></div>
  </div>
		</c:if>
  
  </div>
  
  <div style="clear:both;"></div>
</body>
</html>