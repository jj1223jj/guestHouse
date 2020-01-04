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

<input type="hidden" name="myExpreviewList" value="${myExpreviewList}"/>

	<div>
		<c:if test="${countExpReview ==0 }">
			<span>작성한 체험 후기가 없습니다.</span>
		</c:if>

		<c:if test="${countExpReview >0 }">
			<table class="table"
				style="vertical-align: middle; text-align: center; margin-left: -20rem;">
				<tbody class="pointInfo">
					<c:forEach var="expReview" items="${myExpreviewList}"
						varStatus="status">

						<div>
							<div style="float: left">
								<div style="text-align: left; margin-bottom: 1rem;">작성일 :
									<fmt:formatDate value="${expReview.revDate}"
										pattern="yyyy-MM-dd" />
								</div>
								<div>
									<textarea
										style="float: left; border: 1px solid #008489; background: white"
										rows="6" cols="50" name="revContent" disabled="disabled">${expReview.revContent}</textarea>
								</div>
							</div>

							<div>
								<div>
									<img alt="img loading" width="250" height="160" style="margin-top: 2.6rem;"
										src="<spring:url value='/exImage/${expReview.mainImgName}'/>">
								</div>
							</div>
						</div>
						<div style="float: left; margin-top: 1rem;">
							<span><button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal"
									style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;"
									data-target="#myModal${status.count}">수정</button></span> <span><button
									type="button" class="btn btn-primary btn-lg"
									data-toggle="modal"
									style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;"
									data-target="#delModal${status.count}">삭제</button></span>
									<span style="margin-left: 25rem;">
										<c:set var="exName" value="${expReview.exName}"/>
										<a href="${root}/experience/exPage.do?exCode=${expReview.exCode}">${fn:substring(exName,0,20)}.....</a>
									</span>
						</div>
						<br />
						<br />
						<br />
						<br />


						<!-- 삭제 Modal -->
						<div class="modal fade" id="delModal${status.count}" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
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
											onclick="delExpRev('${root}','${expReview.exReserveCode}')">네</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>

									</div>
								</div>
							</div>
						</div>

						<!-- 수정 Modal -->
						<div class="modal fade" id="myModal${status.count}" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
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
										<textarea style="float: left; border: 1px solid #008489; background: white"
										rows="5" cols="40" name="expRevContent">${expReview.revContent}</textarea>
										
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											style="background: #008489; border: 1px solid #008489;"
											onclick="expUpdateOk('${root}','${expReview.exReserveCode}','${status.count}')">수정완료</button>
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

		<c:if test="${countExpReview>0 }">
			<fmt:parseNumber var="pageCount" integerOnly="true"
				value="${countExpReview/boardSize+(countExpReview%boardSize==0 ? 0:1)}" />
			<c:set var="pageBlock" value="${5}" />
			<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}"
				integerOnly="true" />
			<c:set var="startPage" value="${result*pageBlock+1}" />
			<c:set var="endPage" value="${startPage+pageBlock-1}" />

			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>

			<c:if test="${startPage>pageBlock}">
				<a
					onclick="paging('${root}','${startPage-pageBlock}','${countExpReview}','${countHouseReview}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a
					onclick="paging('${root}', '${i}','${countExpReview}','${countHouseReview}')"
					id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a
					onclick="paging('${root}','${startPage+pageBlock}','${countExpReview}','${countHouseReview}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${currentPage}" id="currentPage" />

	</div>
</body>
</html>