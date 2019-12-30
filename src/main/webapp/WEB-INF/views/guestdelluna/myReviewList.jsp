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
<title>내가 쓴 후기</title>
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
	<script>
		// 2.jquery 온로드
		$(function() {
			// 		3.페이징에 필요한 변수들 선언
			var pageBlock = $
			{
				pageBlock
			}
			;
			var result = parseInt('${countExpReview/boardSize}');
			var pageCount = '${countExpReview%boardSize}' == 0 ? result
					: result + 1;
			var currentPage = '${accuCurrentPage}';
			var result2 = parseInt((currentPage - 1) / pageBlock);
			var startPage = result2 * pageBlock + 1;
			var endPage = startPage + pageBlock - 1;

			// 		4. function setPaging, pageClick 함수를 선언
			//		5. 페이지숫자를 담을 div,ul 선언
			setPaging(pageBlock, result, pageCount, currentPage, result2,
					startPage, endPage);
			pageClick(pageBlock, result, pageCount, currentPage, result2,
					startPage, endPage);

		});
		//4-2 pageClic함수
		function pageClick(pageBlock, result, pageCount, currentPage, result2,
				startPage, endPage) {

			$(".pagination li[class!='page-item active']")
					.click(
							function() {
								var liClass = $(this).attr("class");
								var accuPageNumber = 0;
								if (liClass == 'page-item')
									accuPageNumber = $(this).children().text();
								else if (liClass == 'page-item expRevFirstPage')
									accuPageNumber = 1;
								else if (liClass == 'page-item expRevBeforePage')
									accuPageNumber = startPage - pageBlock;
								else if (liClass == 'page-item expRevNextPage')
									accuPageNumber = startPage + pageBlock;
								else if (liClass == 'page-item expRevEndPage')
									accuPageNumber = pageCount;
								// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
								// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
								$
										.ajax({
											url : "${root}/guestdelluna/revExpAjax.do?accuPageNumber="
													+ accuPageNumber,
											method : "get",
											//8. 서비스imp에서 ajax로 받을 데이터를 json으로 만들어주기
											//9. PrintWriter로 json형식 데이터를 넘겨주기
											success : function(d) {
												//10. [{"":""},{"":""},{"":""}] 친구를 JSON.parse하기
												var list = JSON.parse(d);

												//alert(list.length);
												//console.log(list);
												var tr = $(".pointInfo tr");
												tr.remove();
												var tbody = $(".pointInfo");
												for (var i = 0; i < list.length; i++) {
													var date = new Date(
															list[i].revDate);
													var dateString = date
															.getFullYear()
															+ "-"
															+ date.getMonth()
															+ "-"
															+ date.getDate();
													tbody
															.append('	<tr>'
																	+ '		<td>'
																	+ ((accuPageNumber - 1)
																			* '${boardSize}' + (i + 1))
																	+ '</td>'
																	+ '		<td>'
																	+ list[i].exName
																	+ '</td>'
																	+ '		<td>'
																	+ dateString
																	+ '</td>'
																	+ '		<td>'
																	+ "삭제"
																	+ '</td>'
																	+ '	</tr>');
												}
												currentPage = accuPageNumber;
												result2 = parseInt((currentPage - 1)
														/ pageBlock);
												startPage = result2 * pageBlock
														+ 1;
												endPage = startPage + pageBlock
														- 1;
												setPaging(pageBlock, result,
														pageCount, currentPage,
														result2, startPage,
														endPage);
												pageClick(pageBlock, result,
														pageCount, currentPage,
														result2, startPage,
														endPage);
											},
											error : function(a, b, c) {
												console.log(a);
												alert(b);
												alert(c);
											}
										});
							});

		}
		//4.setPaging 함수
		function setPaging(pageBlock, result, pageCount, currentPage, result2,
				startPage, endPage) {

			$(".pagination").children().remove();

			//alert("pageBlock: "+pageBlock+", result:"+result+", pageCount: "+pageCount+",\n result2: "+result2+", startPage: "+startPage+", endPage: "+endPage+", currentPage: "+currentPage);
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			if (startPage > 1) {
				$(".pagination")
						.append(
								'<li class="page-item expZzimFirstPage"><a class="page-link">[처음]</a></li>'
										+ '<li class="page-item expZzimBeforePage"><a class="page-link">[이전]</a></li>');
			}
			for (var i = startPage; i <= endPage; i++) {
				if (i == currentPage) {
					$(".pagination").append(
							'<li class="page-item active"><a class="page-link">'
									+ i + '</a></li>');
				} else {
					$(".pagination").append(
							'<li class="page-item"><a class="page-link">' + i
									+ '</a></li>');
				}
			}
			if (endPage < pageCount) {
				$(".pagination")
						.append(
								'<li class="page-item expZzimNextPage"><a class="page-link">[다음]</a></li>'
										+ '<li class="page-item expZzimEndPage"><a class="page-link">[끝]</a></li>');
			}
		}
	</script>

	<script>
		// 2.jquery 온로드
		$(function() {

			// 		3.페이징에 필요한 변수들 선언
			var pageBlock = $
			{
				pageBlock
			}
			;
			var useResult = parseInt('${countHouseZzim/boardSize}');
			var usePageCount = '${countHouseZzim%boardSize}' == 0 ? useResult
					: useResult + 1;
			var useCurrentPage = '${useCurrentPage}';
			var useResult2 = parseInt((useCurrentPage - 1) / pageBlock);
			var useStartPage = useResult2 * pageBlock + 1;
			var useEndPage = useStartPage + pageBlock - 1;

			// 		4. function setPaging, pageClick 함수를 선언
			//		5. 페이지숫자를 담을 div,ul 선언
			useSetPaging(pageBlock, useResult, usePageCount, useCurrentPage,
					useResult2, useStartPage, useEndPage);
			usePageClick(pageBlock, useResult, usePageCount, useCurrentPage,
					useResult2, useStartPage, useEndPage);

		});
		//4-2 pageClic함수
		function usePageClick(pageBlock, useResult, usePageCount,
				useCurrentPage, useResult2, useStartPage, useEndPage) {

			$(".pagination li[class!='page-item active']")
					.click(
							function() {
								var liClass = $(this).attr("class");
								var usePageNumber = 0;
								if (liClass == 'page-item')
									usePageNumber = $(this).children().text();
								else if (liClass == 'page-item houseZzimFirstPage')
									usePageNumber = 1;
								else if (liClass == 'page-item houseZzimBeforePage')
									usePageNumber = useStartPage - pageBlock;
								else if (liClass == 'page-item houseZzimNextPage')
									usePageNumber = useStartPage + pageBlock;
								else if (liClass == 'page-item houseZzimEndPage')
									usePageNumber = usePageCount;
								// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
								// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
								$
										.ajax({
											url : "${root}/guestdelluna/zzimHouseAjax.do?usePageNumber="
													+ usePageNumber,
											method : "get",
											//8. 서비스imp에서 ajax로 받을 데이터를 json으로 만들어주기
											//9. PrintWriter로 json형식 데이터를 넘겨주기
											success : function(d) {
												//10. [{"":""},{"":""},{"":""}] 친구를 JSON.parse하기
												var list = JSON.parse(d);

												//alert(list.length);
												//console.log(list);
												var tr = $(".useInfo tr");
												tr.remove();
												var tbody = $(".useInfo");
												for (var i = 0; i < list.length; i++) {
													tbody
															.append('	<tr>'
																	+ '		<td>'
																	+ ((usePageNumber - 1)
																			* '${boardSize}' + (i + 1))
																	+ '</td>'
																	+ '		<td>'
																	+ list[i].houseName
																	+ '</td>'
																	+ '		<td>'
																	+ "삭제"
																	+ '</td>'
																	+ '	</tr>');
												}
												useCurrentPage = usePageNumber;
												useResult2 = parseInt((useCurrentPage - 1)
														/ pageBlock);
												useStartPage = useResult2
														* pageBlock + 1;
												useEndPage = useStartPage
														+ pageBlock - 1;
												useSetPaging(pageBlock,
														useResult,
														usePageCount,
														useCurrentPage,
														useResult2,
														useStartPage,
														useEndPage);
												usePageClick(pageBlock,
														useResult,
														usePageCount,
														useCurrentPage,
														useResult2,
														useStartPage,
														useEndPage);
											},
											error : function(a, b, c) {
												console.log(a);
												alert(b);
												alert(c);
											}
										});
							});

		}
		//4.setPaging 함수
		function useSetPaging(pageBlock, useResult, usePageCount,
				useCurrentPage, useResult2, useStartPage, useEndPage) {

			$(".pagination point").children().remove();

			//alert("pageBlock: "+pageBlock+", result:"+result+", pageCount: "+pageCount+",\n result2: "+result2+", startPage: "+startPage+", endPage: "+endPage+", currentPage: "+currentPage);
			if (useEndPage > usePageCount) {
				useEndPage = usePageCount;
			}
			if (useStartPage > 1) {
				$(".pagination point")
						.append(
								'<li class="page-item houseZzimFirstPage"><a class="page-link">[처음]</a></li>'
										+ '<li class="page-item houseZzimBeforePage"><a class="page-link">[이전]</a></li>');
			}
			for (var i = useStartPage; i <= useEndPage; i++) {
				if (i == useCurrentPage) {
					$(".pagination point").append(
							'<li class="page-item active"><a class="page-link">'
									+ i + '</a></li>');
				} else {
					$(".pagination point").append(
							'<li class="page-item"><a class="page-link">' + i
									+ '</a></li>');
				}
			}
			if (useEndPage < usePageCount) {
				$(".pagination point")
						.append(
								'<li class="page-item houseZzimNextPage"><a class="page-link">[다음]</a></li>'
										+ '<li class="page-item houseZzimEndPage"><a class="page-link">[끝]</a></li>');
			}
		}
	</script>
	<div id="tabs">
		<ul>
			<li><a href="#fragment-1"><span>내가 쓴 체험 후기</span></a></li>
			<li><a href="#fragment-2"><span>내가 쓴 게스트하우스 후기</span></a></li>
		</ul>

		<div id="fragment-1">
			<c:forEach var="expReview" items="${myExpreviewList}"
				varStatus="status">

				<ul class="thumbnails">
					<li class="span4">
						<div class="thumbnail">
							<img alt="img loading"
						width="200" height="200"
						src="<spring:url value='/image/${expReview.mainImgName}'/>">
							<h3>${expReview.exName}</h3>
							<p><textarea rows="5" cols="40" name="revContent"
								disabled="disabled">${expReview.revContent}</textarea></p>
								<div>
							<button onclick="javascript:focusExpReview('${status.count}')">수정</button>
							&nbsp;
							<button
								onclick="javascript:delExpRev('${root}','${expReview.exReserveCode}')">삭제</button>

							<input type="hidden" name="exReserveCode"
								value=${expReview.exReserveCode } />
						</div>
						</div>
					</li> 
				</ul>

				<input type="hidden" name="expReview" value="${myExpreviewList}" />
				<input type="hidden" name="countExpReview" value="${countExpReview}" />
				<input type="hidden" class="expSeq" value="${status.count }" />

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
				
				<ul class="thumbnails">
					<li class="span4">
						<div class="thumbnail">
							<img alt="img loading"
						width="200" height="200"
						src="<spring:url value='/image/${houseReview.mainImgName}'/>">
							<h3>${houseReview.houseName}</h3>
							<p><textarea rows="5" cols="40" name="revContent"
								disabled="disabled">${expReview.revContent}</textarea></p>
								<div>
							<button onclick="javascript:focusExpReview('${status.count}')">수정</button>
						
							<button
								onclick="javascript:delExpRev('${root}','${expReview.exReserveCode}')">삭제</button>

							<input type="hidden" name="exReserveCode"
								value=${expReview.exReserveCode } />
						</div>
						</div>
					</li> 
				</ul>
			
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