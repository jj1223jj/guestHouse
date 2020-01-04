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
<title>게스트하우스 장바구니 목록</title>
</head>
<body>
	<div>
		<c:if test="${countHouseZzim==0 }">
			<span>장바구니에 등록된 게스트하우스가 없습니다. 지금 게스트하우스들을 둘러보세요!</span>
		</c:if>

		<c:if test="${countHouseZzim>0 }">
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

				<tbody class="useInfo">
					<c:forEach var="newHouseZzimDto" items="${newHouseZzimDto}"	varStatus="status">
						<tr>
							<td align="center" height="20" width="70">${status.count}</td>
							<td align="center" height="20" width="300">
							
							<a href="${root}/guestHousePage/guestHouse.do?houseCode=${newHouseZzimDto.houseCode}">${newHouseZzimDto.houseName}</a>
							
							</td>
							<td align="center" height="20" width="125"><button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal"
									data-target="#myModal${status.count}"
									style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;">
									삭제</button></td>
						</tr>
						<!-- Modal -->
						<div class="modal fade" id="myModal${status.count}" tabindex="-1" role="dialog"
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
											onclick="deleteHouse('${root}','${newHouseZzimDto.houseCode}')">네</button>
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

		<c:if test="${countHouseZzim>0 }">
			<fmt:parseNumber var="usePageCount" integerOnly="true"
				value="${countHouseZzim/boardSize+(countHouseZzim%boardSize==0 ? 0:1)}" />
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
					onclick="zzimPaging('${root}','${useStartPage-usePageBlock}','${countExpZzim}','${countHouseZzim}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${useStartPage}" end="${useEndPage}">
				<a onclick="zzimPaging('${root}', '${i}','${countExpZzim}','${countHouseZzim}')"
					id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${useEndPage < usePageCount}">
				<a
					onclick="zzimPaging('${root}','${useStartPage+usePageBlock}','${countExpZzim}','${countHouseZzim}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${useCurrentPage}" id="useCurrentPage" />

	</div>
</body>
</html>