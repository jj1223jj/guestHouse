<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<title>체험 장바구니 목록</title>
</head>
<body>
	<div>
		<c:if test="${countExpZzim==0 }">
			<span>장바구니에 등록된 체험이 없습니다. 지금 체험들을 둘러보세요!</span>
		</c:if>

		<c:if test="${countExpZzim>0 }">
			<div class="container">
			<table class="table table-hover"
				style="vertical-align: middle; text-align: center;">
				<thead align="center">
					<tr style="font-weight: 800;">
						<td align="center" height="20" width="70">번호</td>
						<td align="center" height="20" width="300">이름</td>
						<td></td>
					</tr>
				</thead>

				<tbody class="pointInfo">
					<c:forEach var="newExpZzimDto" items="${newExpZzimDto}"
						varStatus="status">
						<tr>
							<td align="center" height="20" width="70">${status.count}</td>
							<td align="center" height="20" width="300">
							
							<a href="${root}/experience/exPage.do?exCode=${newExpZzimDto.exCode}">${newExpZzimDto.exName}</a>
							
							</td>
							<td align="center" height="20" width="125"><button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal"
									style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;""
									data-target="#expModal${status.count}">삭제</button></td>
						</tr>
						<!-- Modal -->
						<div class="modal fade" id="expModal${status.count}" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel"
											style="text-align: left">장바구니에서 제거</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div>장바구니에서 제거하시겠습니까?</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											style="background: #008489; border: 1px solid #008489;"
											onclick="deleteExpState('${root}','${newExpZzimDto.exCode}')">네</button>
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
		<c:if test="${countExpZzim>0 }">
			<fmt:parseNumber var="pageCount" integerOnly="true"
				value="${countExpZzim/boardSize+(countExpZzim%boardSize==0 ? 0:1)}" />
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
					onclick="zzimPaging('${root}','${startPage-pageBlock}','${countExpZzim}','${countHouseZzim}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a
					onclick="zzimPaging('${root}', '${i}','${countExpZzim}','${countHouseZzim}')"
					id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a
					onclick="zzimPaging('${root}','${startPage+pageBlock}','${countExpZzim}','${countHouseZzim}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${currentPage}" id="currentPage" />
	</div>
</body>
</html>