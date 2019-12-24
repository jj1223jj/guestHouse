<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

textarea[name=revContent]:disabled {
	background: #F8FBEF
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

.reviewDiv {
	overflow: hidden;
	width: 600px;
	margin-top: 20px;
}

.reviewL {
	float: left;
}

.reviewMemberImg {
	width: 48px;
	height: 48px;
	border-radius: 25px;
	overflow: hidden;
}

.reviewR {
	float: right;
}

.reviewHouseImg {
	width: 50px;
	height: 40px;
	overflow: hidden;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myreservelist.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/myReview.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
</head>
<body>
	<div id="tabs">
		<ul>
			<li><a href="#fragment-1"><span>내가 쓴 체험 후기</span></a></li>
			<li><a href="#fragment-2"><span>내가 쓴 게스트하우스 후기</span></a></li>
		</ul>

		<div id="fragment-1">
			<c:forEach var="expReview" items="${myExpreviewList}"
				varStatus="status">
				<input type="hidden" name="expReview" value="${myExpreviewList}" />
				<input type="hidden" name="countExpReview" value="${countExpReview}" />

				<input type="hidden" class="expSeq" value="${status.count }" />

				<div>작성 날짜</div>
				<div>
					<fmt:formatDate value="${expReview.revDate}" pattern="yyyy-MM-dd" />
				</div>

				<div>
					<img alt="img loading" width="200" height="200"
						src="<spring:url value='/image/${expReview.mainImgName}'/>">
				</div>

				<div>${expReview.exName}</div>

				<div>체험 후기내용</div>
				<textarea rows="5" cols="40" name="revContent" disabled="disabled">${expReview.revContent}</textarea>

				<div>
					<button onclick="javascript:focusExpReview('${status.count}')">수정</button>
					&nbsp;
					<button
						onclick="javascript:delExpRev('${root}','${expReview.exReserveCode}')">삭제</button>

					<input type="hidden" name="exReserveCode"
						value=${expReview.exReserveCode } />
				</div>

				<div id="myModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
						<span class="close${status.count }"
							onclick="closeModal('${root}','${status.count}')">&times;</span>
						<p>후기를입력하세요</p>
						<p>
							<textarea rows="5" cols="40" class="expRevContent"></textarea>
						</p>
						<button
							onclick="expUpdateOk('${root}','${expReview.exReserveCode}','${status.count}')">수정완료</button>
					</div>
				</div>
				<br />
			</c:forEach>
		</div>
		<div id="fragment-2">

			<c:forEach var="houseReview" items="${myHousereviewList}"
				varStatus="status">
				<input type="hidden" name="houseReview" value="${myHousereviewList}" />

				<div>작성 날짜</div>
				<div>
					<fmt:formatDate value="${houseReview.revDate}" pattern="yyyy-MM-dd" />
				</div>

				<div>
					<a href="#"> <img alt="img loading" width="200" height="200"
						src="<spring:url value='/profileImg/${houseReview.mainImgName}' />">
					</a>
				</div>

				<div>${houseReview.houseName}</div>

				<div>게스트하우스 후기 내용</div>
				<textarea rows="5" cols="40" name="revContent" disabled="disabled">${houseReview.revContent}</textarea>

				<div>
					<button id="updateModal"
						onclick="focusHouseReview('${status.count}')">수정</button>
					&nbsp;
					<button
						onclick="javascript:delHouseRev('${root}','${houseReview.reserveCode}')">삭제</button>
				</div>
				<div id="houseModal" class="houseRevModal">

					<div class="content-modal">
						<span class="closeHouseModal${status.count }"
							onclick="xButtonHouseModal('${status.count}')">&times;</span>
						<div>후기를 입력하세요</div>
						<textarea rows="8" cols="50" class="houseRevContent"></textarea>

						<button class="upOk"
							onclick="houseUpdateOk('${root}','${houseReview.reserveCode}')">수정완료</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		var upBtn = document.getElementById("updateModal");
		var spanClose = document.getElementsByClassName("closeHouseModal");
		var houseRevModal = document.getElementsByClassName("houseRevModal");

		function focusHouseReview(i) {
			houseRevModal[i - 1].style.display = "block";
		}

		function xButtonHouseModal(i) {
			houseRevModal[i - 1].style.display = "none";
		}

		function houseUpdateOk(root, houseResCode) {

			var houseReview = document.getElementsByName("houseReview");
			var str = "";
			for (var i = 0; i < houseReview.length; i++) {
				var houseRevContent = document
						.getElementsByClassName("houseRevContent");

				if (houseRevContent[i].value != "") {
					str = houseRevContent[i].value;
				}

				var url = root + "/guestdelluna/houseReviewUpdateOk.do?";
				var params = "houseUpResCode=" + houseResCode
						+ "&houseRevContent=" + str;
			}
			sendRequest("POST", url, updateCallBack, params);

		}

		$(function() {
			$('#tabs').tabs();
		});
	</script>
</body>
</html>