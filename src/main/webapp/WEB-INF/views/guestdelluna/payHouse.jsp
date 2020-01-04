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
<title>게스트하우스 결제 내역</title>
</head>
<body>
	<c:if test="${countPayHouse ==0 }">
		<span>게스트하우스 결제 내역이 없습니다.</span>
	</c:if>

	<c:if test="${countPayHouse >0 }">
		<div class="container">
			<table class="table table-hover"
				style="vertical-align: middle; text-align: center;">
				<thead align="center">
					<tr style="font-weight: 800;">
						<th align="center" height="20" width="70">번호</th>
						<th align="center" height="20" width="300">이름</th>
						<th align="center" height="20" width="200">결제 날짜</th>
						<th align="center" height="20" width="125">예약여부</th>
						<th align="center" height="20" width="140">가격</th>
						<th align="center" height="20" width="125"></th>
					</tr>
				</thead>
				<tbody class="useInfo">
					<c:forEach var="newHouseResDto" items="${newHouseResDto}"
						varStatus="status">
						<tr>
							<td align="center" height="20" width="70">${status.count}</td>
							<td align="center" height="20" width="300">
							
							<a href="${root}/guestHousePage/guestHouse.do?houseCode=${newHouseResDto.houseCode}">${newHouseResDto.houseName}</a>
							
							</td>
							<td align="center" height="20" width="200"><fmt:formatDate
									value="${newHouseResDto.reserveDate}" pattern="yyyy-MM-dd" /></td>
							<td align="center" height="20" width="125">${newHouseResDto.state}</td>
							<td align="center" height="20" width="140">${newHouseResDto.payment}원</td>
							<td align="center" height="20" width="125"><button
									type="button" class="btn btn-primary btn-lg"
									data-toggle="modal"
									style="background: #008489; border: 1px solid #008489; line-height: 1rem; margin-top: -0.1rem;"
									data-target="#houseModal${status.count}">삭제</button></td>

						</tr>

						<!-- Modal -->
						<div class="modal fade" id="houseModal${status.count}" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
		</div>
	</c:if>

	<c:if test="${countPayHouse>0 }">
		<fmt:parseNumber var="usePageCount" integerOnly="true"
			value="${countPayHouse/boardSize+(countPayHouse%boardSize==0 ? 0:1)}" />
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
				onclick="paging('${root}','${useStartPage-usePageBlock}','${countPayExp}','${countPayHouse}')">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${useStartPage}" end="${useEndPage}">
			<a
				onclick="paging('${root}', '${i}','${countPayExp}','${countPayHouse}')"
				id="${i}">${i}</a>
		</c:forEach>
		<c:if test="${useEndPage < usePageCount}">
			<a
				onclick="paging('${root}','${useStartPage+usePageBlock}','${countPayExp}','${countPayHouse}')">[다음]</a>
		</c:if>
	</c:if>
	<input type="hidden" value="${useCurrentPage}" id="useCurrentPage" />

</body>
</html>