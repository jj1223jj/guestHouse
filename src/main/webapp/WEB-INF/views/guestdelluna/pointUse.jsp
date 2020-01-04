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
<title>포인트 사용 내역</title>
</head>
<body>
<body>

	<div align="center">

		<c:if test="${countUse==0 }">
			<h5>사용된 포인트가 없습니다.</h5>
		</c:if>

		<c:if test="${countUse > 0}">
			<div class="container">
				<table class="table table-hover">
					<thead align="center">
						<tr>
							<th align="center" height="20" width="125">번호</th>
							<th align="center" height="20" width="300">사용장소</th>
							<th align="center" height="20" width="125">사용일</th>
							<th align="center" height="20" width="125">사용포인트</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="usePoint" items="${usePoint}" varStatus="status">
							<tr>
								<td align="center" height="20" width="125">${status.count}</td>
								<td align="center" height="20" width="300">${usePoint.usePlace}</td>
								<td align="center" height="20" width="125"><fmt:formatDate
										value="${usePoint.useDate}" pattern="yyyy-MM-dd" /></td>
								<td align="center" height="20" width="125">${usePoint.usePoint}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>

		<c:if test="${countUse>0 }">
			<fmt:parseNumber var="usePageCount" integerOnly="true"
				value="${countUse/boardSize+(countUse%boardSize==0 ? 0:1)}" />
			<c:set var="usePageBlock" value="${5}" />
			<fmt:parseNumber var="result2" value="${(useCurrentPage-1)/usePageBlock}"
				integerOnly="true" />
			<c:set var="useStartPage" value="${result2*usePageBlock+1}" />
			<c:set var="useEndPage" value="${useStartPage+usePageBlock-1}" />

			<c:if test="${useEndPage>usePageCount}">
				<c:set var="useEndPage" value="${usePageCount}" />
			</c:if>

			<c:if test="${useStartPage>usePageBlock}">
				<a
					onclick="paging('${root}','${useStartPage-usePageBlock}','${countAccu}','${countUse}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${useStartPage}" end="${useEndPage}">
				<a onclick="paging('${root}', '${i}','${countAccu}','${countUse}')"
					id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${useEndPage < usePageCount}">
				<a
					onclick="paging('${root}','${useStartPage+usePageBlock}','${countAccu}','${countUse}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${useCurrentPage}" id="useCurrentPage" />
	</div>
</body>
</body>

</html>