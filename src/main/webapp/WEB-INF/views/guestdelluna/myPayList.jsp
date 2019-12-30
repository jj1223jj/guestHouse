<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 1.맨 위에 페이지 블록 -->
<c:set var="pageBlock" value="${3}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root}/resources/xhr/xhr.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/jquery/flick/jquery-ui.js"></script>
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/mypaylist.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/bootstrap.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/bootstrap.js"></script>
<title>결제 내역</title>
<style type="text/css">
html {
	font-size: 16px;
}

.infoMenu {
	margin-left: 2rem;
}

.vl {
	border-left: 0.0625rem solid #dddddd;
	height: 16rem;
	float: left;
	margin-left: 6rem;
	margin-top: 4.4rem;
}

.page-link {
	background-color: #008489;
	border-color: #008489;
}

.aMenu {
	color: #333;
}
</style>

<script>
	// 2.jquery 온로드
	$(function() {

		// 		3.페이징에 필요한 변수들 선언
		var pageBlock = $
		{
			pageBlock
		}
		;
		var result = parseInt('${countPayExp/boardSize}');
		var pageCount = '${countPayExp%boardSize}' == 0 ? result : result + 1;
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
							else if (liClass == 'page-item payExpFirstPage')
								accuPageNumber = 1;
							else if (liClass == 'page-item payExpBeforePage')
								accuPageNumber = startPage - pageBlock;
							else if (liClass == 'page-item payExpNextPage')
								accuPageNumber = startPage + pageBlock;
							else if (liClass == 'page-item payExpEndPage')
								accuPageNumber = pageCount;
							// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
							// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
							$
									.ajax({
										url : "${root}/guestdelluna/payExpAjax.do?accuPageNumber="
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
														list[i].reserveDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
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
																+ list[i].state
																+ '</td>'
																+ '		<td>'
																+ "삭제"
																+ '</td>'
																+ '	</tr>');
											}
											currentPage = accuPageNumber;
											result2 = parseInt((currentPage - 1)
													/ pageBlock);
											startPage = result2 * pageBlock + 1;
											endPage = startPage + pageBlock - 1;
											setPaging(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
											pageClick(pageBlock, result,
													pageCount, currentPage,
													result2, startPage, endPage);
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
							'<li class="page-item payExpFirstPage"><a class="page-link">[처음]</a></li>'
									+ '<li class="page-item payExpBeforePage"><a class="page-link">[이전]</a></li>');
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
							'<li class="page-item payExpNextPage"><a class="page-link">[다음]</a></li>'
									+ '<li class="page-item payExpEndPage"><a class="page-link">[끝]</a></li>');
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
		var useResult = parseInt('${countPayHouse/boardSize}');
		var usePageCount = '${countPayHouse%boardSize}' == 0 ? useResult
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
	function usePageClick(pageBlock, useResult, usePageCount, useCurrentPage,
			useResult2, useStartPage, useEndPage) {

		$(".pagination li[class!='page-item active']")
				.click(
						function() {
							var liClass = $(this).attr("class");
							var usePageNumber = 0;
							if (liClass == 'page-item')
								usePageNumber = $(this).children().text();
							else if (liClass == 'page-item payHouseFirstPage')
								usePageNumber = 1;
							else if (liClass == 'page-item payHouseBeforePage')
								usePageNumber = useStartPage - pageBlock;
							else if (liClass == 'page-item payHouseNextPage')
								usePageNumber = useStartPage + pageBlock;
							else if (liClass == 'page-item payHouseEndPage')
								usePageNumber = usePageCount;
							// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
							// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
							$
									.ajax({
										url : "${root}/guestdelluna/payHouseAjax.do?usePageNumber="
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
												var date = new Date(
														list[i].reserveDate);
												var dateString = date
														.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
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
																+ dateString
																+ '</td>'
																+ '		<td>'
																+ list[i].state
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
											useSetPaging(pageBlock, useResult,
													usePageCount,
													useCurrentPage, useResult2,
													useStartPage, useEndPage);
											usePageClick(pageBlock, useResult,
													usePageCount,
													useCurrentPage, useResult2,
													useStartPage, useEndPage);
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
	function useSetPaging(pageBlock, useResult, usePageCount, useCurrentPage,
			useResult2, useStartPage, useEndPage) {

		$(".pagination point").children().remove();

		//alert("pageBlock: "+pageBlock+", result:"+result+", pageCount: "+pageCount+",\n result2: "+result2+", startPage: "+startPage+", endPage: "+endPage+", currentPage: "+currentPage);
		if (useEndPage > usePageCount) {
			useEndPage = usePageCount;
		}
		if (useStartPage > 1) {
			$(".pagination point")
					.append(
							'<li class="page-item payHouseFirstPage"><a class="page-link">[처음]</a></li>'
									+ '<li class="page-item payHouseBeforePage"><a class="page-link">[이전]</a></li>');
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
							'<li class="page-item payHouseNextPage"><a class="page-link">[다음]</a></li>'
									+ '<li class="page-item payHouseEndPage"><a class="page-link">[끝]</a></li>');
		}
	}
</script>


</head>
<body>
	<div id="wrap">
		<div style="text-align: center;">
			${memberDto.memberName}님의 결제내역입니다.</div>

		<div class="menuL">
			<ul>
				<li><a href="${root}/guestdelluna/allMyReview.do">후기</a></li>
				<c:if test="${memberCode == memberDto.memberCode}">
					<li><a href="${root}/guestdelluna/memberUpdate.do">회원수정</a></li>
					<li><a href="${root}/guestdelluna/managePoint.do">포인트관리</a></li>
					<li><a href="${root}/guestdelluna/payList.do">결제내역</a></li>
					<c:if test="${memberLevel == 'Host'}">
						<hr style="border: 0.0315rem solid #ddd;" />
						<li><a href="${root}/host/reservationView.do">숙소예약현황</a></li>
						<li><a href="${root}/host/exReservationView.do">체험예약현황</a></li>
						<li><a href="${root}/host/salesView.do">매출조회</a></li>
						<li><a href="${root}/host/houseManagement.do">게스트하우스 관리</a></li>
						<li><a href="${root}/host/exManagement.do">체험 관리</a></li>
					</c:if>
					<li><a href="${root}/guestdelluna/memberDelete.do">회원탈퇴</a></li>
				</c:if>
			</ul>
		</div>

		<div class="menuR">
			<div id="tabs" class="container"
				style="width: 70rem; margin-top: 1.5rem;">
				<ul style="border: 0px; background: #ffffff;">
					<li
						style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: -1rem"><a
						href="#fragment-1"><span>체험 결제 내역</span></a></li>
					<li
						style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: 9rem;"><a
						href="#fragment-2"><span>게스트하우스 결제 내역</span></a></li>
				</ul>
				<div id="fragment-1">
					<div>
						<c:if test="${countPayExp ==0 }">
							<span>체험 결제 내역이 없습니다.</span>
						</c:if>

						<c:if test="${countPayExp >0 }">
							<table class="table"
								style="vertical-align: middle; text-align: center;">
								<thead class="thead-light">
									<tr style="font-weight: 800;">
										<td>번호</td>
										<td>이름</td>
										<td>체험 예약 날짜</td>
										<td>예약여부</td>
										<td></td>
									</tr>
								</thead>
								<tbody class="pointInfo">
									<c:forEach var="newExpResDto" items="${newExpResDto}"
										varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${newExpResDto.exName}</td>
											<td><fmt:formatDate value="${newExpResDto.reserveDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${newExpResDto.state}</td>
											<td><button type="button" class="btn btn-primary btn-lg"
													data-toggle="modal"
													style="background: #008489; border: 1px solid #008489;"
													data-target="#myModal">삭제</button></td>
										</tr>
										<!-- Modal -->
										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabel"
															style="text-align: left">결제 취소</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<div>결제를 취소하시겠습니까?</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															style="background: #008489; border: 1px solid #008489;"
															onclick="deleteExpPayState('${root}','${newExpResDto.exReserveCode}')">네</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">닫기</button>

													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<!-- 								5. 페이징 숫자들 넣을 div와 ul을 선언 -->
						<div class="pointPageContainer">
							<ul class="pagination">

							</ul>
						</div>
					</div>
				</div>

				<div id="fragment-2">
					<div>
						<c:if test="${countPayHouse ==0 }">
							<span>게스트하우스 결제 내역이 없습니다.</span>
						</c:if>

						<c:if test="${countPayHouse >0 }">
							<table class="table"
								style="vertical-align: middle; text-align: center;">
								<thead class="thead-light">
									<tr style="font-weight: 800;">
										<td>번호</td>
										<td>이름</td>
										<td>게스트하우스 예약 날짜</td>
										<td>예약여부</td>
										<td></td>
									</tr>
								</thead>
								<tbody class="useInfo">
									<c:forEach var="newHouseResDto" items="${newHouseResDto}"
										varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${newHouseResDto.houseName}</td>
											<td><fmt:formatDate
													value="${newHouseResDto.reserveDate}" pattern="yyyy-MM-dd" /></td>
											<td>${newHouseResDto.state}</td>
											<td><button type="button" class="btn btn-primary btn-lg"
													data-toggle="modal" data-target="#myModal"
													onclick="onModal()"
													style="background: #008489; border: 1px solid #008489;">삭제</button></td>
										</tr>

										<!-- Modal -->
										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabel"
															style="text-align: left">결제 취소</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<div>결제를 취소하시겠습니까?</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															style="background: #008489; border: 1px solid #008489;"
															onclick="deleteHousePayState('${root}','${newHouseResDto.reserveCode}')">네</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">닫기</button>

													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<!-- 								5. 페이징 숫자들 넣을 div와 ul을 선언 -->
						<div class="usePageContainer">
							<ul class="pagination point">

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});
</script>
</html>