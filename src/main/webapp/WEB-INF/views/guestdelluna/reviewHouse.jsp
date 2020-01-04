<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script type="text/javascript" src="${root}/resources/javascript/guestdelluna/myReview.js"></script>
<title>내가 쓴 후기</title>
</head>
<body>

	<input type="hidden" name="myHousereviewList"
		value="${myHousereviewList}" />
	<div>
		<c:if test="${countHouseReview ==0 }">
			<span>작성한 게스트하우스 후기가 없습니다.</span>
		</c:if>

		<c:if test="${countHouseReview >0 }">
			<div class="container">
				<table class="table table-hover"
					style="vertical-align: middle; margin-left: -20rem; text-align: center;">
					<tbody class="pointInfo">
						<c:forEach var="houseReview" items="${myHousereviewList}"
							varStatus="status">

							<div>
								<div style="float: left">
									<div style="text-align: left; margin-bottom: 1rem;">작성일 :
										<fmt:formatDate value="${houseReview.revDate}"
											pattern="yyyy-MM-dd" />
									</div>
									<div>
										<textarea
											style="float: left; border: 1px solid #008489; background: white"
											rows="6" cols="50" name="revContent" disabled="disabled">${houseReview.revContent}</textarea>
									</div>
								</div>

								<div>
									<div>
										<img alt="img loading" width="250" height="160"
											style="margin-top: 2.6rem;"
											src="<spring:url value='/image/${houseReview.mainImgName}'/>">
									</div>
								</div>
							</div>
							<div style="float: left; margin-top: 1rem;">
								<span><button type="button"
										class="btn btn-primary btn-lg" data-toggle="modal"
										style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;"
										data-target="#myHouseModal${status.count}">수정</button></span> <span><button
										type="button" class="btn btn-primary btn-lg"
										data-toggle="modal"
										style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;"
										data-target="#houseDelModal${status.count}">삭제</button></span>
										<span style="margin-left: 25.5rem;">		
										<a href="${root}/guestHousePage/guestHouse.do?houseCode=${houseReview.houseCode}">${houseReview.houseName}</a>
										
										</span>
							</div>
							<br />
							<br />
							<br />
							<br />

							<!-- 삭제 Modal -->
							<div class="modal fade" id="houseDelModal${status.count}" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel"
												style="text-align: left">후기 삭제</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">선택한 후기를 삭제하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												style="background: #008489; border: 1px solid #008489;"
												onclick="delHouseRev('${root}','${houseReview.reserveCode}')">네</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>

										</div>
									</div>
								</div>
							</div>

							<!-- 수정 Modal -->
							<div class="modal fade" id="myHouseModal${status.count}" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel"
												style="text-align: left">후기 수정</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<textarea rows="5" cols="40" name="houseRevContent">${houseReview.revContent}</textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												style="background: #008489; border: 1px solid #008489;"
												onclick="houseUpdateOk('${root}','${houseReview.reserveCode}','${status.count}')">수정완료</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>

										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>

		<c:if test="${countHouseReview>0 }">
			<fmt:parseNumber var="usePageCount" integerOnly="true"
				value="${countHouseReview/boardSize+(countHouseReview%boardSize==0 ? 0:1)}" />
			<c:set var="usePageBlock" value="${5}" />
			<fmt:parseNumber var="result2"
				value="${(useCurrentPage-1)/usePageBlock}" integerOnly="true" />
			<c:set var="useStartPage" value="${result2*usePageBlock+1}" />
			<c:set var="useEndPage" value="${useStartPage+usePageBlock-1}" />

			<c:if test="${useEndPage>usePageCount}">
				<c:set var="useEndPage" value="${usePageCount}" />
			</c:if>

			<c:if test="${useStartPage>usePageBlock}">
				<a
					onclick="paging('${root}','${useStartPage-usePageBlock}','${countExpReview}','${countHouseReview}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${useStartPage}" end="${useEndPage}">
				<a
					onclick="paging('${root}', '${i}','${countExpReview}','${countHouseReview}')"
					id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${useEndPage < usePageCount}">
				<a
					onclick="paging('${root}','${useStartPage+usePageBlock}','${countExpReview}','${countHouseReview}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${useCurrentPage}" id="useCurrentPage" />

	</div>
</body>
</html>