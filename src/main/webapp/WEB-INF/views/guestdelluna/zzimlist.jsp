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
	src="${root}/resources/javascript/guestdelluna/myzzimlist.js"></script>
<link rel="stylesheet"
	href="${root}/resources/javascript/jquery/flick/jquery-ui.css">
<link rel="stylesheet"
	href="${root}/resources/css/guestdelluna/bootstrap.css">
<script type="text/javascript"
	src="${root}/resources/javascript/guestdelluna/bootstrap.js"></script>
<title>장바구니</title>
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
		var result = parseInt('${countExpZzim/boardSize}');
		var pageCount = '${countExpZzim%boardSize}' == 0 ? result : result + 1;
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
	function pageClick(pageBlock, result, pageCount, currentPage, result2,startPage, endPage) {

		$(".pagination li[class!='page-item active']").click(
						function() {
							var liClass = $(this).attr("class");
							var accuPageNumber = 0;
							if (liClass == 'page-item')
								accuPageNumber = $(this).children().text();
							else if (liClass == 'page-item expZzimFirstPage')
								accuPageNumber = 1;
							else if (liClass == 'page-item expZzimBeforePage')
								accuPageNumber = startPage - pageBlock;
							else if (liClass == 'page-item expZzimNextPage')
								accuPageNumber = startPage + pageBlock;
							else if (liClass == 'page-item expZzimEndPage')
								accuPageNumber = pageCount;
							// 6. 컨트롤러에서 받을 url과 requestMapping 만들기
							// 7. 현재페이지를 넘겨줘서 해당 컨트롤러와 서비스imp확인하기
							$.ajax({
										url : "${root}/guestdelluna/zzimExpAjax.do?accuPageNumber="+accuPageNumber,
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
														list[i].exDate);
												var dateString = date.getFullYear()
														+ "-"
														+ date.getMonth()
														+ "-" + date.getDate();
												tbody.append('	<tr>'
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
			$(".pagination").append(
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
		var usePageCount = '${countHouseZzim%boardSize}' == 0 ? useResult : useResult + 1;
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

		$(".pagination li[class!='page-item active']").click(
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
							$.ajax({
										url : "${root}/guestdelluna/zzimHouseAjax.do?usePageNumber="+usePageNumber,
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
												tbody.append('	<tr>'
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
			$(".pagination point").append(
							'<li class="page-item houseZzimNextPage"><a class="page-link">[다음]</a></li>'
									+ '<li class="page-item houseZzimEndPage"><a class="page-link">[끝]</a></li>');
		}
	}
</script>
</head>
<body>
	<div class="row">
		<div class="span9">
			<div style="margin-left: 28rem; text-align: center;">
				${memberDto.memberName}님의 장바구니 목록입니다</div>

			<div class="row">
				<div class="span2">
					<div style="float: left; margin-left: 6rem; margin-top: 6rem;">
						<div class="infoMenu">
							<a class="aMenu" href="${root}/guestdelluna/myInfo.do">내 정보</a>
						</div>
						<br />
						<div class="infoMenu">
							<a class="aMenu" href="${root}/guestdelluna/memberUpdate.do">회원
								수정</a>
						</div>
						<br />
						<div class="infoMenu">
							<a class="aMenu" href="${root}/guestdelluna/memberDelete.do">회원
								탈퇴</a>
						</div>
						<br />
						<div class="infoMenu">
							<a class="aMenu" href="${root}/guestdelluna/managePoint.do">포인트
								관리</a>
						</div>
						<br />
						<div class="infoMenu">
							<a class="aMenu" href="${root}/guestdelluna/payList.do">결제 내역</a>
						</div>
						<br />
						<div class="infoMenu">
							<a class="aMenu" href="${root}/guestdelluna/allMyReview.do">내가
								쓴 후기</a>
						</div>
					</div>
				</div>

				<div class="span1">
					<div class="vl"></div>
				</div>

				<div class="span6" style="margin-top: 4rem">
					<div id="tabs" class="container"
						style="width: 70rem; margin-top: 1.5rem; margin-left: 8rem;">
						<ul style="border: 0px; background: #ffffff;">
							<li
								style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: -1rem"><a
								href="#fragment-1"><span>체험 장바구니 내역</span></a></li>
							<li
								style="float: left; border: 0px; background: #ffffff; margin-top: -3rem; margin-left: 9rem;"><a
								href="#fragment-2"><span>게스트하우스 장바구니 내역</span></a></li>
						</ul>
						<div id="fragment-1">
							<div>
								<c:if test="${countExpZzim==0 }">
									<span>장바구니에 등록된 체험이 없습니다. 지금 체험들을 둘러보세요!</span>
								</c:if>
							
								<c:if test="${countExpZzim>0 }">
									<table class="table"
										style="vertical-align: middle; text-align: center;">
										<thead class="thead-light">
											<tr style="font-weight: 800;">
												<td>번호</td>
												<td>체험 이름</td>
												<td>체험 날짜</td>
												<td></td>
											</tr>
										</thead>

										<tbody class="pointInfo">
											<c:forEach var="newExpZzimDto" items="${newExpZzimDto}"
												varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td>${newExpZzimDto.exName}</td>
													<td><fmt:formatDate
															value="${newExpZzimDto.exStartDate}" pattern="yyyy-MM-dd" /></td>
													<td
														onclick="deleteExpState('${root}','${newExpZzimDto.exCode}')">삭제</td>
												</tr>
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
								<c:if test="${countHouseZzim==0 }">
									<span>장바구니에 등록된 게스트하우스가 없습니다. 지금 게스트하우스들을 둘러보세요!</span>
								</c:if>
							
								<c:if test="${countHouseZzim>0 }">
								<table class="table"
									style="vertical-align: middle; text-align: center;">
									<thead class="thead-light">
										<tr style="font-weight: 800;">
											<td>번호</td>
											<td>게스트하우스 이름</td>
											<td></td>
										</tr>
									</thead>

									<tbody class="useInfo">
										<c:forEach var="newHouseZzimDto" items="${newHouseZzimDto}"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${newHouseZzimDto.houseName}</td>
												<td
													onclick="deleteHouse('${root}','${newHouseZzimDto.houseCode}')">삭제</td>
											</tr>
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
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});
</script>
</html>