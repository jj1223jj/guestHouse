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
<title>포인트 적립 내역</title>
</head>
<body>

	<div align="center">

		<c:if test="${countAccu==0 }">
			<h5>적립된 포인트가 없습니다.</h5>
		</c:if>

		<c:if test="${countAccu > 0}">
			<div class="container">
				<table class="table table-hover">
					<thead align="center">
						<tr>
							<th align="center" height="20" width="125">번호</th>
							<th align="center" height="20" width="300">적립장소</th>
							<th align="center" height="20" width="125">적립일</th>
							<th align="center" height="20" width="125">적립포인트</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="accuPoint" items="${accuPoint}" varStatus="status">
							<tr>
								<td align="center" height="20" width="125">${status.count}</td>
								<td align="center" height="20" width="300">${accuPoint.accuPlace}</td>
								<td align="center" height="20" width="125"><fmt:formatDate
										value="${accuPoint.accuDate}" pattern="yyyy-MM-dd" /></td>
								<td align="center" height="20" width="125">${accuPoint.accuPoint}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>

		<c:if test="${countAccu>0 }">
			<fmt:parseNumber var="pageCount" integerOnly="true"
				value="${countAccu/boardSize+(countAccu%boardSize==0 ? 0:1)}" />
			<c:set var="pageBlock" value="${5}" />
			<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}"
				integerOnly="true" />
			<c:set var="startPage" value="${result*pageBlock+1}" />
			<c:set var="endPage" value="${startPage+pageBlock-1}" />

			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>

			<c:if test="${startPage>pageBlock}">
				<a onclick="paging('${root}','${startPage-pageBlock}','${countAccu}','${countUse}')">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a onclick="paging('${root}', '${i}','${countAccu}','${countUse}','${countUse}')" id="${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a onclick="paging('${root}','${startPage+pageBlock}','${countAccu}','${countUse}')">[다음]</a>
			</c:if>
		</c:if>
		<input type="hidden" value="${currentPage}" id="currentPage" />
	</div>
</body>
</html>